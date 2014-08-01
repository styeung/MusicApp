class NotesController < ApplicationController
  before_action :require_user!

  def create
    user = current_user
    @track = Track.find(params[:track_id])
    @note = Note.new(user_id: user.id, track_id: @track.id, content: note_params[:content])
    if @note.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render "tracks/show"
    end
  end

  # def update
 #    @track = Track.find(params[:id])
 #
 #    if @track.update(track_params)
 #      redirect_to track_url(@track)
 #    else
 #      flash.now[:errors] = @track.errors.full_messages
 #      render :edit
 #    end
 #  end
 #
  def destroy
    @track = Track.find(params[:track_id])
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to track_url(@track)
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
