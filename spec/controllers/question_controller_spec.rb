require 'rails_helper'

describe QuestionsController do
  describe 'GET #show' do
    it 'assigns the requesed constant to @question' do
      question = create(:question)
      get :show, id: question
      expect(assigns(:question)).to eq question
    end
  end

  describe 'GET #new' do
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
    it 'saves the new constant in the database' do
      expect{
        post :create, question: attributes_for(:question)
      }.to change(Question, :count).by(1)
    end
  end
end
