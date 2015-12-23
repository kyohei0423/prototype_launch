class TagsController < ApplicationController
  before_action :set_tag, only: :show
  before_action :set_tags, only: [:show, :index]

  def index
  end

  def show
    @questions = Question.tagged_with(@tag.name)

  end

  private
    def set_tag
      @tag = ActsAsTaggableOn::Tag.find params[:id]
    end

    def set_tags
      @tags = ActsAsTaggableOn::Tag.includes(:taggings).most_used
    end
end
