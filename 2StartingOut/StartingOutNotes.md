## [Starting Out](http://learnyouahaskell.com/starting-out)

### [Ready, set, go!](http://learnyouahaskell.com/starting-out#ready-set-go)
* Open up a terminal and type in **ghci**!
* For brevity... 
```
:set prompt "ghci> "
```
* Try some simple arithmetic. P.S. put parens around negative numbers!
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
    * a pair of square brackets [ ] is an empty list
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
    * **drop** - similar to take, but it drops the number of elements from the beginning of the list
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

### [Texas ranges](http://learnyouahaskell.com/starting-out#texas-ranges)
* ranges are ways of making lists that are arithmetic sequences of elements that can be enumerated
* works for numbers and characters
* examples: 
    * [1..20] is equivalent to writing out all the numbers from 1 to 20 in a list
    * ['a'..'z']
    * ['K'..'Z']
* you can also specify a step! just separate the first two elements with a comma and then specify what the upper limit is.
```
ghci> [2,4..20]
[2,4,5,6,8,10,12,14,16,18,20]
ghci> [3,6..20]
[3,6,9,12,15,18]
```
* note 1: power series won't work with ranges
* note 2: you still have to specify the first two elements of a decreasing series
```
ghci> [20, 19..1]
[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
```
* note 3: floating point numbers in ranges can get pretty funky... beware!
* woah! you can use ranges to make infinite lists by not specifying an upper limit?! what does that even mean?! #excited
* excerpt: "For now, let's examine how you would get the first 24 multiples of 13. Sure, you could do **[13,26..24*13]**. But there's a better way: **take 24 [13,26..]**. Because Haskell is lazy, it won't try to evaluate the infinite list immediately because it would never finish. It'll wait to see what you want to get out of that infinite lists. And here it sees you just want the first 24 elements and it gladly obliges."
* functions that produce infinite lists:
    * **cycle** takes a list a cycles it into an infinite list. if you just display the result, it will go on forever so you have to slice it off somewhere (via **take** or something else).
    ```
    ghci> take 10 (cycle[1,2,3])
    [1,2,3,1,2,3,1,2,3,1]
    ghci> take 12 (cycle "LOL ")
    "LOL LOL LOL "
    ```
    * **repeat** takes an element and produces an infinite list of just that element. it's like cycling a list with only one element.
    ```
    ghci> take 10 (repeat 5)
    [5,5,5,5,5,5,5,5,5,5] 
    ```
    * ^ however it might be simpler to just use the **replicate** function if you want some number of the same element in a list. 
    ```
    ghci> replicate 3 10 
    [10,10,10]
    ```

### [I'm a list comprehension](http://learnyouahaskell.com/starting-out#im-a-list-comprehension)
* Let's get the first ten even numbers
```
ghci> [x*2 | x <- [1..10]]

```
* Now let's add a condition (aka predicate) to the comprehension. Predicates go after the binding parts and are then separated by a comma. The predicate in the example below is x*2 >= 12. Let's get only elements that, when doubled, are greater than or equal to 12...
```
ghci> [x*2 | x <- [1..10], x*2 >= 12]

```
* Another example - get all numbers from 50 to 100 whose remainder when divided with the number 7 is 3? 
```
ghci> [x | x <- [50..100], x `mod` 7 ==3]
[52,59,66,73,80,87,94]
```
* Aww yeah! This strategy of combing through lists in a certain way is called **filtering**. We took a list of numbers and filted them by the predicate.
* Describe what this one does:
```
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x] 
```
* ^ btw: the function **odd* returned **True** on an odd number and **False** on an even number. The element is included in the list only if all the predicates evaluate to **True**.
* We can also have more than one predicate:
```
ghci> [x | x <- [10, 20], x /= 13, x =/ 15, x =/19]
[10,11,12,14,16,17,18, 20]
```
* We can also draw from several lists. When this happens, comprehensions produce all combinations of the given lists and then goins them by the supplied output function. 
* Get the products of all the possible combinations between the two lists **[2,5,10]** and **[8,10,11]**
```
ghci> [ x*y | x <- [2,5,10], y <- [8,10,11]]
[16,20,22,40,50,55,80,100,110]  
```
* Slight modification: getting all the products > 50
```
ghci> [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
[55,80,100,110]
```
* epic hilarity with combining adjectives and nouns xD
```
ghci> let nouns = ["hobo","frog","pope"]
ghci> let adjectives = ["lazy","grouchy","scheming"]
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog","grouchy pope","scheming hobo","scheming frog","scheming pope"]
```
* Making our own version of **length**
```
length' xs = sum [1 | _ <- xs]
```
* ^ _ (underscore) means that we don't care what we'll draw from the list so instead of writing a variable name we'll never use, we'll use an underscore
* Strings are lists, so we can use comprehensions to process/producue strings!
* Example:
```
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
```
* try it out:
```
ghci> removeNonUppercase "Hahaha! Aha!""
"HA"
ghci> removeNonUppercase "IdontLIKEFROGS"
"ILIKEFROGS"
```
* You can also do nested list comprehensions when operating on nested lists!!
* ex. Remove all odd numbers without flattening the list of lists
```
ghci> let xxs = [[1,2,3],[4,5,6],[7,8,9]]
ghci> [ [x | x <- xs, even x] | xs <- xxs ]
[[2],[4,6],[8]]
```
* You can write list comprehensions across several lines. If you're not ghci it's better to split longer list comprehensions across multiple lines, especially if they're nested. hashtag:formattingthing