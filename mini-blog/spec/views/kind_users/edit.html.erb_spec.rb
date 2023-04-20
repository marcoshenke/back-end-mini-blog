require 'rails_helper'

RSpec.describe "kind_users/edit", type: :view do
  let(:kind_user) {
    KindUser.create!()
  }

  before(:each) do
    assign(:kind_user, kind_user)
  end

  it "renders the edit kind_user form" do
    render

    assert_select "form[action=?][method=?]", kind_user_path(kind_user), "post" do
    end
  end
end
