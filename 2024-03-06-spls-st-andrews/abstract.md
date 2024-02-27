# Increasing confidence in Types

Dependent types can model and guide the implementation of various systems, with
the type checker aiding the programmer and keeping errors out. However, if the
typed model of the system is erroneous, the type checker can also,
unintentionally, create a false sense of security. We present an example of how
this kind of mistake can be subtly hidden, along with work on integrating
QuickCheck at the type level, the result being type-driven development with
increased confidence that our types are correct.

