require 'rails_helper'

RSpec.describe "kind_users/show", type: :view do
  before(:each) do
    assign(:kind_user, KindUser.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
