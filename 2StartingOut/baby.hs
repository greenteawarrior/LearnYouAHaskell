doubleMe x = x + x

-- v0 for version 0
doubleUs x y = x*2 + y*2

-- common strategy in Haskell: making basic functions 
-- that are obviously correct and then combining
-- them into more complex functions 
doubleUs' x y = doubleMe x + doubleMe y 

doubleSmallNumber x = if x > 100
					    then x 
					    else x*2

-- ' usually denotes a strict version of a function 
-- (one that isn't lazy) or a slightly modified version 
-- of a function or variable
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"