require 'rails_helper'

RSpec.describe MeadowsController, type: :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'assigns collection' do
      meadow = create(:meadow)

      get :index

      expect(assigns(:collection)).to eq([meadow])
    end
  end

  describe 'GET new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template('new')
    end

    it 'assigns meadow' do
      get :new

      expect(assigns(:meadow)).to be_a_new(Meadow)
    end
  end

  describe 'POST create' do
    it 'creates new meadow' do
      restaurant = create(:restaurant)
      meadow_params = attributes_for(:meadow).merge(restaurant_id: restaurant.id)

      expect { post :create, params: { meadow: meadow_params } }.to change(Meadow, :count).by(1)

      expect(response).to redirect_to(:collection)
    end
  end

  describe 'PUT update' do
    let(:meadow) { create(:meadow) }

    it 'updates a restaurant' do
      put :update, params: { id: meadow.id, meadow: { name: 'FooBaz' } }

      meadow.reload

      expect(meadow.name).to eq('FooBaz')

      expect(response).to redirect_to(:collection)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a meadow' do
      @meadow = create(:meadow)

      expect { delete :destroy, params: { id: @meadow.id } }.to change(Meadow, :count).by(-1)

      expect(response).to redirect_to(:collection)
    end
  end
end
