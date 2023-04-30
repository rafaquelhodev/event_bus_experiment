defmodule DecoupleEventBus.BuyItem do
  alias DecoupleEventBus.Checkout

  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  @impl GenServer
  def init(args) do
    {:ok, args}
  end

  @impl GenServer
  def handle_info({:receipt_generated, receipt}, state) do
    item = Map.get(state, :item)

    item_with_receipt = Map.put(item, :receipt, receipt)

    GenServer.reply(state.from, item_with_receipt)

    {:noreply, state}
  end

  @impl GenServer
  def handle_call({:buy, item}, from, _state) do
    resp = Checkout.run(item, reply_to: self())

    {:noreply, %{item: resp, from: from}}
  end

  def execute_buy(pid, item) do
    GenServer.call(pid, {:buy, item})
  end
end
