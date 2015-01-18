## [Starting Out](http://learnyouahaskell.com/starting-out)

### [Ready, set, go!](http://learnyouahaskell.com/starting-out#ready-set-go)
* Open up a terminal and type in **ghci**!
* For brevity, do :set prompt "ghci> "
* Try some simple arithmetic. P.S. put parens around negative numbers
* Boolean stuff too! **&&** , **||**, and **not**
* Test for equality with **==**
* Try something like **5 + "llama"** --> type error!
* **5 + 4.0** works though. 5 can be either an integer or floating-point; 4.0 can't be an integer, so 5 "adapts"
* more on types later.
* We've been using functions! 
    * * (asterisk) is a function that takes two numbers and multiplies them. it's an _infix_ funuction
    * most functions that aren't used with numbers are _prefix_ functions
    * functions are usually prefix, so assume that a func is prefix from now on
    * call prefix functions by writing the function name, a space, and then the parameters separated by spaces
    * **succ** takes anything with a defined successor and returns that successor. try **succ 8**
    * try **min** and **max** on any two numbers
    * function application has highest precedence. see code samples below
    ```
    ghci> succ 9 + max 5 4 + 1
    16
    ghci> (succ 9) + (max 5 4) + 1
    16
    ```
    * also, parens seem to be a good idea
    ```ls 
    ghci> succ 9 * 10
    100
    ghci> succ (9 * 10)
    91
    ```
    * with 2-parameter functions, use backticks to call it like an infix function. (for clarity's sake :D)
    ```
    ghci> div 92 10
    9
    ghci> 92 `div` 10
    9
    ```
    * spaces, not parentheses, are used for function application
    * parentheses in Haskell seem to be more about order of operations

### [Baby's first functions](http://learnyouahaskell.com/starting-out#babys-first-functions)
* let's make our own functions!
* see baby.hs 
* functionName parameter1 parameter2 parameterEtc = defineWhatThisFunctionDoes
* because **+** works on integers or floating point numbers, the doubleMe function also works on any integer or floating point number
* common strategy in Haskell: making basic functions that are obviously correct and then combining them into more complex functions - see **doubleUs'**
* functions in Haskell don't have to be in any particular order
* if statements! see **doubleSmallNumber**
    * unlike other languages... in Haskell, the else part is mandatory since every expression and every function must return something!
    * an if statement is an _expression_ - a piece of code that returns a value
        * **5** is an expression b/c it returns 5
        * **4 + 8** and **x + y** are also expressions
* ' usually denotes a strict version of a function (one that isn't lazy) or a slightly modified version of a function or variable
* functions can't begin with uppercase letters
* when a function doesn't take any parameters, it's a _definition_ (or a _name_)
    * 
    ```
    conanO'Brien = "It's a-me, Conan O'Brien!"
    ```
    * because we can't change what names and functions mean once we've defined them, conanO'Brien and the string "It's a-me, Conan O'Brien!" can be used interchangeably

### [An intro to lists](http://learnyouahaskell.com/starting-out#an-intro-to-lists)
* "Lists are SO awesome."
* this section: basics of lists, strings (which are lists), and list comprehensions!
* see lists.hs for some examples that aren't in this file
* in Haskell, lists are homogeneous - they store several elements of the same type
* Note: The **let** keyword can define a name right in ghci. Doing **let a = 1** inside ghci is equivalent to writing **a = 1** in the script and then loading it.
* lists are denoted by square brackets and their values are separated by commas
* characters are a character between single quotes
* strings are lists of characters. "hello" is syntactic sugar for ['h', 'e', 'l', 'l', 'o'] 
* as such, we can use list functions on strings! :)
* put two lists together with the **++** operator
```
ghci> "hello" ++ " " ++ "world"
"hello world"
ghci> ['w','o'] ++ ['o','t']
"woot"
```
* Emily's comment: tab completion in ghci is also your friend
* be careful when you use **++** on long strings. when you put together two lists, internall, Haskell has to walk through the whole list on the LHS of **++**. putting something at the beginning of the list with the **:** operator is instantaneous. :)
```
ghci> 'A':" SMALL CAT"
"A SMALL CAT"
ghci> 5:[1,2,3,4,5]
[5,1,2,3,4,5]
```
* **:** (colon) takes a number and a list of numbers OR a character and a list of characters. on the other hand, **++** takes two lists. even if you're just adding one thing to the end of a list with **++**, you have to surround it with [ ] so it becomes a list.
* **[1,2,3]** is syntactic sugar for **1:2:3:[ ]** 
* note: [ ], [ [ ] ], and [ [ ], [ ], [ ] ] are all different.
    * [ ] is an empty list
    * [ [ ] ] is a list that contains one empty list
    * [ [ ], [ ], [ ] ] is a list that contains three empty lists
* use **!!** to get an element out of a list by index. 
* indices start at 0! 
```
ghci> "Haskell" !! 2
's'
ghci> [9.4, 11, 10, 8, 22.9] !! 0
9.4
```
* if you try to access an nth element with n >= length of the list, you'll get an error, so be careful!
* you can have lists within lists (within lists within lists, and so on...). the lists within lists can be of different lengths, but they can't be of different types!
* lists can be compared if the stuff they contain can be compared
* **<**, **<=**, **>**, and **>=** compare things in lexicographical order - i.e. look at the zeroth thing in each of the things to be compared. if the zeroth thing is equal, then look at the first thing... it's like putting things in alphabetical order.
* some basic functions that operate on lists:
    * **head**
    * **tail**
    * **last**
    * **init**
* ... graphically explained by the list monster!
![alt text](http://s3.amazonaws.com/lyah/listmonster.png "a Haskell list monster")
* be careful about using these basic functions on empty lists - this error won't be caught at compile time so take precaution!! (i.e. with some conditional to check the length of the list, perhaps? ;D)
* more functions:
    * **length**
    * **null** - use this function instead of listVariable == [ ]
    * **reverse** - reverses a list
    * **take** - takes number and a list. extracts that number of elements from the beginning of the list.
    ```
    ghci> take 3 [5,4,3,2,1]
    [5,4,3]
    ghci> take 1 [3,9,3]
    [3]
    ghci> take 5 [1,2]
    [1,2]
    ghci> take 0 [6,6,6]
    []
    ```
    * ^if we try to take more elements than there are in the list, it returns the list. if we try to take 0 elements, we get an empty list.
    * drop - similar to take, but it drops the number of elements from the beginning of the list
    ```
    ghci> drop 3 [8,4,2,1,5,6]
    [1,5,6]
    ghci> drop 0 [1,2,3,4]
    [1,2,3,4]
    ghci> drop 100 [1,2,3,4]
    []
    ```
    * **maximum**
    * **minimum**
    * **sum**
    * **product**
    * **elem** - takes a thing and a list of things, and tells us if that thing is an element of the list. it's usually called infix-style because it's easier to read that way:
    ```
    ghci> 4 `elem` [3,4,5,6]
    True
    ghci> 10 `elem` [3,4,5,6]
    False
    ```
* we'll work more with list functions soon :D
