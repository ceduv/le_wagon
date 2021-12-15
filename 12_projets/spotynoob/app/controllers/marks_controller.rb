class MarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @mark = Mark.new
    @musics = Music.all.uniq
  end

  def create
    @mark = Mark.new(mark_params)
    @mark.list_id = params[:list_id]
    @mark.save
    redirect_to list_path(params[:list_id])
  end

  private

  def mark_params
    params.require(:mark).permit(:music_id)
  end
end
