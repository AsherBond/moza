class CommentsController < ApplicationController
  before_filter :load_commentable
  
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      new_notification @commentable, current_user
      redirect_to :back, notice: "Thanks for posting a comment."
    else
      render :new
    end
  end

  def new_notification object, from # the notification object # who its for
    if object.class.name == "User"
      notify_user = object
      message = "#{from.username} commented on your Profile."
    elsif object.class.name == "Song"
      notify_user = object.album.user
      message = "#{from.username} commented on your #{object.class.name.downcase} #{object.name}."
    elsif object.class.name == "Image"
      notify_user = object.gallery.user
      message = "#{from.username} commented on your #{object.class.name.downcase} #{object.name}."
    else
      notify_user = object.user
      message = "#{from.username} commented on your #{object.class.name.downcase} #{object.name}."
    end
  
    n = notify_user.notifications.build(
                                  :notify_object_id => object.id, 
                                  :notify_object_type => object.class.name, 
                                  :from => from.id 
                                )
    n.message = message
    n.save
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # def load_commentable
  #   klass = [Article, Photo, Event].detect { |c| params["#{c.name.underscore}_id"] }
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end
end