{:ok, pid} = DecoupleEventBus.BuyItem.start_link()

DecoupleEventBus.BuyItem.execute_buy(pid, %{id: 1, value: 10001})
