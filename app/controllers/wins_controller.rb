class WinsController < ApplicationController
    
    def index
        @current_user_wins = current_user.wins
    end
    
    def create
        @post = Post.find_by_id(wins_params[:post_id])
        @win = Win.create(wins_params)
        @post.win = @win
        @post.status = 1
        @post.save
        redirect_to @win
    end
    
    def show
       @win = Win.find_by_id(params[:id])
       #Show win only for poster or recipient
       unless (current_user == @win.user || current_user == @win.post.user)        
        raise ActionController::RoutingError.new('Not Found')
       end
    end
    
    private

	def wins_params
      params.require(:win).permit(:user_id, :post_id, :message)
    end

end
