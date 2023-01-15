class RoomsController < ApplicationController
  def index
    @room = Room.new
    @rooms = Room.all
    @users = User.all_public.all_except(current_user)
    render 'index'
  end
  def show
    @single_room = Room.find(params[:id])

    @room = Room.new
    @rooms = Room.all

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_public.all_except(current_user)

    render 'index'
  end
  def create
    @room = Room.create(name: params["room"]["name"])
  end
end
