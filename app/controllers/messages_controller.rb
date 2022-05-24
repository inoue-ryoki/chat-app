class MessagesController < ApplicationController
  def index

    @message = Message.new
     @room = Room.find(params[:room_id])
     @messages = @room.messages.includes(:user)

  end

  def create
    # ボタンを押した瞬間発動する

    @room = Room.find(params[:room_id])
    # どのルームか判別する
    @message = @room.messages.new(message_params)
    # どのルームのメッセージか判別してメッセージの内容を入れる
       if @message.save
    # メッセージが保存できたら保存後の情報に更新され、メッセージ画面にもどる
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end

  end

  private

  def message_params
   params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  # メッセージの内容とuser idの中にcurrent_user.idを入れる
  # mergeは追加する
end
