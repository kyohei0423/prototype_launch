class Api::QuestionsController < ApplicationController
  def newest
    @questions = Question.order(created_at: :DESC)
  end
end
