class UsersController < ApplicationController

  @user = User.new(user_params)
  if @user.save
    redirect_to root_path
  end
end
