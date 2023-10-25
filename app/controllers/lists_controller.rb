class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def all
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to root_path
  end

  def show
    @bookmarks = Bookmark.where(list_id: @list.id)
    @movies = []
    @bookmarks.each do |bookmark|
      @movies << Movie.find(bookmark.movie_id)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
