## ## A couple of functions for  matrices inversion with caching 


makeCacheMatrix <- function(x = matrix()) {
  # Initializing the inverse 
  inv <- NULL
  
  # Setting the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Getting the matrix
  get <- function() x  # Return the matrix
  
  # Setting the inverse of the matrix
  setinverse <- function(inverse) inv <<- inverse
  
  # Getting  the inverse of the matrix
  
  getinverse <- function() inv # Return the inverse
  
  #list of the methods
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


#  Computing the inverse of the  matrix returned by "makeCacheMatrix"
# "cachesolve" should retrieve the inverse from the cache if the inverse has already been calculated.

cacheSolve <- function(x, ...) {
  # The inverse of 'x'
  inv <- x$getinverse()
  
  # The  inverse if its already set
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  ## Get the matrix from our objec
  data <- x$get()
  
  inv <- solve(data)
  
  x$setinverse(inv)
  
  inv
}
