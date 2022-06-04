## These two functions in combination demonstrates
## how to use cache data to return inverse of a 
## specially created matrix

## The following function creates the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
     }
  get <- function() x
  setinverse <- function(solve) m <<- solve(x)
  getinverse <- function() m
  list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## The following function checks if the inverse matrix
## is in the cache and try to retrieve it. if not present 
## it calculates the inverse matrix
cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
    }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
   m
  }
        ## Return a matrix that is the inverse of 'x'

