data State  =  Ready | CardInserted | Session

data CheckPINRes  =  Incorrect | Correct

data CMD : (ty : Type) -> State -> (ty -> State) -> Type
  where
  InsertCard : CMD () Ready (const CardInserted)
  Dispense   : CMD () Session (const Session)
  GetPIN     : CMD () CardInserted (const CardInserted)

  CheckPIN   : (Vect 4 Nat)
             -> CMD CheckPINRes CardInserted
                    (\res => case res of
                               Incorrect => CardInserted
                               Correct => Session)

  GetAmount  : CMD Nat state (const state)

  EjectCard  : CMD () state (const Ready)

