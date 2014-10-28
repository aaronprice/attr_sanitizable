require 'spec_helper'

describe AttrSanitizable do

  let(:user) { User.new }

  it "success" do
    user.email = " NOBODY@EXAMPLE.COM"
    user.email.should eq("nobody@example.com")
  end
end