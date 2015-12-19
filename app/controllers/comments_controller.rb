class CommentsController < ApplicationController
  before_action :set_question, only: [:create, :destroy]

  def create
    @comment = current_user.comments.create(comment_params)
  end

  def destroy
    comment = Comment.find params[:id]
    if comment.user.id == current_user.id
      comment.destroy
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(question_id: params[:question_id])
  end

  def set_question
    @question = Question.includes(:questions_users, :keeps, :comments).find params[:question_id]
  end
end
