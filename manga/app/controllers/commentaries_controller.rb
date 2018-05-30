class CommentariesController < ApplicationController
	def new
		@comment = Commentary.new
	end

	def create
		@ouvrage = Ouvrage.find(params[:ouvrage_id])
		@comment = @ouvrage.commentaries.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to :back, notice: "success"
    	else
			redirect_to :back, notice: "fail"
		end
	end

	/
	def upvote
		@ouvrage = Ouvrage.find(params[:ouvrage_id])
		@comment = Commentary.find(params[:id])
		@comment.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@ouvrage = Ouvrage.find(params[:ouvrage_id])
		@comment = Commentary.find(params[:id])
		@comment.downvote_by current_user
		redirect_to :back
	end
	/
	
	private

	def comment_params
		params.require(:commentary).permit(:texte,:user_id,:ouvrage_id)
	end

end
