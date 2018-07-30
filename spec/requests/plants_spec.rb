require 'rails_helper'
require 'plants_controller'

RSpec.describe "Plants API", type: :controller do
  # Initialize the test data
  let!(:shelf) { create(:shelf) }
  let(:shelf_id) { shelf.id }
  let!(:pot) { create(:pot) }
  let(:pot_id) { pot.id }
  let!(:plants) { create_list(:plant, 5, pot_id: pot.id) }
  let(:plant_id) { plants.first.id }


  # Test suite for GET /shelves/:shelf_id/pots/:pot_id/plants
  describe 'GET /shelves/:shelf_id/pots/:pot_id/plants' do
    before { get "/shelves/#{shelf_id}/pots/#{shelf_id}/plants" }

    context 'when plants exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all plants' do
        expect(json.size).to eq(5)
      end
    end

    context 'when shelf does not exist' do
      let(:shelf_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Shelf/)
      end
    end
  end

  # Test suite for GET /todos/:todo_id/items/:id
  # describe 'GET /todos/:todo_id/items/:id' do
  #   before { get "/todos/#{todo_id}/items/#{id}" }

  #   context 'when todo item exists' do
  #     it 'returns status code 200' do
  #       expect(response).to have_http_status(200)
  #     end

  #     it 'returns the item' do
  #       expect(json['id']).to eq(id)
  #     end
  #   end

  #   context 'when todo item does not exist' do
  #     let(:id) { 0 }

  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end

  #     it 'returns a not found message' do
  #       expect(response.body).to match(/Couldn't find Item/)
  #     end
  #   end
  # end

  # # Test suite for PUT /todos/:todo_id/items
  # describe 'POST /todos/:todo_id/items' do
  #   let(:valid_attributes) { { name: 'Visit Narnia', done: false } }

  #   context 'when request attributes are valid' do
  #     before { post "/todos/#{todo_id}/items", params: valid_attributes }

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when an invalid request' do
  #     before { post "/todos/#{todo_id}/items", params: {} }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #     it 'returns a failure message' do
  #       expect(response.body).to match(/Validation failed: Name can't be blank/)
  #     end
  #   end
  # end

  # # Test suite for PUT /todos/:todo_id/items/:id
  # describe 'PUT /todos/:todo_id/items/:id' do
  #   let(:valid_attributes) { { name: 'Mozart' } }

  #   before { put "/todos/#{todo_id}/items/#{id}", params: valid_attributes }

  #   context 'when item exists' do
  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end

  #     it 'updates the item' do
  #       updated_item = Item.find(id)
  #       expect(updated_item.name).to match(/Mozart/)
  #     end
  #   end

  #   context 'when the item does not exist' do
  #     let(:id) { 0 }

  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end

  #     it 'returns a not found message' do
  #       expect(response.body).to match(/Couldn't find Item/)
  #     end
  #   end
  # end

  # # Test suite for DELETE /todos/:id
  # describe 'DELETE /todos/:id' do
  #   before { delete "/todos/#{todo_id}/items/#{id}" }

  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end



