(define (square x) (* x x))

(display (square 21))
(newline)
(display (square (+ 2 5)))
(newline)
(display (square (square 3)))
(newline)

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(display (sum-of-squares 3 4))
(newline)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(display (f 5))

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

;: (and (> x 5) (< x 10))

(define (>= x y)
  (or (> x y) (= x y)))

(define (>= x y)
  (not (< x y)))

(define a 3)

(define b (+ a 1))

(display (if (and (> b a) (< b (* a b)))
    b
    a))
(newline)

(display (cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)))
(newline)

(display (+ 2 (if (> b a) b a)))
(newline)

(display (* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1)))
(newline)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
