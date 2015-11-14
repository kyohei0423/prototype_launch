require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    it 'assigns the requesed constant to @user' do
      user = create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it 'render the :show template' do
      user = create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end
end
