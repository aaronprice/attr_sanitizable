# frozen_string_literal: true
require 'spec_helper'

describe AttrSanitizable do

  let(:user) { User.new }

  it "success" do
    user.email = " NOBODY@EXAMPLE.COM"
    expect(user.email).to eq("nobody@example.com")
  end

  it "actions with params" do
    class User < ActiveRecord::Base
      attr_sanitizable :phone, with: [[:scan, /\d/], :join, [:sub, /^1/, '']]
    end

    user.phone = "+1 (555) 555-5555"
    expect(user.phone).to eq("5555555555")
  end

  it "function sequence matters" do
    class User < ActiveRecord::Base
      attr_sanitizable :email, with: [:downcase, :upcase]
    end

    user = User.new
    user.email = "NoBodY@ExAMPlE.cOM"
    expect(user.email).to eq("NOBODY@EXAMPLE.COM")
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
    expect(user.email).to eq(nil)
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
    expect(user.email).to eq("nobody@ex@mple.com")
  end

  it "fails" do
    expect {
      class User < ActiveRecord::Base
        attr_sanitizable
      end
    }.to raise_error(ArgumentError, "You need to supply at least one attribute")
  end
end