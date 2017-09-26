class VideosController < ApplicationController
  before_filter :require_user

  layout "application"
  
  def index
    @categories = Category.all
    @videos = Video.all
  end

  def show
    @video = Video.find_by(id: params[:id])
    @reviews = @video.reviews
  end

  def search
    @results = Video.search_by_title(params[:search_term])
  end
end