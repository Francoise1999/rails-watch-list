require "cloudinary"

class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  # def upload
  #   uploaded_file = params[:model][:image]
  #   cloudinary_upload = Cloudinary::Uploader.upload(uploaded_file)

  #   # Stockez l'URL de l'image Cloudinary dans votre modèle ou utilisez-la comme bon vous semble.
  #   @list.image = cloudinary_upload['secure_url']

  #   if @model.save
  #     redirect_to @model, notice: "L'image a été téléchargée avec succès."
  #   else
  #     render 'new'
  #   end
  # end

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
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
