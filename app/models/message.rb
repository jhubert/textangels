class Message < ActiveRecord::Base
  acts_as_keyed

  attr_accessible :body, :conversation_id, :from_type, :from_id, :status

  after_create :deliver_sms

  belongs_to :conversation

  private

  def deliver_sms
    return if self.from_type == 'Person'
    @client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
    @client.account.sms.messages.create(
      :from => '+13103214265',
      :to => conversation.person.phone,
      :body => self.body
    )
  end
end
