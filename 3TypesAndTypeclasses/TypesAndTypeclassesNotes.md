## [Types and Typeclasses](http://learnyouahaskell.com/types-and-typeclasses)

###[Believe the Type](http://learnyouahaskell.com/types-and-typeclasses#believe-the-type)
* Haskell has a static type system
* Type of every expression is known at copmile time --> writing safer code because you catch the error at compile time before it's run
* Haskell has tpye inference - it knows your type!! ;)
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

