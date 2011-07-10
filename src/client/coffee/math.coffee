###
simple math
###

# some helpful wrappers to primitive math functions
add = (a, b) -> a + b
sub = (a, b) -> a - b
mul = (a, b) -> a * b
div = (a, b) -> a / b
mod = (a, b) -> a % b

# slightly more complex functions
square = (x) -> mul x, x
cube = (x) -> mul square x, x

# algebraic algorithms
sum = (xs... ) ->
    ret = 0
    add ret, x for x in xs
    return ret

sumList = (xs) ->
    ret = 0
    add ret, x for x in xs
    return ret

###
lambda math
###

# simple recursion wrapper
fold = (xs, f) ->
    f x for x in xs
    