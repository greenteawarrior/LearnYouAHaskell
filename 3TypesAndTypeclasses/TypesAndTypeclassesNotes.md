## [Types and Typeclasses](http://learnyouahaskell.com/types-and-typeclasses)

###[Believe the Type](http://learnyouahaskell.com/types-and-typeclasses#believe-the-type)
* Haskell has a static type system
* Type of every expression is known at copmile time --> writing safer code because you catch the error at compile time before it's run
* Haskell has type inference - it knows your type!! ;)
* **:t** command will tell us the type of given input
```
ghci> :t "EMR"
"EMR" :: [Char]
ghci> :t (True, 'r')
(True, 'r') :: (Bool, Char)
ghci> :t 5==7
5==7 :: Bool
```
* **::** (colon colon) says "has type of"
* Lists vs. Tuples:
    * **"EMR"** is a **[Char]** - a list of characters, denoted by square brackets
    * **(True, 'r')* is **(Bool, Char)**, which is a specific type different from other tuples, like **('a', 'b', 'c')**, which is **(Char, Char, Char)**
* Functions also have types! We should be good people and give functions explicit type declarations when we write them from now on.
    * 
    ```
    removeNonUppercase :: [Char] -> [Char]
    removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
    ```
    * 
    ```
    addThree :: Int -> Int -> Int -> Int ->
    addThree x y z  = x + y + z
    ```
    * Separate parameters with **->**
    * No special distinction between the parameters and return type; return type is just the last item in the declaration
    * Later we'll see why it's just **->** and not some more exlpcit label between the params and return types ;)
    * If you're unsure what types the things in your function should be, write it and cdhck with **:t**
* Some types!
    * **Int** (used fo whole numbers, has a min -2147483648 and max 2147483647 value)
    * **Integer** (like an integer, but it's not bounded. less efficient than Int)
    * **Float** (real floating point, single precision)
    * **Double** (real floating point, double precision)
    * **Boolean** (True or False)
    * **Char** (charater in single quotes. a string is a list of characters)
    * There are an infinite number of **tuple types** because the type is determined by their length and components. () is also its own type.

###[Type Variables](http://learnyouahaskell.com/types-and-typeclasses#type-variables)
* allows you to write very general functions if they don't rely on the types in them O_O #omg
* an example **head**:
```
ghci> :t head
head :: [a] -> a
```
* functions with type variables are called **polymorphic functions**
* we usually give type variables single-character names (such as a, b, c, d...)
* another example **fst**: 
```
ghci> :t fst
fst :: (a, b) -> a
```
* ^ **fst** takes a tuple which contains two types and returns an element which is of the same type as the pair's first component. therefore it works on a pair that contains any two types. just because a nd b are different type variables doesn't mean the two inputs have to be different when you use the function.

###[Typeclasses 101](http://learnyouahaskell.com/types-and-typeclasses#typeclasses-101)
* typeclass - an interface that defines some behavior
* if a type is part of a typeclass, it supports and implements the behavior the typeclass describes
* they're **not** like OOP classes.
```
ghci> :t (==)
(==) :: Eq a => a -> a -> Bool
```
* ^ note: equality operator **==** is a function. so are the other operators (+, *, -, /, etc). if the function is composed of only special characters, it's considered an infix function by default. thus if we want to examine its type or pass it into another function or call it as a prefix function, we have to surround it in parens. 
* everything before the **=>** symbol is a **class constraint**
* reading the result of :t (==):
    * the equality functoin takes in any two values of the same type and returns a **Bool**. the type of those two values must be a member of the **Eq** class (this is the constraint in action).
    * **Eq** typeclass is an interface for testing equality - all Haskell types except for the IO types are functions are part of the **Eq** typeclass. 
* **elem** function has a type of **(elem) :: Eq a => a -> [a] -> Bool** because it uses **==** over a list to check whether some value we're looking for is in it
* some basic typeclasses
    * Eq - for types that support equality tseting. if there's an Eq class constraint, it uses == or /= somewhere inside its definition.
    * Ord - for types that have an ordering. Ordering is a type that can be GT, LT, or EQ (greater than, lesser than, and equal, respectively).
    * Show - can be presented as strings. most popular functoin of this typeclass is **show** - takes a member of Show and presents it to us as a string.
    * Read - opposite typeclass of Show. 
        * it'll take a string and returns a type which is a member of Read. we have to do something with the result so Haskell can infer what the input string's type should be.
        * or... use explicit type annotations with a double colon! (::)
        ``` 
        ghci> read "5"
        <interactive>:8:1:
            No instance for (Read a0) arising from a use of `read'
            The type variable `a0' is ambiguous
            Possible fix: add a type signature that fixes these type variable(s)
            Note: there are several potential instances:
              instance Read () -- Defined in `GHC.Read'
              instance (Read a, Read b) => Read (a, b) -- Defined in `GHC.Read'
              instance (Read a, Read b, Read c) => Read (a, b, c)
                -- Defined in `GHC.Read'
              ...plus 25 others
            In the expression: read "5"
            In an equation for `it': it = read "5"
        ghci> read "5" :: Int
        5
        ghci> read "5" :: Float
        5.0
        ghci> (read "5" :: Float) * 4
        20.0
        ghci> read "[1,2,3,4]" :: [Int]
        [1,2,3,4]
        ghci> read "3(3, 'a')" :: (Int, Char)
        *** Exception: Prelude.read: no parse
        ghci> read "(3, 'a')" :: (Int, Char)
        (3,'a')

        ```
    * Enum - sequentially ordered types. can be enumerated. we use its types in list ranges! Enum members also have defined successors and predecessors (use the **succ** and **pred** functions, respectively)
    types in this class include (), Bool, Char, Ordering, Int, Integer, Float, and Double.
    * Bounded - have an upper and lower bound. **minBound** and **maxBound** are useful (in a sense, they're polymorphic constants). all tuples are also part of Bounded if the components are members of Bounded.
    * Num - a numeric typeclass. its members can act like numbers! (Int, Integer, Float, Double) members of Num must already be friends with Show and Eq. xD
    * Integral - includes only integral (whole) numbers. members are Int and Integer.
    * Floating - includes only floating point numbers. members are Float and Double.
    * useful function **fromIntegral**:
    ```
    ghci> :t fromIntegral
    fromIntegral :: (Integral a, Num b) => a -> b
    ```
    * ^ **fromIntegral** takes an integral number and turns it into a more general number (member of Num). it's useful when you want integral and FP types to work together nicely. ^_^
    * another **fromIntegral** example with length:
    ```     
    ghci> :t length
    length :: [a] -> Int
    ghci> length [0,1,2,3,4] + 3.2

    <interactive>:19:22:
        No instance for (Fractional Int) arising from the literal `3.2'
        Possible fix: add an instance declaration for (Fractional Int)
        In the second argument of `(+)', namely `3.2'
        In the expression: length [0, 1, 2, 3, ....] + 3.2
        In an equation for `it': it = length [0, 1, 2, ....] + 3.2
    ghci> fromIntegral (length [0,1,2,3,4]) + 3.2
    8.2
    ```
    * ^ for some reason, length's type declaration is **length :: [a] -> Int** instead of something friendlier/more general like **(Num b) => length :: [a] -> b**