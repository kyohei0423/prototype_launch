require 'rails_helper'

describe AnswersController do
  describe 'GET #show' do
    let(:question) { create(:question) }
    let(:answer) { create(:answer) }

    it 'execute before_action :set_question' do
      expect(subject).to receive(:set_question)
      get :show, id: answer, question_id: question
    end

    it 'execute before_action :set_answer' do
      expect(subject).to receive(:set_answer)
      get :show, id: answer, question_id: question
    end

    it 'assigns the requesed constant to @question' do
      get :show, id: answer, question_id: question
      expect(assigns(:question)).to eq question
    end

    it 'assigns the requesed constant to @answer' do
      get :show, id: answer, question_id: question
      expect(assigns(:answer)).to eq answer
    end

    it 'render the :show template' do
      get :show, id: answer, question_id: question
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    let(:question) { create(:question) }

    it 'execute before_action :set_question' do
      expect(subject).to receive(:set_question)
      get :new, question_id: question
    end

    it 'assigns a new Answer to @answer' do
      get :new, question_id: question
      expect(assigns(:answer)).to be_a_new Answer
    end

    it 'assigns the requesed constant to @question' do
      get :new, question_id: question
      expect(assigns(:question)).to eq question
    end

    it 'render the :new template' do
      get :new, question_id: question
      expect(response).to render_template :new
    end
  end
end
