class UsersController < ApplicationController
  def update
    preveous_username = set_user.username
    respond_to do |format|
      if set_user.update!(user_params)
        format.js
      end
    end
    new_username = User.find_by(user_params).username
    ActionCable.server.broadcast "room_channel_30", preveous_username: preveous_username, new_username: new_username, data_type: "username"
  end


  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
