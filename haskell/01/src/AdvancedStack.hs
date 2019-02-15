{-# LANGUAGE GADTs #-}

module AdvancedStack where

import Data.Function ((&))


data Z
data S n

data Stack n a where
    Empty :: Stack Z a
    Top   :: a -> Stack m a -> Stack (S m) a

instance Show a => Show (Stack n a) where
    show (Empty) = "Empty]"
    show (Top a s) = "[" ++ show a ++ "," ++ show s 

instance Functor (Stack n) where
    fmap f Empty = Empty
    fmap f (Top a s) = (Top $ f a) $ fmap f s

pop :: Stack (S n) a -> (a, Stack n a)
pop (Top a s) = (a , s)

peek :: Stack (S n) a -> (a, Stack (S n) a)
peek t@(Top a s) = (a, t)

push :: a -> Stack n a -> Stack (S n) a
push a s  = Top a s

safe_DoublePop :: Num a =>  Stack (S (S n)) a -> (a, Stack n a)
safe_DoublePop s = (pop s) & snd & pop

safe_do_stuff :: Integer
safe_do_stuff = fst $ safe_DoublePop start
    where
        start = push 2 Empty