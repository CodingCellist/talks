trace : (steps : Nat) -> (st : stT) -> Gen (Vect steps (TraceStep opT))
trace 0 _ = pure []
trace (S j) st = do
  (_ ** stFn ** opR@(MkOpRes op res)) <- arbitrary
  let nextSt = stFn res
  pure $ (MkTS opR nextSt) :: !(trace j nextSt)