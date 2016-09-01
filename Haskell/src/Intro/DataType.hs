module Intro.DataType
    ( Point (..)
    , Shape (..)
    , surface
    , translate
    , baseCircle
    , baseRectangle
    ) where

-- Point -> An ordered x, y pair.
data Point = Point Float Float deriving (Show)

-- Circle -> A point of center and a radius.
-- Rectangle -> The top left and right bottom coordinates of a rectangle.
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x0 y0) (Point x1 y1)) = abs (x1 - x0) * abs  (y1 - y0)

translate :: Shape -> Float -> Float -> Shape
translate (Circle (Point x0 y0) r) x y = Circle (Point (x0 + x) (y0 + y)) r
translate (Rectangle (Point x0 y0) (Point x1 y1)) x y = Rectangle (Point (x0 + x) (y0 + y)) (Point (x1 + x) (y1 + y))

baseCircle :: Float -> Shape
baseCircle = Circle (Point 0 0)

baseRectangle :: Float -> Float -> Shape
baseRectangle w h = Rectangle (Point 0 h) (Point w 0)
