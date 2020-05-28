class ChatsController < ApplicationController
  def index
  @chat = Chat.new
  @chats = Chat.includes(:user)
  end

  def create
    @chat = Chat.create(chat_params)
    respond_to do |format|
      format.json
    end
  end
  private
  def chat_params
    params.require(:chat).permit(:message).merge(user_id: current_user.id)
  end 
end
