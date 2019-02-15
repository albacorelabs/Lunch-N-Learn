module Stack_bak where

data Stack a = Empty | Cons a (Stack a)

instance Show a => Show (Stack a) where
    show (Empty) = "Empty]"
    show (Cons a s) = "[" ++ show a ++ "," ++ show s


instance Functor Stack where
    fmap f (Cons a s) = Cons (f a) (fmap f s)
    fmap _ (Empty) = Empty

someFunc :: IO ()
someFunc = putStrLn "someFunc"

push :: a -> Stack a -> Stack a
push x (Cons y s) = Cons x (Cons y s)
push x Empty      = Cons x (Empty)

pop :: Stack a -> (a, Stack a)
pop (Cons y s) = (y,s)
pop Empty      = error "POPPING EMPTY STACK"

chainContext :: (a, Stack a) -> (Stack a -> (a, Stack a)) -> (a,Stack a)
chainContext (_,s) f = f s

peek :: Stack a -> (a,Stack a)
peek stack@(Cons y _) = (y ,stack)
peek Empty = error "Peeking Empty list"

doublePop :: Num a =>  Stack a -> (a, Stack a)
doublePop s = (pop s) `chainContext` pop 

do_stuff :: Integer
do_stuff = fst $ doublePop start
    where
        start = push 2 Empty
        