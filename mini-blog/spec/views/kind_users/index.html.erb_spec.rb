require 'rails_helper'

RSpec.describe "kind_users/index", type: :view do
  before(:each) do
    assign(:kind_users, [
      KindUser.create!(),
      KindUser.create!()
    ])
  end

  it "renders a list of kind_users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
