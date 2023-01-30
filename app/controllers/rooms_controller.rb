class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_data

  def index
  end
  
  def show
    @single_room = Room.find(params[:id])
    render :index
  end

  private
  def set_data
    @users = User.all_public.all_except(current_user)
  end
end
