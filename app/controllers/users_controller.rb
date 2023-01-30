class UsersController < ApplicationController
  before_action :set_users
  before_action :set_room
  before_action :set_messages

  def show
    render 'rooms/index'
  end

  private
  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
  def set_users
    @user = User.find(params[:id])
    @users = User.all_public.all_except(current_user)
  end
  def set_room
    @room_name = get_name(@user, current_user)
    unless @single_room
      @single_room = Room.where(name: @room_name).first
    else
      @single_room = Room.create_private_room(@user, current_user, @room_name)
    end
  end
  def set_messages
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
  end
end
