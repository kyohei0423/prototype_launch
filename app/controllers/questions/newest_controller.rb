class Questions::NewestController < ApplicationController
  def index
    @questions = Question.order(created_at: :DESC).includes(:tags).where(private: false)
  end
end
