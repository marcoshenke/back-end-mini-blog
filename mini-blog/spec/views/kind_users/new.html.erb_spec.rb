require 'rails_helper'

RSpec.describe "kind_users/new", type: :view do
  before(:each) do
    assign(:kind_user, KindUser.new())
  end

  it "renders new kind_user form" do
    render

    assert_select "form[action=?][method=?]", kind_users_path, "post" do
    end
  end
end
