class ImagesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  def show
    @image = Image.find(params[:id])
    # Comments
    @commentable = @image
    @comments = @commentable.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  def edit
    @image = Image.find_by_id(params[:id])
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.build(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to gallery_path(@gallery), notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end
end
