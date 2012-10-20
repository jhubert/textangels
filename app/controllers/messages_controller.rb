class MessagesController < ApplicationController
  before_filter :require_user

  def new
  end

  def create
    if params[:inbound_message_id]
      im = InboundMessage.find_by_id(params[:inbound_message_id])
      person = im.person

      conv = Conversation.find_by_person_id_and_user_id_and_status(person.id, current_user.id, 1)
      conv = Conversation.create(:person_id => person.id, :user_id => current_user.id, :status => 1) unless conv

      @message = conv.messages.build(:body => im.message)
      @message.from_type = 'Person'
      @message.from_id = person.id
      @message.save
    else
      conv = Conversation.find_by_id(params[:conversation_id])
    end

    @message = conv.messages.build(:body => params[:message][:body])
    @message.from_type = 'User'
    @message.from_id = current_user.id
    @message.save

    if @message.save
      if im
        im.conversation_id = conv.id
        im.status = 1
        im.save
      end
      redirect_to dashboard_path, :notice => 'Reply sent'
    else
      redirect_to dashboard_path, :notice => 'There was an error replying'
    end
  end
end
