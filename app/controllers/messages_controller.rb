class MessagesController < ApplicationController
  before_action :set_room

  def new
    @message = @room.messages.build
  end

  def create
    @message = @room.messages.build(message_params)
    if @message.save
      redirect_to @room
    else
      render :new
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
