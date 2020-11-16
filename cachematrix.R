## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##Example function

  # makeVector <- function(x = numeric()) {
  #   m <- NULL
  #   set <- function(y) {
  #     x <<- y
  #     m <<- NULL
  #   }
  #   get <- function() x
  #   setmean <- function(mean) m <<- mean
  #   getmean <- function() m
  #   list(set = set, get = get,
  #        setmean = setmean,
  #        getmean = getmean)
  # }
    # cachemean <- function(x, ...) {
    #   m <- x$getmean()
    #   if(!is.null(m)) {
    #     message("getting cached data")
    #     return(m)
    #   }
    #   data <- x$get()
    #   m <- mean(data, ...)
    #   x$setmean(m)
    #   m
    # }
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL #Initiate inverse
  set <- function(y) {#Store new matrix value and reset inverse
    x <<- y 
    inv <<- NULL 
  }
  #Returns the matrix
  get <- function() {x} 
  #Extract de inverse out the environment
  setinverse <- function(solve) {inv <<- solve}
  #Returns the inverse
  getinverse <- function() {inv}
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
  # Retrieve a inverse matrix of x
  inv <- x$getinverse() 
  #Chek if inverse is already get or compute them instead
  if(!is.null(inv)) {
    message("retrieving inverse from cache...")
    return(inv)
  }
  data <- x$get() 
  inv <- solve(data, ...)
  x$setinverse(inv) 
  inv
}
