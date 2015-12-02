class HomeController < ApplicationController
  before_action :set_questions, only: :index

  def index
  end

  def search
    @questions = Question.where('title LIKE(?)',"%#{search_params[:keyword]}%").order('title ASC').limit(20)
  end

  private
    def set_questions
      @questions = Question.order(created_at: :DESC).includes(:tags)
    end

    def search_params
      params.permit(:keyword)
    end
end
