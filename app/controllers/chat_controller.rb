class ChatController < ApplicationController
  def show
    @users = User.all_public.all_except(current_user)
  end
end
