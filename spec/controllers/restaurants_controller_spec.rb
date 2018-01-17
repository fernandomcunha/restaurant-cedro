require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'assigns collection' do
      restaurant = create(:restaurant)

      get :index

      expect(assigns(:collection)).to eq([restaurant])
    end
  end

  describe 'GET new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template('new')
    end

    it 'assigns restaurant' do
      get :new

      expect(assigns(:restaurant)).to be_a_new(Restaurant)
    end
  end

  describe 'POST create' do
    it 'creates new restaurant' do
      restaurant_params = attributes_for(:restaurant)

      expect { post :create, params: { restaurant: restaurant_params } }.to change(Restaurant, :count).by(1)

      expect(response).to redirect_to(:collection)
    end
  end

  describe 'PUT update' do
    let(:restaurant) { create(:restaurant) }

    it 'updates a restaurant' do
      put :update, params: { id: restaurant.id, restaurant: { name: 'Baz' } }

      restaurant.reload

      expect(restaurant.name).to eq('Baz')

      expect(response).to redirect_to(:collection)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a restaurant' do
      @restaurant = create(:restaurant)

      expect { delete :destroy, params: { id: @restaurant.id } }.to change(Restaurant, :count).by(-1)

      expect(response).to redirect_to(:collection)
    end
  end
end
