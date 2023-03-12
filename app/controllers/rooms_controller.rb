class RoomsController < ApplicationController

  def index
    @rooms = Room.includes(:user).order('created_at DESC')
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_messages_path(@room)
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to "/users/#{current_user.id}"
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :group_name, :introduction, user_ids: [])
  end

end
