class CommentsController < ApplicationController
  before_action :load_commentable, only: [:create]

  def create
    @comment = @commentable.comments.new(comment_params)
    unless @comment.save
      render template: "#{@comment}/show", alert: 'コメントの保存に失敗しました'
    end
    @comments = @commentable.comments
  end

  def destroy
    
  end

  def update
    
  end

  private
    def load_commentable
      @comment, id = request.path.split('/')[1, 2]
      @commentable = @comment.singularize.classify.constantize.find(id)
    end

    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id)
    end
end
