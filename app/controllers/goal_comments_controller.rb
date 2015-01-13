class GoalCommentsController < ApplicationController
  def create
    @comment = GoalComment.new(comment_params)
    @comment.author = current_user
    flash[:errors] = @comment.errors.full_messages
    redirect_to :back
  end

  private

    def comment_params
      params.require(:comment).permit(:goal_id, :body)
    end

end
