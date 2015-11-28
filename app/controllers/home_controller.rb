class HomeController < ApplicationController
  before_action :set_questions, only: :index

  def index
  end

  def search
    @questions = Book.where('title LIKE(?)',"%#{search_params[:keyword]}%").order('title ASC').limit(20)
  end

  private
    def set_questions
      @questions = Question.all
    end
end