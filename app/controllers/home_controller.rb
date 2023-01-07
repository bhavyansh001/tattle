class HomeController < ApplicationController
  def index
    @sections = Home.all
  end
end
