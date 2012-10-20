class DashboardController < ApplicationController
  before_filter :require_user

  def index
    @inbound_messages = InboundMessage.where(:status => 0)
    @conversations = current_user.conversations
  end
end
