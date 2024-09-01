record TraceStep where
  constructor MkTS

  -- The `ATMOp`, along with some result,
  -- which took us to the traced state
  opRes : OpRes rT aSt aStFn

  -- The `ATMState` we ended up in
  resSt : ATMState

-- A bounded sequence of trace steps
data ATMTrace : ATMState -> Nat -> Type where
  MkATMTrace :  (initSt : ATMState)
             -> {bound : Nat}
             -> (trace : Vect bound TraceStep)
             -> ATMTrace initSt bound
