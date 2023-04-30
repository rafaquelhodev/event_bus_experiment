defmodule DecoupleEventBus.GenerateReceipt do
  require Logger

  def process({_topic, _id} = event_shadow) do
    # Fetch event
    event = EventBus.fetch_event(event_shadow)

    # Do something with the event
    Logger.info("I am handling the event with a Simple module #{__MODULE__}")
    Logger.info(fn -> inspect(event) end)

    data = Map.get(event, :data)

    opts = Map.get(data, :opts, [])

    reply_to = Keyword.get(opts, :reply_to, nil)

    if reply_to do
      IO.inspect("REPLYING TO!!")
      receipt = %{id: 112, value: Map.get(data, :value), created_at: DateTime.utc_now()}
      send(reply_to, {:receipt_generated, receipt})
    end

    # Mark the event as completed for this consumer
    EventBus.mark_as_completed({GenerateReceipt, event_shadow})
  end
end
