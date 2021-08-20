class UsersController < ApplicationController
  def update
    respond_to do |format|
      if set_user.update!(user_params)
        format.js
      end
    end
  end


  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
