class InboundMessage < ActiveRecord::Base
  attr_accessible :message, :person_id, :request_type, :status

  belongs_to :person
end
