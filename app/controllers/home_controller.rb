class HomeController < ApplicationController
  before_action :set_question, only: :index

  def index
  end

  private
    def set_question
      @questions = Question.all
    end
end