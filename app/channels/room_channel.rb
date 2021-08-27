class RoomChannel < ApplicationCable::Channel
  def subscribed
    p "started_streams-----------------------------------------------------"
    stream_from "room_channel_#{params[:room_id]}"
    p "started_streams-----------------------------------------------------"
  end

  def unsubscribed
    p "stopped_all_streams-----------------------------------------------------"
    stop_all_streams
    p "stopped_all_streams-----------------------------------------------------"
    # Any cleanup needed when channel is unsubscribed
  end
end
