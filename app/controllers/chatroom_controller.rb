class ChatroomController < ApplicationController
  def show
    @messages = Message.all 
    p @messages
  end
end
