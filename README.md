# Structure and Interpretation of Computer Programs

## Getting Started

I am using Guile as my scheme intepreter.
Feel free to use the interpreter of your choice.

```sh
brew install guile
```

## The Elements of Programming

- **Primitive expressions**, which represent the simplest entities the language is concerned with.
- **Means of combination**, by which compound elements are built from simpler ones.
- **Means of abstraction**, by which compound elements can be named and manipulated as units.

### Expressions

```scheme
486
;; 486

(+ 137 349)
;; 486

(- 1000 334)
;; 666

(* 5 99)
;; 495

(/ 10 5)
;; 2

(+ 2.7 10)
;; 12.7
``````

Expressions such as these, formed by delimiting a list of expressions
within parentheses in order to denote procedure application, are called
_combinations_. The leftmost element in the list is called the operator, and
the other elements are called operands. The value of a combination is
obtained by applying the procedure specified by the operator to the arguments that are the values of the operands.
The convention of placing the operator to the le of the operands
is known as prefix notation, and it may be somewhat confusing at first
because it departs significantly from the customary mathematical convention. Prefix notation has several advantages, however. One of them
is that it can accommodate procedures that may take an arbitrary number of arguments, as in the following examples:

```scheme
(+ 21 35 12 7)
;; 75

(* 25 4 12)
;; 1200

(+ (* 3 5) (- 10 6))
;; 19

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))
;; 57

;; Pretty printing
(+ (* 3

      (+ (* 2 4)

         (+ 3 5)))

   (+ (- 10 7)

      6))
```


### Naming

```scheme
(define size 2)
size
;; 2

(* 5 size)
;; 10

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
;; 314.159

(define circumference (* 2 pi radius))
circumference
;; 62.8318
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
