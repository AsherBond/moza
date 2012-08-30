class SongsController < ApplicationController
  load_and_authorize_resource

  def vote
    value = params[:type] == "up" ? 1 : -1
    @song = Song.find(params[:id])
    @song.add_or_update_evaluation(:song_votes, value, current_user)
    respond_to :html, :js
  end

  def buy

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @album = Album.find(params[:album_id])
    @song = @album.songs.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @album = Album.find(params[:album_id])
    @song = @album.songs.build(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to album_path(@album), notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @album, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to @album }
      format.json { head :no_content }
    end
  end
end
