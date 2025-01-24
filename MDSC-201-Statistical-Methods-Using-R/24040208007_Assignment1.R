# R Programming Assignment
# By Sumiran Rai
# Roll No: 24040208007

# -----------------------------------------------
# VECTORS
# -----------------------------------------------

# Vector of strings
fruits <- c("banana", "apple", "orange")
# Print fruits
print("Vector of fruits:")
print(fruits)

# Vector of numerical values
numbers <- c(1, 2, 3)
# Print numbers
print("Vector of numbers:")
print(numbers)

# Vector with numerical values in a sequence
num <- 1:10
# Print sequence
print("Sequence of numbers:")
print(num)

# Vector of logical values
log_values <- c(TRUE, FALSE, TRUE, FALSE)
# Print logical values
print("Vector of logical values:")
print(log_values)

# Vector Length
print("Length of the fruits vector:")
print(length(fruits))

# Sort a Vector
fruits <- c("banana", "apple", "orange", "mango", "lemon")
numbers <- c(13, 3, 5, 7, 20, 2)
print("Sorted fruits:")
print(sort(fruits))
print("Sorted numbers:")
print(sort(numbers))

# Access Vectors
fruits <- c("banana", "apple", "orange")
print("Access first fruit:")
print(fruits[1])
print("Access first and third fruits:")
print(fruits[c(1, 3)])

# -----------------------------------------------
# LISTS
# -----------------------------------------------

# List of strings
thislist <- list("apple", "banana", "cherry")
# Print the list
print("Original list:")
print(thislist)

# Access List Items
print("Access first item in the list:")
print(thislist[1])

# Change Item Value
thislist[1] <- "blackcurrant"
# Print updated list
print("Updated list:")
print(thislist)

# List Length
print("Length of the list:")
print(length(thislist))

# Join Two Lists
list1 <- list("a", "b", "c")
list2 <- list(1, 2, 3)
list3 <- c(list1, list2)
print("Combined list:")
print(list3)

# -----------------------------------------------
# MATRICES
# -----------------------------------------------

# Create a matrix
thismatrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2)
# Print the matrix
print("Matrix of numbers:")
print(thismatrix)

# Access Matrix Items
thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow = 2, ncol = 2)
print("Matrix of strings:")
print(thismatrix)
print("Access specific item (row 1, column 2):")
print(thismatrix[1, 2])

# Number of Rows and Columns
print("Dimensions of the matrix:")
print(dim(thismatrix))

# Matrix Length
print("Length of the matrix:")
print(length(thismatrix))

# -----------------------------------------------
# ARRAYS
# -----------------------------------------------

# Create a 1D array
thisarray <- c(1:10)
print("1D Array:")
print(thisarray)

# Create a multidimensional array
multiarray <- array(thisarray, dim = c(4, 3, 2))
print("Multidimensional Array:")
print(multiarray)

# Access Array Items
print("Access specific item (row 2, column 3, depth 2):")
print(multiarray[2, 3, 2])

# Amount of Rows and Columns
print("Dimensions of the multidimensional array:")
print(dim(multiarray))

# Array Length
print("Length of the array:")
print(length(multiarray))

# -----------------------------------------------
# DATA FRAMES
# -----------------------------------------------

# Create a data frame
print("Original Data Frame:")
df <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Student1", "Student2", "Student3"),
  Score = c(95, 89, 76),
  Passed = c(TRUE, TRUE, FALSE)
)
print(df)

# Summarize the Data Frame
print("Summary of the data frame:")
print(summary(df))

# Add Rows
new_row <- rbind(df, c(4, "Student4", 88, TRUE))
print("Data Frame after adding a row:")
print(new_row)

# Add Columns
new_col <- cbind(df, Year = c("1 year", "2 year", "3 year"))
print("Data Frame after adding a column:")
print(new_col)

# Amount of Rows and Columns
print("Dimensions of the data frame:")
print(dim(df))

# Data Frame Length
print("Length of the data frame:")
print(length(df))

# Combine Data Frames
df1 <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Student1", "Student2", "Student3"),
  Score = c(95, 89, 76),
  Passed = c(TRUE, TRUE, FALSE)
)

df2 <- data.frame(
  ID = c(4, 5, 6),
  Name = c("Student4", "Student5", "Student6"),
  Score = c(95, 89, 76),
  Passed = c(TRUE, TRUE, FALSE)
)

New_df <- rbind(df1, df2)
print("Combined Data Frame:")
print(New_df)

# -----------------------------------------------
# FACTORS
# -----------------------------------------------

# Create a vector and factor
apple_color <- c("red", "yellow", "green", "orange", "violet")
factor_apple <- factor(apple_color)

# Print the factor
print("Factor of apple colors:")
print(factor_apple)

# Print number of levels
print("Number of levels in the factor:")
print(nlevels(factor_apple))

# Factor Length
print("Length of the factor:")
print(length(factor_apple))

# Access Factors
print("Access second level in the factor:")
print(factor_apple[2])

