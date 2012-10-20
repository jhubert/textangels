class Conversation < ActiveRecord::Base
  acts_as_keyed

  attr_accessible :active, :person_id, :person_phone, :user_id, :user_phone, :status

  has_many :messages
  belongs_to :inbound_message
  belongs_to :person
  belongs_to :user
end
