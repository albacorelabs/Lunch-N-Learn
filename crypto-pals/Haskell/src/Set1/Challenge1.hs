{-# LANGUAGE OverloadedStrings #-}

module Set1.Challenge1 where

hexToB64 :: String -> String
hexToB64 = convertB64 . convertHex

convertHex :: [Char] -> String
convertHex [] = []
convertHex (x:y:ss) = x'++ y' ++ convertHex ss
    where
        x' = hexToBits x
        y' = hexToBits y

convertB64 :: [Char] -> String
convertB64 [] = ""
convertB64 bits
    | length bits > 5 = bitsToB64 (bitsToWord8 $ take 6 bits) : (convertB64 $ drop 6 bits)
    | length bits > 3 = bitsToB64 (bitsToWord8 $ (bits ++ "00")) : "="
    | otherwise = bitsToB64 (bitsToWord8 $ (bits ++ "0000")) : "=="

bitsToWord8 :: String -> Int
bitsToWord8 str = bitsToWord8' (length str - 1) str
    where
        bitsToWord8' :: Int -> String -> Int
        bitsToWord8' (-1) _ = 0
        bitsToWord8' n (x:xs)
            | x == '1'  = 2^n + bitsToWord8' (n-1) xs
            | otherwise = 0 + bitsToWord8' (n-1) xs
    
bitsToB64 :: Int -> Char
bitsToB64 0 = 'A'
bitsToB64 1 = 'B'
bitsToB64 2 = 'C'
bitsToB64 3 = 'D'
bitsToB64 4 = 'E'
bitsToB64 5 = 'F'
bitsToB64 6 = 'G'
bitsToB64 7 = 'H'
bitsToB64 8 =  'I'
bitsToB64 9 =  'J'
bitsToB64 10 = 'K'
bitsToB64 11 = 'L'
bitsToB64 12 = 'M'
bitsToB64 13 = 'N'
bitsToB64 14 = 'O'
bitsToB64 15 = 'P'
bitsToB64 16 = 'Q'
bitsToB64 17 = 'R'
bitsToB64 18 = 'S'
bitsToB64 19 = 'T'
bitsToB64 20 = 'U'
bitsToB64 21 = 'V'
bitsToB64 22 = 'W'
bitsToB64 23 = 'X'
bitsToB64 24 = 'Y'
bitsToB64 25 = 'Z'
bitsToB64 26 = 'a'
bitsToB64 27 = 'b'
bitsToB64 28 = 'c'
bitsToB64 29 = 'd'
bitsToB64 30 = 'e'
bitsToB64 31 = 'f'
bitsToB64 32 = 'g'
bitsToB64 33 = 'h'
bitsToB64 34 = 'i'
bitsToB64 35 = 'j'
bitsToB64 36 = 'k'
bitsToB64 37 = 'l'
bitsToB64 38 = 'm'
bitsToB64 39 = 'n'
bitsToB64 40 = 'o'
bitsToB64 41 = 'p'
bitsToB64 42 = 'q'
bitsToB64 43 = 'r'
bitsToB64 44 = 's'
bitsToB64 45 = 't'
bitsToB64 46 = 'u'
bitsToB64 47 = 'v'
bitsToB64 48 = 'w'
bitsToB64 49 = 'x'
bitsToB64 50 = 'y'
bitsToB64 51 = 'z'
bitsToB64 52 = '0'
bitsToB64 53 = '1'
bitsToB64 54 = '2'
bitsToB64 55 = '3'
bitsToB64 56 = '4'
bitsToB64 57 = '5'
bitsToB64 58 = '6'
bitsToB64 59 = '7'
bitsToB64 60 = '8'
bitsToB64 61 = '9'
bitsToB64 62 = '+'
bitsToB64 63 = '\\'


hexToByte :: Char -> Int
hexToByte '0' = 0
hexToByte '1' = 1
hexToByte '2' = 2
hexToByte '3' = 3
hexToByte '4' = 4
hexToByte '5' = 5
hexToByte '6' = 6
hexToByte '7' = 7
hexToByte '8' = 8
hexToByte '9' = 9
hexToByte 'a' = 10
hexToByte 'b' = 11
hexToByte 'c' = 12
hexToByte 'd' = 13
hexToByte 'e' = 14
hexToByte 'f' = 15

hexToBits :: Char -> String
hexToBits '0' = "0000"
hexToBits '1' = "0001"
hexToBits '2' = "0010"
hexToBits '3' = "0011"
hexToBits '4' = "0100"
hexToBits '5' = "0101"
hexToBits '6' = "0110"
hexToBits '7' = "0111"
hexToBits '8' = "1000"
hexToBits '9' = "1001"
hexToBits 'a' = "1010"
hexToBits 'b' = "1011"
hexToBits 'c' = "1100"  --12
hexToBits 'd' = "1101"
hexToBits 'e' = "1110"
hexToBits 'f' = "1111"