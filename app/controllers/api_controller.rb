class ApiController < ApplicationController
  protect_from_forgery :only => []

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Congratulations! You\'ve successfully deployed ' \
            'the Twilio HackPack for Heroku and Sinatra!', :voice => 'woman'
    end
    render :text => response.text
  end

  def sms
    received = Receiver.receive(params)
    if received[:inbound_message]
      response = Twilio::TwiML::Response.new do |r|
        r.Sms 'Hang tight. We\'re contacting an angel for you...'
      end
      render :text => response.text
    end
  end
end
