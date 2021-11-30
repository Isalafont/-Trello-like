class BoardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "board"
    # stream_from "some_channel"
  end

  def unsubcribed
    stop_all_streams
  end
end
