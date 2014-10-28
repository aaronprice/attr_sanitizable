require 'attr_sanitizable'

class User < ActiveRecord::Base
  attr_sanitizable :email, with: [:strip, :downcase]
end