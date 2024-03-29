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

  describe 'POST #create' do
    before{ sign_in create(:user) }
    let(:question) { create(:question) }

    context 'when successful' do
      it 'create new answer' do
        expect{
          post :create, answer: attributes_for(:answer), question_id: question
        }.to change(Answer, :count).by(1)
      end

      it 'redirect to the :show' do
        post :create, answer: attributes_for(:answer), question_id: question
        expect(response).to redirect_to question_answer_path(question, assigns(:answer))
      end

      it 'hax notice' do
        post :create, answer: attributes_for(:answer), question_id: question
        expect(flash[:notice]).to eq '解答の投稿が完了しました。'
      end
    end

    context 'when fail' do
      it 'not create new answer' do
        expect{
          post :create, answer: { sentence: '' }, question_id: question
        }.not_to change(Answer, :count)
      end

      it 'render the :new template' do
        post :create, answer: { sentence: '' }, question_id: question
        expect(response).to render_template :new
      end
    end
  end
end
