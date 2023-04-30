defmodule DecoupleEventBus.SendEmail do
  require Logger

  def process({_topic, _id} = event_shadow) do
    # Fetch event
    event = EventBus.fetch_event(event_shadow)

    # Do something with the event
    Logger.info("I am handling the event with a Simple module #{__MODULE__}")
    Logger.info(fn -> inspect(event) end)

    # Mark the event as completed for this consumer
    EventBus.mark_as_completed({SendEmail, event_shadow})
  end
end
