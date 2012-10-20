class Person < ActiveRecord::Base
  acts_as_keyed

  attr_accessible :blocked, :city, :key, :phone, :state, :zip

  has_many :inbound_messages
  has_many :conversations
end
