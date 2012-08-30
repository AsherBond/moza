class AlbumsController < ApplicationController

	load_and_authorize_resource
	
	def vote
		value = params[:type] == "up" ? 1 : -1
		@album.add_or_update_evaluation(:album_votes, value, current_user)
		respond_to :html, :js
	end

	def index
		@albums = current_user.albums
	end

	def show
		if current_user == @album.user
			@songs = @album.songs
		else
			@songs = Song.where(:album_id => @album.id, :active => true)
		end

		@commentable = @album
		@comments = @commentable.comments
		@comment = Comment.new
	end

	def new
		@album = current_user.albums.build
	end

	def edit
	end

	def create
		@album = current_user.albums.build(params[:album])

		if @album.save
			 redirect_to @album, notice: 'You have successfully created an Album, you can add songs to the album below.'
		else
			 render action: "new" 
		end
	end

	def update
		if @album.update_attributes(params[:album])
			 redirect_to @album, notice: 'Album was successfully updated.'
		else
			 render action: "edit"
		end
	end

	def destroy
		@album.destroy
		redirect_to albums_url, notice: 'Album was deleted successfully.'
	end
end