class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.includes(:user)
  end

  def show
    @list = List.find(params[:id])
    @musics = Mark.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :style, :photo)
  end
end
