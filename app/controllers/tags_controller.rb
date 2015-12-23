class TagsController < ApplicationController
  before_action :set_tag, only: :show
  before_action :set_tags, only: [:show, :index]
  before_action :set_questions, only: :show

  def index
  end

  def show
    @tag_questions = Question.tagged_with(@tag.name)
  end

  private
    def set_tag
      @tag = ActsAsTaggableOn::Tag.find params[:id]
    end

    def set_tags
      @tags = ActsAsTaggableOn::Tag.includes(:taggings).most_used
    end

    def set_questions
      @questions = Question.order(created_at: :DESC).includes(:tags)
    end
end
