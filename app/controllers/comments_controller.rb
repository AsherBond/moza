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
			new_notification
			redirect_to :back, notice: "Thanks for posting a comment."
		else
			render :new
		end
	end

	def new_notification 

		# If the user comments on a profile.
		# ----------------------------------
		if @commentable.class.name == "User"
			notify_user = @commentable
			message = "#{current_user.username} 
										commented on your Profile."

		# If the user comments on a song.
		#--------------------------------
		elsif @commentable.class.name == "Song"
			notify_user = @commentable.album.user
			message = "#{current_user.username} 
										commented on your 
															#{@commentable.class.name.downcase} #{@commentable.name}."

		# If the user comments on an image.
		#----------------------------------
		elsif @commentable.class.name == "Image"
			notify_user = @commentable.gallery.user
			message = "#{current_user.username} 
										commented on your 
															#{@commentable.class.name.downcase} #{@commentable.name}."

		# If the user comments on an single resource.
		#--------------------------------------------
		else
			notify_user = @commentable.user
			message = "#{current_user.username} 
										commented on your 
															#{@commentable.class.name.downcase} #{@commentable.name}."
		end
	
		n = notify_user.notifications.build(:notify_object_id => @commentable.id, 
											:notify_object_type => @commentable.class.name, 
											:from => current_user.id)
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