class UsersController < ApplicationController
  def update
    preveous_username = set_user.username
    respond_to do |format|
      if set_user.update!(user_params)
        format.js
      end
    end
    new_username = @user.username
    room_id_for_room_channel = @user.room_id
    ActionCable.server.broadcast "room_channel_#{room_id_for_room_channel}", preveous_username: preveous_username, new_username: new_username, data_type: "username"
  end


  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:username, :room_id)
  end
end
