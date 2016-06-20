class WinsController < ApplicationController
    
    def index
    end
    
    def create
        @post = Post.find_by_id(wins_params[:post_id])
        @win = Win.create(wins_params)
        @post.win = @win
        redirect_to @post
        
    end
    
    private

	def wins_params
      params.require(:win).permit(:user_id, :post_id, :message)
    end

end
