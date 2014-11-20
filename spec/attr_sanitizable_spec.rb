require 'spec_helper'

describe AttrSanitizable do

  let(:user) { User.new }

  it "success" do
    user.email = " NOBODY@EXAMPLE.COM"
    user.email.should eq("nobody@example.com")
  end

  it "function sequence matters" do
    class User < ActiveRecord::Base
      attr_sanitizable :email, with: [:downcase, :upcase]
    end

    user = User.new
    user.email = "NoBodY@ExAMPlE.cOM"
    user.email.should eq("NOBODY@EXAMPLE.COM")
  end

  it "function doesn't exist" do
    class User < ActiveRecord::Base
      attr_sanitizable :email, with: [:not_defined]
    end

    user = User.new
    expect {
      user.email = " NOBODY@EXAMPLE.COM"
    }.to raise_error(ArgumentError, "Unable to perform 'not_defined' on a variable of type 'String'")
  end


  it "ignore nil" do
    class User < ActiveRecord::Base
      attr_sanitizable :email, with: [:strip]
    end

    user = User.new
    user.email = nil
    user.email.should eq(nil)
  end

  it "custom functions" do
    class String
      def troll
        self.gsub(/a/, "@")
      end
    end

    class User < ActiveRecord::Base
      attr_sanitizable :email, with: [:troll]
    end

    user = User.new
    user.email = "nobody@example.com"
    user.email.should eq("nobody@ex@mple.com")
  end

  it "fails" do
    expect {
      class User < ActiveRecord::Base
        attr_sanitizable
      end
    }.to raise_error(ArgumentError, "You need to supply at least one attribute")
  end
end