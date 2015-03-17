## These two functions allow for the efficient calculation of the inverse
## of a matrix. Specifically, the inverse is only calculated once and then
## cached. Subsequent requests for the inverse use the cached value.

## Creates a "CacheMatrix" object which is a container for a matrix
## that also caches the matrix's inverse instead of recalculating it

makeCacheMatrix <- function(x = matrix()) {
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
