# Haskell

- "Weak Head Normal Form" (WHNF) evaluates an expression until a data
  constructor or unapplied lambda is reached at the outermost level.
  Therefore `(1, "foo" ++ "bar")` is WHNF with the tuple as the constructor.
- Left associativity: `2 * 3 * 4 => (2 * 3) * 4`.
  Right associativity: `2 ^ 3 ^ 4 => 2 ^ (3 ^ 4)`.
- Low precedence is like bigger parenthesis.
- Integer ops: `div` (round down), `rem` (remainder), `quot` (quotient, round
  towards zero), `mod` (like `rem` but for modular division)
  - `20/-6 = -3.33`, ``20 `div` (-6) == -4``, ``20 `quot` (-6) == -3``.
  - ``y * (x `quot` y) + (x `rem` y) == x``
  - ``y * (x `div` y) + (x `mod` y) == x``
  - The result of `mod` has the sign of the divisor (second arg).
  - The result of `rem` has the sign of the dividend (first arg).
- `==` for equals, `/=` for not equals!
- Negative numbers have to be quoted in most cases because `-` (`negate`) is an
  unary prefix operator.
- You have to parenthesize infix operators to refer to them as values: `(>>)`.
- Cons builds lists: `'r' : "ebecca" == "rebecca"`. `!!` for indexing.
- "Sectioning" is the partial application of an infix operator
- `if ... then ... else ...`
- Matching on cases:

      case scrutinee of
        pattern1 -> expr1
        pattern2 -> expr2
        ...
- Guard blocks:

      abs :: Integer -> Integer
      abs x
        | x < 0     = (-x
        | otherwise = x
- Raise an exception: `error "Foo"`.
- List comprehensions: `[x^2 | x <- [1..10]]`.
  - Filtering: `[x^2 | x <- [1..10], rem x 2 == 0]`.
  - Cartesian product: `[x^y | x <- [1..5], y <- [2, 3]]`.
- The bottom value is spelled `undefined`.
- The "spine" is the connective glue that holds a collection together
- A scan is a fold that returns a list of intermediate results


## Variable conventions

- Type variables are generally `a`, `b`, `c`...
- Function arguments are generally `f`, `g`, `h`... sometimes with primes `'`.

## Types

    data Name = Variant | OtherVariant | ... deriving Typeclass

- `Int`: Fixed. `Integral`: Arbitrarily sized.
- `Float` and `Double`: single- and double-precision floats.
- `Rational`: fraction.
- `Fixed a`: fixed decimal type. `Fixed E9` has 9 digits after the decimal.
- `Scientific`: `Integer` coeff, `Int` exponent. (3rd party lib.)
- https://rufflewind.com/img/haskell-numeric-type-classes.svg
- `foo :: Type` is a type judgement, interprets `foo` as `Type`, useful for
  ints and such.
- `Fractional a => a -> a` is syntax for a type constraint
  - Multiple constraints: `(Num a, Num b) => a -> b -> b`.
  - Unconstrained variable: `a -> a` (I think the forall is implicit?)
- "Type defaulting"?

### Typeclasses

Declaring:

    class Foo a where
      func :: a -> Baz

With a superclass:

    class Foo a => Bar a where ...

Implementing:

    instance Foo Bool where
      func b = ...

With a constraint:

    instance Eq a => Eq (Foo a) where ...

## GHCi

- `:load` to load a file (with `.hs` extension)
- `:import` to load a module (like `Data.Char`)
- `:t` for type info
- `:info` shows type info, typeclass impls, associativity, precedence
- `:sprint` shows what's been evaluated. Note that polymorphic values like
  `Num a => a` will show as unevaluated.
