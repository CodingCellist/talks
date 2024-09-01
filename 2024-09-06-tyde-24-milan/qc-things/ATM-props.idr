public export 0
PROP_eventuallyReady : Fn (ATMTrace Ready 5) Bool
PROP_eventuallyReady =
  MkFn (\case (MkATMTrace _ trace) =>
            elem Ready (map (.resSt) trace))
