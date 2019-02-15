module ADT where

data TrafficLight = Green | Amber | Red

instance Show TrafficLight where
    show Green = "Green"
    show Amber = "Amber"
    show Red   = "Red"

one_step_down :: TrafficLight -> TrafficLight
one_step_down Green = Amber
one_step_down Amber = Red
one_step_down Red = Red

one_step_up :: TrafficLight -> TrafficLight
one_step_up Green = Green
one_step_up Amber = Green
one_step_up Red   = Amber


stop_cars :: TrafficLight -> TrafficLight
stop_cars Green = stop_cars (one_step_down Green)
stop_cars Amber = one_step_down Amber
stop_cars Red =    Red