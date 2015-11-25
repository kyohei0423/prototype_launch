class HomeController < ApplicationController
  before_action :set_questions, only: :index

  def index
  end

  private
    def set_questions
      @questions = Question.order(created_at: :DESC).includes(:tags)
    end
end