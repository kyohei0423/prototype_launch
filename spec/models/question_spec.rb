require 'rails_helper'

describe Question do
  describe '#create' do
    it "is valid with a title and sentence" do
      question = build(:question)
      expect(question).to be_valid
    end

    it "is invalid without a title" do
      question = build(:question, title: nil)
      question.valid?
      expect(question.errors[:title]).to include("を入力してください。")
    end

    it "is invalid without a sentence" do
      question = build(:question, sentence: nil)
      question.valid?
      expect(question.errors[:sentence]).to include("を入力してください。")
    end
  end
end
