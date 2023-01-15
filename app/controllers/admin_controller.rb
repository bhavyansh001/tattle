class AdminController < ApplicationController
  http_basic_authenticate_with name: "bhavyansh001", password: "password"
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @users = User.all
    @articles = Article.all
  end

  private
  def check_if_admin
    if current_user.is_admin == true
      render :index
    else
      redirect_to root_path, notice: 'You are not allowed to access this page'
    end
  end
end
 