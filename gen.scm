#! /usr/bin/env -S chibi-scheme -r -A ./ -I /home/lib/modules/self/schemeR7RS

(import (chibi) (chibi match)
	(lib misc)
	(scheme cxr) (only (scheme base) symbol=?)
	)

(define (conv m n)
	(let lop ( (r '()) (m m) )
		(cond
			((< m n) (cons m r) )
			(else (lop (cons (remainder m n) r) (floor (/ m n))) )) ))

(define (transp l) (apply map list l) )

(define (ι n)
	(cdr (let f ( (n n) )
		(if (= n 0) `(,n) (append (f (- n 1)) `(,(- n 1)))) )) )

(define (pad n l)
	(append (let f ( (n (- n (length l))) )
		(if (< n 2) 0 (cons 0 (f (- n 1)))) ) l) )

(define (ilen b e) (length (conv (expt b e) b)) )

(define (gen b e)
	(let* ( (k (ilen b e))        (n (expt b e))
	        (g (λ (x) (pad k x))) (f (λ (n) (conv n b))) )
		(map g (map f (ι n))) ))

(define (mkthing l b e)
	(map (λ (x) (map (λ (x) (list-ref l x)) x)) (transp (gen b e))) )

