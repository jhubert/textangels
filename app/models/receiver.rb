class Receiver
  def self.receive(data)
    conversation, person, angel, message, inbound_message = nil, nil, nil, nil, nil

    person = Person.find_by_phone(data["From"])
    unless person
      # TODO: Handle sms messages from Angels as well
      person = Person.create({ :phone => data["From"], :zip => data["FromZip"], :state => data["FromState"], :city => data["FromCity"] })
    end

    if conversation = Conversation.find_by_person_id_and_status(person.id, 1)
      message = conversation.messages.build
      message.body = data["Body"]
      message.from_type = 'Person'
      message.from_id = person.id
      message.save
    else
      inbound_message = person.inbound_messages.create :message => data["Body"], :request_type => 'sms', :status => 0
    end

    output = {
      :person => person || nil,
      :conversation => conversation || nil,
      :inbound_message => inbound_message || nil,
      :angel => angel || nil,
      :message => message || nil
    }
  end
end
