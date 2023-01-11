class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @sections = Home.all
    @users = User.all
    @articles = Article.all
  end

  private
  def check_if_admin
    if current_user.is_admin == true
      render :index, notice: 'Welcome Admin'
    else
      redirect_to root_path, notice: 'You are not allowed to access this page'
    end
  end
end
 