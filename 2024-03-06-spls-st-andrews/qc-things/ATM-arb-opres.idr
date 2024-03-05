{currSt : ATMState} ->
Arbitrary (resT : _ ** nsFn : resT -> ATMState ** OpRes resT currSt nsFn)
where
  arbitrary {currSt=Ready} =
    pure (_ ** _ ** MkOpRes Insert () %search)

  arbitrary {currSt=CardInserted} = do
    -- we need _a_ PIN, even though we control the result
    let arbPIN = 0
    let op1 = (_ ** _ ** MkOpRes (CheckPIN arbPIN) Correct %search)
    let op2 = (_ ** _ ** MkOpRes (CheckPIN arbPIN) Incorrect %search)
    let op3 = (_ ** _ ** MkOpRes Eject () %search)
    -- can adjust the frequencies of getting the PIN wrong
    frequency $ [(1, pure op1), (4, pure op2), (1, pure op3)]

  arbitrary {currSt=Session} = do
    arbAmount <- arbitrary
    let op1 = (_ ** _ ** MkOpRes (Dispense arbAmount) () %search)
    let op2 = (_ ** _ ** MkOpRes Eject () %search)
    oneof [pure op1, pure op2]
