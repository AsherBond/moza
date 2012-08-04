class UsersController < ApplicationController
  def show
  	@album = current_user.albums.first
  	@albums = current_user.albums
  	@songs = @album.songs
  end

  def index
  end

  def artist
  	if current_user.roles.empty?
	  	current_user.add_role :artist
	  	redirect_to edit_user_registration_path, :notice => "We are waiting to listen to you!"
	else
		redirect_to root_path, :notice => "Welcome back!"
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
