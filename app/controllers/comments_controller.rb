class CommentsController < ApplicationController

  before_action :set_comment, only: [  :destroy, :upvote, :downvote]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.game.comments << @comment
      @game = @comment.game
    else
      flash[:errors] = @comment.errors.full_messages
    end
    redirect
  end

  def destroy
    @comment.destroy
    redirect
  end

  def upvote
    @comment.votes << Vote.new(comment_id: @comment.id, voter_id: current_user.id, value: 1)
    redirect
  end

  def downvote
    @comment.votes << Vote.new(comment_id: @comment.id, voter_id: current_user.id, value: -1)
    redirect
  end

  private
  def redirect
    redirect_to "/games/#{@game.url}"
  end

  def set_comment
    @comment = Comment.find(params[:id])
    @game = @comment.game
  end

  def comment_params
    params.require(:comment).permit(:content, :game_id, :commenter_id)
  end
end
