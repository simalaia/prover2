#! /usr/bin/env -S chibi-scheme -r -A ./ -I /home/lib/modules/self/schemeR7RS

(import (chibi) (chibi match)
	(lib misc)
	(scheme cxr) (only (scheme base) symbol=?)
	)

(load "gen.scm")

(define (mkbin e) (mkthing '(⊤ ⊥) 2 e) )
(define (mktri e) (mkthing '(⊤ 0 ⊥) 3 e) )
(define (mkint e) (mkthing '(-7 0 5) 3 e) )
(define (mkrat e) (mkthing '(-0.137 0.426) 2 e) )
(define (mkqui e) (mkthing '(⊤ -1 0 1 ⊥) 5 e) )

(define %= =)
(define %< <)
(define %> >)
(define %- -)

(define top `⊤)
(define bot `⊥)

(define t (mktri 3) )
(define a (car t))
(define b (cadr t))
(define c (caddr t))

