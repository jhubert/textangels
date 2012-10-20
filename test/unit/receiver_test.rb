require 'test_helper'

class ReceiverTest < ActiveSupport::TestCase
  test "receives a new inbound request and creates a new inbound message" do
    received = Receiver.receive(msg_data)
    assert received[:inbound_message].is_a?(InboundMessage), 'is not an inbound_message'
  end

  test "receives a new inbound request and creates a new person" do
    received = Receiver.receive(msg_data)
    assert received[:person].is_a?(Person), 'is not a person'
  end

  # test "receives a new inbound request and creates a new conversation with an angel" do
  #   received = Receiver.receive(msg_data)
  #   assert received[:conversation].is_a?(Conversation), 'is not a conversation'
  # end

  # receives a message from an angel and ties it to the right conversation


  private

  def msg_data(options={})
    options.reverse_merge!({
      "AccountSid"=>"AC94aad7378632432494c6a865b3ed2f87",
      "Body"=>"please help me",
      "ToZip"=>"90245",
      "FromState"=>"CA",
      "ToCity"=>"LOS ANGELES",
      "SmsSid"=>"SMcbc481c2b27aaceb6b583c96e9627a02",
      "ToState"=>"CA",
      "To"=>"+13103214265",
      "ToCountry"=>"US",
      "FromCountry"=>"US",
      "SmsMessageSid"=>"SMcbc481c2b27aaceb6b583c96e9627a02",
      "ApiVersion"=>"2010-04-01",
      "FromCity"=>"BEVERLY HILLS",
      "SmsStatus"=>"received",
      "From"=>"+13109909801",
      "FromZip"=>"90502",
      "controller"=>"api",
      "action"=>"sms"
    })
  end
end
