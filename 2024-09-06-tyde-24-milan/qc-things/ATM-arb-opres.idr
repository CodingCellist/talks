{currSt : ATMState} ->
Arbitrary (resT : _ ** nsFn : resT -> ATMState ** OpRes resT currSt nsFn)
where
  arbitrary {currSt=Ready} =
    pure (_ ** _ ** MkOpRes Insert ())

  arbitrary {currSt=CardInserted} = do
    -- we need a PIN, even though we control the result
    let arbPIN = 0
    let op1 = (_ ** _ ** MkOpRes (CheckPIN arbPIN) Correct)
    let op2 = (_ ** _ ** MkOpRes (CheckPIN arbPIN) Incorrect)
    let op3 = (_ ** _ ** MkOpRes Eject ())
    -- can adjust the frequencies of getting the PIN wrong
    frequency $ [(1, pure op1), (4, pure op2), (1, pure op3)]

  arbitrary {currSt=Session} = do
    arbAmount <- arbitrary
    let op1 = (_ ** _ ** MkOpRes (Dispense arbAmount) ())
    let op2 = (_ ** _ ** MkOpRes Eject ())
    oneof [pure op1, pure op2]
