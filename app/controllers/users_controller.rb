class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists

    # Comments
    @commentable = @user
    @comments = @commentable.comments
    @comment = Comment.new

    unless @user.albums.empty?
      @album  = @user.albums.first
    	@albums = @user.albums
    	@songs  = @album.songs
    end
    
  end

  def index
    @users = User.all.page(params[:page]).per_page(3)
  end


  def is_artist
    @user = current_user
  end

  def type
    if !current_user.roles.empty?
      redirect_to root_path, :notice => "Welcome back!"
    end
  end

  def artist
  	if current_user.has_role? :artist or current_user.has_role? :fan
  		redirect_to root_path, :notice => "Welcome back!"
    else
      current_user.add_role :artist
      redirect_to edit_user_registration_path, :notice => "We are waiting to listen to you!"
    end
  end
  def fan
  	if current_user.roles.empty?
	  	current_user.add_role :fan
	  	redirect_to edit_user_registration_path, :notice => "Have fun!"
  	else
  		redirect_to root_path, :notice => "Welcome back!"
  	end
  end
end
