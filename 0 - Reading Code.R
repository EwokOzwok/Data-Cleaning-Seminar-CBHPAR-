library(ARTofR)
ARTofR::xxx_title1('Reading Code')
ARTofR::xxx_title3('Reading code aloud')
ARTofR::xxx_title3('MAR')
ARTofR::xxx_title3('MNAR')


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##------------------------------- READING CODE----------------------------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set x to equal 5 (integer)
x <- 5
# Display the class of x
class(x)


# Set x to equal 0 (if it is greater than 4) OR 1 (if it is less than 4)
x <- ifelse(x > 4, 0, 1)
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
