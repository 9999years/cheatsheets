# Haskell

- Something called "Weak Head Normal Form" (WHNF).
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

## GHCi

- `:load` to load a file (with `.hs` extension)
- `:t` for type info
- `:info` shows type info, associativity, precedence
