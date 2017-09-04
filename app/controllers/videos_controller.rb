class VideosController < ActionController::Base
  layout "application"
  
  def index
    @categories = Category.all
    @videos = Video.all
  end

  def show
    @video = Video.find_by(id: params[:id])
  end
end