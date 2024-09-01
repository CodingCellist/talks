trace :  (steps : Nat) -> (currSt : ATMState)
      -> Gen (Vect steps TraceStep)
trace 0 _ = pure []
trace (S k) currSt =
  the (Gen (x ** y ** OpRes x currSt y)) arbitrary
  >>=
  \case (_ ** nsFn ** opR@(MkOpRes _ res _)) =>
     do let nextState = nsFn res  -- ! nsFn from ISM
        pure $ (MkTS opR nextState) :: !(trace k nextState)
