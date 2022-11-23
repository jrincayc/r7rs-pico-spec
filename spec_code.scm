;1.2.4
(* 5 8)
;4.1.1
(define x 28)
x
;4.1.2
(quote a)
(quote (a b c))
(quote (+ 1 2))
'a
'(a b c)
'()
'(+ 1 2)
'(quote a)
''a
'145932
145932
'#t
#t
;4.1.3
(+ 3 4)
((if #f + *) 3 4)
;4.1.4
(lambda (x) (+ x x))
((lambda (x) (+ x x)) 4)
(define reverse-subtract
  (lambda (x y) (- y x)))
(reverse-subtract 7 10)
(define add4
  (let ((x 4))
    (lambda (y) (+ x y))))
(add4 6)
((lambda x x) 3 4 5 6)
;4.1.5
(if (> 3 2) 'yes 'no)
(if (> 2 3) 'yes 'no)
(if (> 3 2)
    (- 3 2)
    (+ 3 2))
;4.2.1
(cond ((> 3 2) 'greater)
      ((< 3 2) 'less))
(cond ((> 3 3) 'greater)
      ((< 3 3) 'less)
      (else
       'equal))
(and (= 2 2) (> 2 1))
(and (= 2 2) (< 2 1))
(and 1 2 'c '(f g))
(and)
(or (= 2 2) (> 2 1))
(or (= 2 2) (< 2 1))
(or #f #f #f)
(or '(b c) (car 'a))
;4.2.2
(let ((x 2) (y 3))
  (* x y))
(let ((x 2) (y 3))
  (let ((x 7)
	(z (+ x y)))
    (* z x)))
;5.2.1
(define add3
  (lambda (x) (+ x 3)))
(add3 3)
(define first car)
(first '(1 2))
;5.2.2
(let ((x 5))
  (define bar (lambda (a b) (+ (* a b) a)))
  (define foo (lambda (y) (bar x y)))
  (foo (+ x 3)))
;6.1
(eqv? 'a 'a)
(eqv? 'a 'b)
(eqv? '(a) '(a))
(eqv? (list 'a) (list 'a))
(eqv? '() '())
(eqv? 2 2)
(eqv? car car)
(let ((n (+ 2 3)))
  (eqv? n n))
(let ((x '(a)))
  (eqv? x x))
(let ((x '()))
  (eqv? x x))
(let ((p (lambda (x) x)))
  (eqv? p p))
(eqv? #f 'nil)
;6.2.2
(number? 3)
(number? '(1))
(+ 3 4)
(* 4 5)
(- 3 4)
(- 3)
;6.3
#t
#f
'#f
(not #t)
(not 3)
(not '(3))
(not #f)
(not '())
(not 'nil)
(boolean? #f)
(boolean? 0)
(boolean? '())
;6.4
(pair? '('a . 'b))
(pair? '(a b c))
(pair? '())
(cons 'a '())
(cons '(a) '(b c d))
(cons 'a 3)
(cons '(a b) 'c)
(car '(a b c))
(car '((a) b c d))
(car '(1 . 2))
(car '())
(cdr '((a) b c d))
(cdr '(1 . 2))
(cdr '())
;6.5
(symbol? 'foo)
(symbol? (car '(a b)))
(symbol? 'nil)
(symbol? '())
(symbol? #f)
;6.6
(procedure? car)
(procedure? 'car)
(procedure? (lambda (x) (* x x)))
(procedure? '(lambda (x) (* x x)))
(apply + '(3 4))
(define compose
  (lambda (f g)
    (lambda args
      (f (apply g args)))))
((compose - *) 3 4)
;examples
(define list (lambda l l))
(list 'a 'b 'c)
(define list? (lambda (l)
		(cond ((null? l) #t)
		      ((not (pair? l)) #f)
		      (else (list? (cdr l))))))
(list? '(a b c))
(list? (cons 'a 'b))
(define append (lambda (l t)
		 (cond ((null? l) t)
		       (else (cons (car l) (append (cdr l) t))))))
(append '() '(a))
(append '(a b) '(c d))
(define assv (lambda (obj l)
	       (cond ((null? l) #f)
		     ((eqv? obj (car (car l))) (car l))
		     (else (assv obj (cdr l))))))
(define e '((a 1) (b 2) (c 3)))
(assv 'a e)
(assv 'b e)
(assv 'd e)
(assv 5 '((2 3) (5 7) (11 13)))
(let ((Y (lambda (phi)
	   ((lambda (f) (f f))
	    (lambda (f)
	      (phi (lambda x (apply (f f) x))))))))
  (let ((fact
	 (Y (lambda (fact)
	      (lambda (n)
		(if (< n 2) 1
		    (* n (fact (- n 1)))))))))
    (fact 5)))
