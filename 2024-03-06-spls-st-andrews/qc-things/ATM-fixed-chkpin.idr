data ATMState
  = Ready
  | CardInserted Nat  -- track #retries
  | Session
<...>
CheckPIN : (pin : Nat)
  -> ATMOp PINok (CardInserted (S tries))
        (\case Correct => Session
               Incorrect => ifThenElse (isZero tries)
                             Ready
                             (CardInserted tries))
