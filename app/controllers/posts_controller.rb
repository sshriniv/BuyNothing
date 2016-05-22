class PostsController < ApplicationController

    #New Action not used. Just for reference


	def new
		@group = Group.find(params[:group_id])
		@post = @group.posts.new
	end

	def create
		@group = Group.find(params[:group_id])
		@post = @group.posts.create(post_params)
		@post.user = current_user

		respond_to do |format|
          if @post.save
          	if params[:pictures]
          		params[:pictures].each {|image|
          			@post.pictures.create(image: image)
          		}
          	end
             format.html { redirect_to @group, notice: 'Post was successfully created.' }
             format.json { render :show, status: :created, location: @group }
          else
             format.html { render :new }
             format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end



	def index
	  if params[:tag]
	  	@group_posts = Post.tagged_with(params[:tag])
	  else	
	  	@current_group = Group.find(params[:group_id])
	  	@group_posts = @current_group.posts
	  end	
	end


	def show
		@current_group = params[:group_id]
		@post = Post.find(params[:id])

	end

    private
 
	  def post_params
        params.require(:post).permit(:description,:group_id,:user_id,:tag_list,:post_type,:title,:pictures)
      end


end