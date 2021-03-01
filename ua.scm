#! /usr/bin/env -S chibi-scheme -r -A ./ -I /home/lib/modules/self/schemeR7RS

(import (chibi) (chibi match)
	(lib misc)
	(scheme cxr) (only (scheme base) symbol=?)
	)

(load "const.scm")
(load "mona.scm")

(define (rewrite x)
	;;(dspl "k: " x )
	(match x
		(('⊤)                         '⊤ )
		(('⊥)                         '⊥ )
		(((? number? x))              x  )
		((op (x ...))                 ((eval op) (rewrite x)) )
		((op  x     )                 ((eval op)          x)  )
		(((x ...) op (y ...))         ((eval op) (rewrite x) (rewrite y)) )
		(((x ...) op  y     )         ((eval op) (rewrite x)          y ) )
		(( x      op (y ...))         ((eval op)          x  (rewrite y)) )
		(( x      op  y     )         ((eval op)          x           y ) )
		((`├ (x ...) (y ...) (z ...)) (┤ (rewrite x) (rewrite y) (rewrite z)) )
		((`├ (x ...) (y ...)  z     ) (┤ (rewrite x) (rewrite y)          z ) )
		((`├ (x ...)  y      (z ...)) (┤ (rewrite x)          y  (rewrite z)) )
		((`├  x      (y ...) (z ...)) (┤          x  (rewrite y) (rewrite z)) )
		((`├ (x ...)  y       z     ) (┤ (rewrite x)          y           z ) )
		((`├  x      (y ...)  z     ) (┤          x  (rewrite y)          z ) )
		((`├  x       y      (z ...)) (┤          x           y  (rewrite z)) )
		((`├  x       y       z     ) (┤          x           y           z ) )
		(_ (error "not a term") )) )


(define (main args)
	(define j (lambda (a b c) (rewrite
			`( (┤ ,a ,b ,c) = ((,a ↓ ,b) ↑ ((- ,a) ↓ ,c)) ) )) )
	(define l (lambda (a b c) (rewrite
			`( (┤ ,a ,b ,c) = (┤ ,a (,a = ,b) ,c) ) )) )
	(define k (lambda (a b) (rewrite
			`( ((,a = (- ,b)) = (,a ≠ ,b)) ↓ ((,a ≠ ,b) = ((- ,a) = ,b)) ) )) )
	(define m (lambda (a b c) (rewrite
			`( (┤ ,a ,b ,c) = (┤ ,a (,a ≤ ,b) ,c) ) )) )
	(define n (lambda (a b c) (rewrite
			`( (┤ ,a ,b ,c) = (┤ ,a (,a ↓ ,b) ,c) ) )) )
	(define n (lambda (a b c) (rewrite
			`( (┤ ,a ,b ,c) = (┤ ,a ,b ((- ,a) ↓ ,c)) ) )) )
			
	;;(dspl (fold ↓ (map k a b)) )
	;;(dspl (fold ↓ (map h k a b)) )
	;;(dspl (fold ↓ (map i d a b)) )
	;;(dspl (fold ↓ (map n f g h)) )
	(dspl a )
	(dsp ""))