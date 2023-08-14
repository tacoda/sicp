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
The convention of placing the operator to the left of the operands
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

### Evaluating Combinations

1. Evaluate the subexpressions of the combination.
2. Apply the procedure that is the value of the lemost subexpression (the operator) to the arguments that are the values of the
other subexpressions (the operands).

### Compound Procedures

### Functions

```scheme
(define (square x) (* x x))

(square 21)
;; 441

(square (+ 2 5))
;; 49

(square (square 3))
;; 81

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4)
;; 25

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)
;; 136
```

### The Substitution Model for Procedure Application

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

### Conditional Expressions and Predicates

```scheme
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(and (> x 5) (< x 10))

(define (>= x y)
  (or (> x y) (= x y)))

(define (>= x y)
  (not (< x y)))
```

### Example: Square Roots by Newton's Method

```scheme
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;: (sqrt 9)
;: (sqrt (+ 100 37))
;: (sqrt (+ (sqrt 2) (sqrt 3)))
;: (square (sqrt 1000))
```

### Recursion and Iteration

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

---

**TODO**

- Structure and Interpretation of Computer Programs
- Scheme Section of Guile Reference
- Guile Section of Guile Reference