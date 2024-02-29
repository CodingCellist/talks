record OpRes (resT : Type) (currSt : ATMState)
             (nsFn : resT -> ATMState)
  where
  constructor MkOpRes

  -- The operation
  op : ATMOp resT currSt nsFn

  -- The result of the operation
  res : resT

  -- Results must be `Show`-able for QC to work
  rShow : Show resT
