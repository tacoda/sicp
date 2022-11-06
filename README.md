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
;; Eager
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)

;; Lazy
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+    (square (+ 5 1))      (square (* 5 2))  )
(+    (* (+ 5 1) (+ 5 1))   (* (* 5 2) (* 5 2)))
(+         (* 6 6)             (* 10 10))
(+           36                   100)
                    136
```

### Recursion and Iteration

```sh
guile ch2/recur-iter.scm
```

```scheme
;; Recursion calls itself

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;; Iteration uses a count control
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
```

### GCD and Primes

```sh
guile ch2/gcd-primes.scm
```
