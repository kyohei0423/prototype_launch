require 'rails_helper'

describe Answer do
  describe '#create' do
    context 'when successful' do
      it 'is valid with a sentence and user_id, question_id' do
        answer = build(:answer)
        expect(answer).to be_valid
      end

      it 'is invalid without a sentence' do
        answer = build(:answer, sentence: '')
        answer.valid?
        expect(answer.errors[:sentence]).to include("を入力してください。")
      end
    end
  end
end
