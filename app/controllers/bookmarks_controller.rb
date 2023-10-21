class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    # @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save

    redirect_to root_path
  end

  def destroy

  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:content, :movie_id, :list_id)
  end
end
