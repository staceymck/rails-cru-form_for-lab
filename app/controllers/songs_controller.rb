class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update] 
  
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end
  
  def edit
  end

  def update
    @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end
end
