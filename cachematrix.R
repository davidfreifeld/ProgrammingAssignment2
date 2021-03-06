## These two functions allow for the efficient calculation of the inverse
## of a matrix. Specifically, the inverse is only calculated once and then
## cached. Subsequent requests for the inverse use the cached value.

## Creates a "CacheMatrix" object which is a container for a matrix
## that also caches the matrix's inverse instead of recalculating it

makeCacheMatrix <- function(x = matrix()) {
    
    ## The cached inverse is null until setinv() is called
    myInv <- NULL
    
    ## Get and set the underlying matrix data
    set <- function(y) {
        x <<- y
        myInv <<- NULL
    }
    get <- function() x
    
    ## Get and set the cached inverse
    setinv <- function(inv) myInv <<- inv
    getinv <- function() myInv
    
    ## Return a list as the "CacheMatrix" object
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Computes the inverse of a "CacheMatrix". If the inverse has
## already been computed, it just retrieves the result from the
## cache. Otherwise it carries out the calculation.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinv()
    
    if (!is.null(inverse)) {
        ## Return the cached value
        message("getting cached data")
        return(inverse)
    }
    
    ## Compute the inverse, cache it, and return it
    xMatrix <- x$get()
    inverse <- solve(xMatrix, ...)
    x$setinv(inverse)
    inverse
}
