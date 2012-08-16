class Admin::PagesController < ApplicationController
  def home
  	render :layout => "admin"
  end
end
