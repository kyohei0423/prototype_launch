class HomeController < ApplicationController
  before_action :set_questions, only: :index

  def index
    @tags = ActsAsTaggableOn::Tag.includes(:taggings).most_used
  end

  def search
    include_keyword_in_title_or_sentence = Question.where('title LIKE(?) or sentence LIKE(?)',"%#{params[:keyword]}%", "%#{params[:keyword]}%").order('title ASC').limit(20)
    include_keyword_in_tags = Question.tagged_with(params[:keyword])
    @questions = (include_keyword_in_tags + include_keyword_in_title_or_sentence).uniq
  end

  private
    def set_questions
      @questions = Question.order(created_at: :DESC).includes(:tags)
    end
end
