"""
Run Value Iteration across multiple (gamma, theta) configs and print a report.

Run:
  python tweak.py
"""

import numpy as np
from traffic_environment import TrafficEnv
import rl_planners

# SETTINGS
MAX_STEPS      = 500
CRITICAL_TOTAL = 25    # total cars violation threshold
CRITICAL_DIR   = 15    # per-direction violation threshold
SEED           = 42

CONFIGS = [
    {"label": "Short-sighted",     "gamma": 0.1,  "theta": 1e-6},
    {"label": "Baseline",          "gamma": 0.5,  "theta": 1e-6},
    {"label": "Far-sighted",       "gamma": 0.99, "theta": 1e-6},
    {"label": "Loose convergence", "gamma": 0.9,  "theta": 0.5},
    {"label": "Tight convergence", "gamma": 0.9,  "theta": 1e-10},
]

def run_config(cfg, env):
    print(f"\n  Training: {cfg['label']}  (gamma={cfg['gamma']}, theta={cfg['theta']})")

    agent = rl_planners.ValueIterationPlanner(env, gamma=cfg["gamma"], theta=cfg["theta"])

    obs = env.reset(seed=SEED)
    np.random.seed(SEED)
    env.action_space.seed(SEED)

    rewards        = []
    total_cars_log = []
    violations     = 0
    streak         = 0
    max_streak     = 0
    terminated = truncated = False

    for _ in range(MAX_STEPS):
        action = agent.choose_action(obs)
        obs, reward, terminated, truncated, info = env.step(action)
        ns, ew, light = tuple(obs)
        total = ns + ew

        rewards.append(reward)
        total_cars_log.append(total)

        if total >= CRITICAL_TOTAL or ns >= CRITICAL_DIR or ew >= CRITICAL_DIR:
            violations += 1
            streak      = 0
        else:
            streak    += 1
            max_streak = max(max_streak, streak)

        if terminated or truncated:
            obs = env.reset()
            terminated = truncated = False

    return {
        "label":      cfg["label"],
        "gamma":      cfg["gamma"],
        "theta":      cfg["theta"],
        "avg_reward": np.mean(rewards),
        "avg_cars":   np.mean(total_cars_log),
        "violations": violations,
        "viol_pct":   100 * violations / MAX_STEPS,
        "max_streak": max_streak,
    }


def print_report(results):
    w = 72
    print("\n" + "=" * w)
    print("  EXPERIMENT REPORT — Value Iteration")
    print(f"  Steps per config: {MAX_STEPS}  |  "
          f"Critical total: {CRITICAL_TOTAL}  |  Critical per dir: {CRITICAL_DIR}")
    print("=" * w)

    print(f"  {'Config':<22} {'gamma':>6} {'theta':>8} {'AvgReward':>10} {'AvgCars':>8} {'Viol%':>6} {'MaxStreak':>10}")
    print("  " + "-" * (w - 2))

    for r in results:
        print(
            f"  {r['label']:<22} "
            f"{r['gamma']:>6} "
            f"{str(r['theta']):>8} "
            f"{r['avg_reward']:>10.4f} "
            f"{r['avg_cars']:>8.2f} "
            f"{r['viol_pct']:>5.1f}% "
            f"{r['max_streak']:>10}"
        )

    print("=" * w)
    print("\n  HIGHLIGHTS")
    print(f"  Best avg reward   → {min(results, key=lambda x: abs(x['avg_reward']))['label']}")
    print(f"  Fewest violations → {min(results, key=lambda x: x['viol_pct'])['label']}")
    print(f"  Longest streak    → {max(results, key=lambda x: x['max_streak'])['label']}")
    print(f"  Lowest avg cars   → {min(results, key=lambda x: x['avg_cars'])['label']}")
    print("=" * w + "\n")


if __name__ == "__main__":
    env = TrafficEnv(max_steps=MAX_STEPS)
    results = []
    for cfg in CONFIGS:
        results.append(run_config(cfg, env))
    print_report(results)