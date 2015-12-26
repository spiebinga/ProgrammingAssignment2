## With these functions you can calculate the inverse of a matrix, and if it has already been calculated before (or in any case a non-NULL value has been assigned), it will retrieve its value from its cache memory. For long calculations this could save considerable time.


## makeCacheMatrix creates a special "matrix" object. It is actually a list of the functions set(), get(), setinverse() and getinverse().

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve takes as argument the "list of functions" created before. It can retrieve the matrix that was the original input, and check if it's inverse has been calculated before, and otherwise calculate it.

cacheSolve <- function(x, ...) {
	m <- x$getinverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	thematrix <- x$get()
	m <- solve(thematrix, ...)
	x$setinverse(m)
	m
        ## Return a matrix that is the inverse of 'x'
}
