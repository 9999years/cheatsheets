# Haskell

- Something called "Weak Head Normal Form" (WHNF).
- Left associativity: `2 * 3 * 4 => (2 * 3) * 4`.
  Right associativity: `2 ^ 3 ^ 4 => 2 ^ (3 ^ 4)`.
- Integer ops: `div` (round down), `rem` (remainder), `quot` (quotient, round
  towards zero), `mod` (like `rem` but for modular division)
  - `20/-6 = -3.33`, ``20 `div` (-6) == -4``, ``20 `quot` (-6) == -3``.
  - ``y * (x `quot` y) + (x `rem` y) == x``
  - ``y * (x `div` y) + (x `mod` y) == x``
  - The result of `mod` has the sign of the divisor (second arg).
  - The result of `rem` has the sign of the dividend (first arg).

## GHCi

- `:info` shows type info, associativity, precedence
