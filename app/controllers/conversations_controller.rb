class ConversationsController < ApplicationController
  before_filter :require_user

  def index
    @conversations = current_user.conversations
  end

  def show
    @conversation = current_user.conversations.find_by_key(params[:id])
  end
end
