class MessagesController < ApplicationController
  before_action :set_room

  def new
    @message = @room.messages.build
  end

  def create
    @message = @room.messages.build(message_params)
    if @message.save
      render turbo_stream: turbo_stream.prepend(:messages, @message)
      # 上の書き方でOKだが、明示的には以下のように書く
      # render turbo_stream: turbo_stream.prepend(:messages, partial: 'messages/message', locals: { message: @message })
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
