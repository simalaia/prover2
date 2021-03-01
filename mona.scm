#! /usr/bin/env -S chibi-scheme -r -A ./ -I /home/lib/modules/self/schemeR7RS

(import (chibi) (chibi match)
	(lib misc)
	(scheme cxr) (only (scheme base) symbol=?)
	)


(define (- . o)
	(match o
		((`⊤) `⊥ )
		((`⊥) `⊤ )
		(((? number? x)) (%- x) )
		(((? symbol? x)) `(- ,x) )) )

(define (= . o)
	(match o
		((x x) `⊤ )
		((x y) `⊥ )) )

(define (≠ . o)
	(match o
		((x x) `⊥ )
		((x y) `⊤ )) )

(define (< . o)
	(match o
		((x  x) `⊥ )
		((`⊥ x) `⊤ )
		((x `⊤) `⊤ )
		(((? number? x) (? number? y)) (%< x y) )
		((or ((? symbol? x) y) (x (? symbol? y))) `(,x < ,y) )) )

(define (> . o)
	(match o
		((x  x) `⊥ )
		((x `⊥) `⊤ )
		((`⊤ x) `⊤ )
		(((? number? x) (? number? y)) (%> x y) )
		((or ((? symbol? x) y) (x (? symbol? y))) `(,x > ,y) )) )

(define (≤ . o)
	(dspl "≤: " o)
	(match o
		((x  x) `⊤ )
		((`⊥ x) `⊤ )
		((x `⊤) `⊤ )
		(((? number? x) (? number? y)) (<= x y) )
		((or ((? symbol? x) y) (x (? symbol? y))) `(,x ≤ ,y) )) )

(define (≥ . o)
	(match o
		((x  x) `⊤ )
		((x `⊥) `⊤ )
		((`⊤ x) `⊤ )
		(((? number? x) (? number? y)) (>= x y) )
		((or ((? symbol? x) y) (x (? symbol? y))) `(,x ≥ ,y) )) )

(define (↓ . o)
	(match o
		((x x) x )
		((or ('⊤ x) (x '⊤)) x )
		((or ('⊥ x) (x '⊥)) '⊥ )
		(((? number? x) (? number? y)) (min x y) )
		((or ((? symbol? x) y) (x (? symbol? y))) `(,x ↓ ,y) )) )

(define (↑ . o)
	(match o
		((x x) x )
		((or (`⊤ x) (x `⊤)) `⊤ )
		((or ('⊥ x) (x '⊥)) x )
		(((? number? x) (? number? y)) (max x y) )
		((or ((? symbol? x) y) (x (? symbol? y))) `(,x ↑ ,y) )) )

(define (├ . o)
	;;(dspl "l: " o)
	(match o
		((`⊤ x y) x )
		((`⊥ x y) y )) )

