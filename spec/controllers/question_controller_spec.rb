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
    it 'render the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end
end
