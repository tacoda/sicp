# Structure and Interpretation of Computer Programs

## Getting Started

I am using Guile as my scheme intepreter.
Feel free to use the interpreter of your choice.

```sh
brew install guile
```

## Basics

### Arithmetic

```sh
guile ch1/arithmetic.scm
```

### Names

```sh
guile ch1/names.scm
```

### Functions

```sh
guile ch1/functions.scm
```

**Evaluation by Substitution**

```scheme
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)

(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+    (square (+ 5 1))      (square (* 5 2))  )
(+    (* (+ 5 1) (+ 5 1))   (* (* 5 2) (* 5 2)))
(+         (* 6 6)             (* 10 10))
(+           36                   100)
                    136
```
