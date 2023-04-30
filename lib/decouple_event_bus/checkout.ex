defmodule DecoupleEventBus.Checkout do
  require Logger

  def run(item, opts) do
    Logger.info("Performing checkout")

    %EventBus.Model.Event{
      id: 1,
      # required
      topic: :checkout_finished,
      # required,
      data: %{id: 1, value: item.value, opts: opts}
    }
    |> EventBus.notify()

    %{id: item.id, created_at: DateTime.utc_now(), updated_at: DateTime.utc_now(), value: item.id}
  end
end
