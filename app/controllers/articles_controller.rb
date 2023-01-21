class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'Article could not be created'
    end
  end

  def show
    @comments = @article.comments
  end

  def edit
  end
  
  def update
    
    if @article.update(article_params)
      redirect_to @article,  notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity, notice: 'Article could not be updated.'
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, status: :see_other, notice: 'Article was successfully deleted.'
    else
      render @article, notice: 'Article could not be deleted.'
    end
  end

  private
  def correct_user
    @user = current_user.articles.find_by(id: params[:id])
    if @user.nil?
      if current_user.is_admin
        @user = current_user
      end
    end
    redirect_to articles_path, notice: 'Not authorized to edit this article!' if @user.nil?
  end
  def set_article
    @article = Article.find(params[:id])
    @article_user = @article.user.username
  end
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
