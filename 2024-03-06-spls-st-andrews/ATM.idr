data ATMSt =  Ready | CardInserted | Session

data CheckPINRes  =  Incorrect | Correct

data ATMOp : (ty : Type) -> ATMSt -> (ty -> ATMSt) -> Type
  where
  InsertCard : ATMOp () Ready (const CardInserted)
  Dispense   :  (amt : Nat)
             -> ATMOp () Session (const Session)

  CheckPIN   : Nat
             -> ATMOp CheckPINRes CardInserted
                    (\case Incorrect => CardInserted
                           Correct => Session)

  GetAmount  : ATMOp Nat state (const state)

  EjectCard  : ATMOp () state (const Ready)

