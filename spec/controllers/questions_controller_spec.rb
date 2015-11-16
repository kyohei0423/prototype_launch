require 'rails_helper'

describe QuestionsController do
  describe 'GET #show' do
    let(:question) { create(:question) }

    it 'assigns the requesed constant to @question' do
      get :show, id: question
      expect(assigns(:question)).to eq question
    end

    it 'render the :show template' do
      get :show, id: question
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before{ controller.stub(:authenticate_user!).and_return(true) }
    it 'assigns a new Question to @question' do
      get :new
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'render the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before { sign_in create(:user) }

    context 'when successful' do
      it 'create new question' do
        expect{
          post :create, question: attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      it 'redirect to the :show template' do
        post :create, question: attributes_for(:question)
        expect(response).to redirect_to question_path(assigns(:question))
      end

      it 'has the notice' do
        post :create, question: attributes_for(:question)
        expect(flash[:notice]).to eq('問題の投稿が完了しました。')
      end
    end

    context 'when fail' do
      it 'not create new question' do
        expect{
          post :create, question: { title: '', sentence: '' }
        }.not_to change(Question, :count)
      end

      it 'render to the :new template' do
        post :create, question: { title: '', sentende: '' }
        expect(response).to render_template :new
      end
    end
  end
end
