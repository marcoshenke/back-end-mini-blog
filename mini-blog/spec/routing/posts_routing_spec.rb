require 'rails_helper'

RSpec.describe PostsController, type: :routing do
  let(:url) { 'http://localhost:3000' }

  it 'routes to #index via GET' do
    expect(get: "#{url}/posts").to route_to(
      controller: 'posts',
      action: 'index'
    )
  end

  it 'routes to #show via GET' do
    expect(get: "#{url}/posts/1").to route_to(
      controller: 'posts',
      action: 'show',
      id: '1'
    )
  end

  it 'routes to #update via PUT' do
    expect(put: "#{url}/posts/1").to route_to(
      controller: 'posts',
      action: 'update',
      id: '1'
    )
  end

  it 'routes to #destroy via DELETE' do
    expect(delete: "#{url}/posts/1").to route_to(
      controller: 'posts',
      action: 'destroy',
      id: '1'
    )
  end
end
