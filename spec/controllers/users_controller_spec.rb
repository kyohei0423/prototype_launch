require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    let(:user) { create(:user) }

    it 'execete before_action :set_user' do
      expect(subject).to receive(:set_user)
      get :show, id: user
    end

    it 'assigns the requesed constant to @user' do
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it 'render the :show template' do
      get :show, id: user
      expect(response).to render_template :show
    end
  end
end
