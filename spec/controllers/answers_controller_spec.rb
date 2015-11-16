require 'rails_helper'

describe AnswersController do
  describe 'GET #new' do
    before { sign_in create(:user) }
    let(:question) { create(:question) }

    it 'execute before_action :set_question' do
      expect(subject).to receive(:set_question)
      get :new, question_id: question
    end

    it 'execete before_action :set_answer' do
      expect(subject).to receive(:set_answer)
      get :new, question_id: question
    end

    it 'assigns a new Answer to @answer' do
      get :new, question_id: question
      expect(assigns(:answer)).to be_a_new(Answer)
    end

  end

  describe 'GET #show' do
    it 'assigns the requesed constant to @question' do
    end
  end
end
