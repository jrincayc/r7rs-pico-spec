# r7rs-pico-spec
Pico version of revised⁷ report on the algorithmic language scheme
(This was originally called r7rs-tiny-spec)

This designed as a smaller version of the Scheme spec, suitable for use when the
small version is still too big.

r7rs-pico (pr7rs) is designed to be small enough that a small group or a single
person working on it part time can implement it in a few months.

In addition, the denotational semantics are considerably simpler than the semantics
for r7rs-small which aids in understanding it.

For example, in pr7rs the type of an expression is:

U -> E

but in r7rs-small the type is:

U -> P -> K -> C

since the expression has to return a continuation and be able to modify a store.
However in pr7rs an expression only has to convert an environment to a expressed value.

There are various other smaller versions of Scheme including:
* The Little Schemer has a smaller version used in the book.
* Bottom Scheme: https://github.com/johnwcowan/r7rs-work/blob/master/BottomScheme.md
* Lispy: https://norvig.com/lispy.html
* LISP in a Boot Sector: https://github.com/jart/sectorlisp

In order to use the examples in The Little Schemer in Pico Scheme, the
following definitions are needed:

```scheme
(define eq? eqv?)
(define zero? (lambda (x) (= x 0)))
(define add1 (lambda (x) (+ x 1)))
(define sub1 (lambda (x) (- x 1)))
(define atom? (lambda (x) (or (symbol? x) (number? x))))
```

There is an interpreter for pr7rs that mostly implements this specification:
https://github.com/jrincayc/rust_pr7rs/


