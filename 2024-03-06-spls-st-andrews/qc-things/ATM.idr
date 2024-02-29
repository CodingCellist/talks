data ATMSt =  Ready | CardInserted | Session

data CheckPINRes  =  Incorrect | Correct

data ATMOp : (ty : Type) -> ATMSt -> (ty -> ATMSt) -> Type
  where
  Insert : ATMOp () Ready (const CardInserted)

  CheckPIN : (pin : Nat)
           -> ATMOp CheckPINRes CardInserted
                    (\case Incorrect => CardInserted
                           Correct => Session)

  GetAmount  : ATMOp Nat state (const state)
  Dispense :  (amt : Nat)
           -> ATMOp () Session (const Session)
  Eject  : ATMOp () state (const Ready)

