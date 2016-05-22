class CommentsController < ApplicationController

	before_filter :get_parent

	def new
		@group_id = params[:group_id]
		@parent_id = @parent.id
		@comment = @parent.comments.new
		@new_comment_locatiion_id = '#reply-link-comment-'+@parent.id.to_s 
	end

	def create
		@comment = @parent.comments.create(comments_params)
		@group = get_post(@parent).group
		@comment.user = current_user

		if @parent.is_a?(Post)
			@target_css_id = '#post-'+@parent.id.to_s+' '+'#post-'+@parent.id.to_s+'-comments-list'
		elsif @parent.is_a?(Comment)
			@target_css_id = '#comment-'+@parent.id.to_s+' '+'#comment-'+@parent.id.to_s+'-comments-list'
		end

		@group_post_tag = '.group-post-'+@parent.id.to_s

	    if @comment.save
	    	respond_to do |format|
	    		format.html {redirect_to @group}
	    	    format.js #renders view comments/create.js.erb
	        end
	    end	
		
    end

	private

	def comments_params
      params.require(:comment).permit(:body)
    end

	def get_parent
		@parent = Post.find_by_id(params[:post_id]) if params[:post_id]
		@parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

		redirect_to root_path unless defined?(@parent)
	end


	def get_post(parent)
      parent.is_a?(Post) ? parent : get_post(parent.commentable)
	end

	#$('#comment_15').after('<%= j render ("new_comment_comment")%>');

end