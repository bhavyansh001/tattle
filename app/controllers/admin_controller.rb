class AdminController < ApplicationController
  http_basic_authenticate_with name: "bhavyansh001", password: "password"
  before_action :authenticate_user!
  before_action :check_if_admin
  before_action :set_articles_comments, only: [:index]
  before_action :ransack_query, only: [:index]

  def index
    @users = User.all_except(current_user)
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
  def check_if_admin
    return if current_user.is_admin
      redirect_to root_path,
      notice: 'You are not allowed to access this page'
  end
  def set_articles_comments
    @articles = Article.all
    @comments = Comment.all
  end
  def ransack_query
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end
end