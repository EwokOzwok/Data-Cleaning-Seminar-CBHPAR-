##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##------------------------------- READING CODE----------------------------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set x to equal the integer 5
x <- 5
# Display the class of x
class(x)


# Set x to equal to 0 if x is greater than 5, and set x equal to 1 if it is NOT greater than 5
x <- ifelse(x > 5, 0, 1)
# Print x
print(x)


# Set x equal to 0 if x is greater than 3 OR less than 6, set x to 1 if it is NOT greater than 3 OR less than 6
x <- ifelse(x > 3 | x < 6, 0, 1)
# Print x
print(x)



# Set x to equal a vector of integers ranging from 1 to 5
x <- c(1:5)
# Display the class of x
class(x)



# For  (each element i in the vector x)...  
for(i in x){ # Open For Loop
  # Set 'value' equal to x + 10 
  value <- i + 10
  
  # and print 'value' to the console
  print(value)
  
} # Close For Loop



# For  (each element i in the vector x)...  
for(i in 1:length(x)){ # Open For Loop
  # IF the element in x is greater than 4, make the element equal to zero, otherwise keep the value the same
  x[i] <- ifelse(x[i] > 4, 0, i)
  
} # Close For Loop

# Print the vector x
print(x)



# Define a function called 'add_five' that accepts an vector input defined inside the function as 'input'
add_five <- function(input){ # Open Function
  
  # for (each element i in 1 through the length of the vector 'input')
  for(i in 1:length(input)){
    # replace the element of input with that element plus five
    input[i] = input[i] + 5
  }
  
  # When done, spit out the new 
  return(input)
} # Close Function



# Set 'new_vector' to equal a vector of integers ranging from 100 to 115
new_vector = c(100:115)

# Set 'new_vector_plus_five' to equal the result of the 'add_five' function
new_vector_plus_five <- add_five(new_vector)

# Print the vector 'new_vector_plus_five'
print(new_vector_plus_five)
