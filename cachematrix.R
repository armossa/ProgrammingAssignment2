## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}



## A pair of functions that inverse matrices with caching 

makeCacheMatrix <- function(m = matrix()) {
  # Initialize the inverse property
  i <- NULL
  
  
  # Set the matrix
  set <- function(mat) {
    m <<- mat
    i <<- NULL
  }
  
  # get the matrix
  
  get <- function() {
    # return the matrix
    m
  }
  # the inverse matrix
  
  setinverse <- function(inverse){
    i <<- inverse
  }
  
  # get the inverse matrix
  
  getinverse <- function(){
    i
  }
  # return list of methods
  list(set = set,
       get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


# Part two

cacheSolve <- function(x, ...) {
  # return the inverse of x
  m <- x$getinverse()
  
  if(!is.null(m)) {
    
    message("getting cached data.")
    
    return(m)
  }
  
  data <- x$get()
  # the inverse via matrix multiplication 
  m <- solve(data) %*% data
  
  x$setinverse(m)
  
  # return the matrix
  m
}