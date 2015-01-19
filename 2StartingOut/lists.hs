lostNumbers = [4,8,15,16,23,42]

-- wow, loading the script with + instead of ++ 
-- resulted in a huge error message
zeroToFive = [0,1,2] ++ [3,4,5]

hi = "hello" ++ " " ++ "world"

useAColon = 5:[1,2,3,4,5]

indexMe = "indexMe"
index = indexMe !! 0

b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
b1 = b ++ [[1,1,1,1]]
b2 = [6,6,6]:b
bIndex2 = b !! 2

-- see notes for comparisons and some basic functions

-- Another example - get all numbers from 50 to 100 whose 
-- remainder when divided with the number 7 is 3?
predicateExample = [x | x <- [50..100], x `mod` 7 ==3]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

nouns = ["hobo","frog","pope"]
adjectives = ["lazy","grouchy","scheming"]
epicHilarity = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
length' xs = sum [1 | _ <- xs]

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

listsInLists = [[1,2,3],[4,5,6],[7,8,9]]
removeAllOddsInListsInLists xxs = [ [x | x <- xs, even x] | xs <- xxs ]