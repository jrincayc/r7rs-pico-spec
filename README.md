# r7rs-pico-spec
Pico version of revised⁷ report on the algorithmic language scheme

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

There is an interpreter for pr7rs that mostly implements this specification:
https://github.com/jrincayc/rust_tr7rs/


