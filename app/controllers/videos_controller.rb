class VideosController < ActionController::Base
  layout "application"
  
  def index
    @categories = Category.all
    @videos = Video.all
  end

  def show
    @video = Video.find_by(id: params[:id])
  end

  def search
    @match_videos = Video.search_by_title(params[:search_item])
  end
end