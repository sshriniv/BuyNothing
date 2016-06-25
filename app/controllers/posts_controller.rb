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
          	if params[:images]
          		params[:images].each {|image|
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
        @pictures = @post.pictures
        @win = Win.new
        
        #array of users commented on a post
        @commented_users = Set.new
        @post.comments.each do |comment|
        	@commented_users.add(comment.user)
        end
        
        @post_owner = post_owner
	end
	
	
  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @post = Post.find(params[:id])
    @post.status = :closed
    
    respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Giveaway closed successfully.' }
          format.json { render :show, status: :created, location: @group }
        else
          format.html { redirect_to @post, notice: 'Error closing giveaway.' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
    end
  end

    private
 
	  def post_params
        params.require(:post).permit(:description,:group_id,:user_id,:tag_list,:post_type,:title,:pictures)
      end
      
      def post_owner
      	return (@post.user == current_user)
      end


end