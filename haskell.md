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
        | x < 0     = (-x)
        | otherwise = x
- Raise an exception: `error "Foo"`.
- List comprehensions: `[x^2 | x <- [1..10]]`.
  - Filtering: `[x^2 | x <- [1..10], rem x 2 == 0]`.
  - Cartesian product: `[x^y | x <- [1..5], y <- [2, 3]]`.
- The bottom value is spelled `undefined`.
- The "spine" is the connective glue that holds a collection together
- A scan is a fold that returns a list of intermediate results
- You can `let` inside a `do` block! Just leave out the `in` part.

## Patterns

- As-patterns: `name@pattern`, e.g. `lst@(x:xs)`.
- View patterns (extension): `(expr -> pattern)` applies `expr` and matches
  `pattern` against the result.


## Useful functions / infix operators

- `<$>`: `fmap`
- `pure` is like `return` but for `Applicative`
- `<*>` (apply): `f (a -> b) -> f a -> f b`


## Variable conventions

- Type variables are generally `a`, `b`, `c`...
- Function arguments are generally `f`, `g`, `h`... sometimes with primes `'`.

## Types

    data Name = Variant | OtherVariant | ... deriving Typeclass
    --   ^^^^   ^^^^^^^   ^^^^^^^^^^^^
    --   Type constructor
    --          Data constructors

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
- `newtype Foo = Foo InnerType`. No runtime overhead.
- Records: `data Person = Person { name :: String, age :: Int } deriving (Eq, Show)`.
- Operators that start with a `:` must be an infix type/data constructor.
- `data Maybe a = Just a | Nothing`.
- `data Either a b = Left a | Right b`.
- Monoid: binary associative operation with an identity.
  - Semigroup with identity.
  - Associative: parens can be rearranged.
- Functor: applying a function over/around a structure without altering the
  structure. A generalized version of `map`.

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

### Kinds

The types of types. A "plain" type like `Bool` has kind `*`. A polymorphic type
like `Either` has kind `* -> * -> *` (depending on how many type arguments it
has).

- A "higher-kinded type" is one that needs a type argument before it can be
  instantiated.
- A "lifted" type can be inhabited by bottom. Most types are "lifted" and
  represented by a pointer.
- Unlifted types have kind `#`; native machine types, raw pointers.
  - Special case: newtypes are kind `*` _but_ unlifted.

## GHCi

- `:load` to load a file (with `.hs` extension)
- `:import` to load a module (like `Data.Char`)
- `:t` for type info
- `:info` shows type info, typeclass impls, associativity, precedence
- `:sprint` shows what's been evaluated. Note that polymorphic values like
  `Num a => a` will show as unevaluated.
- `:kind` for kinds!
- `:browse ModuleName` shows exports
- `:m` unloads modules

## Language extensions

- <http://dev.stephendiehl.com/hask/#language-extensions>
- Survey: Which language extensions would you like to be enabled by default?
  <https://taylor.fausak.me/2020/11/22/haskell-survey-results/#s2q5>
- History of language extensions added: <https://gitlab.haskell.org/ghc/ghc/-/wikis/language-pragma-history>
- GHC 9.2 enables a bunch of extensions by default if you set your `language`
  property to `GHC2021` in your `*.cabal` file.
  <https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/control.html>


## Modules & imports

- Exports: `module ModuleName (exports, ...) where`
- Selective imports: `import Data.Bool (bool)` only imports `bool`.
  - `import Data.Bool hiding (bool)` imports everything except `bool`.
- Qualified: `import qualified Data.Bool`, then `Data.Bool.not`
  - Aliased: `import qualified Data.Bool as B`, then `B.not`.
  - Aliased/selective: `import qualified Data.Bool as B (not)` imports `B.not`.
- `import Mod ()` brings typeclass instances into scope, nothing else.
- Data constructors: `import System.IO (BufferMode(NoBuffering))`
  - All constructors: `import System.IO (BufferMode(..))`
  - I think the grammar is similar for typeclasses/methods: <https://www.haskell.org/onlinereport/haskell2010/haskellch5.html#x11-1010005.3>


## Project management

- Cabal: Common Architecture for Building Applications and Libraries. COME ON.
- Cabal describes a single package with a `.cabal` file.
- Stack "helps manage individual packages and projects made up of multiple
  packages".
- Stack project layout:
  - `Setup.hs`
  - `foo.cabal`: describes package/executables
  - `stack.yaml`, `stack.yaml.lock`
  - `src/Main.hs`
- Stack commands:
  - `stack build`
  - `stack setup`: init deps / GHC
  - `stack exec`: Runs executable
  - `stack new NAME simple`: creates a `NAME` directrory

## Testing

`hspec` for simple value-based tests, `QuickCheck` for property based tests.

## Haddock documentation

<https://haskell-haddock.readthedocs.io/en/latest/markup.html>
