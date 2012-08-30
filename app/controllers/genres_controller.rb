class GenresController < ApplicationController
  load_and_authorize_resource

  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @genres }
    end
  end

  # GET /genres/1
  # GET /genres/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @genre }
    end
  end

  # GET /genres/new
  # GET /genres/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @genre }
    end
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres
  # POST /genres.json
  def create

    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: 'Genre was successfully created.' }
        format.json { render json: @genre, status: :created, location: @genre }
      else
        format.html { render action: "new" }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /genres/1
  # PUT /genres/1.json
  def update

    respond_to do |format|
      if @genre.update_attributes(params[:genre])
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to genres_url }
      format.json { head :no_content }
    end
  end
end
