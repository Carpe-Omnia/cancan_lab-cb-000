class NotesController < ApplicationController
  def current_user
    User.find_by(id: session[:user_id])
  end

  def show
    @note = Note.find_by(id: params["id"])
    authorize! :read, @note
  end
  def index
    @user = User.find_by(id: session[:user_id])
    if !!@user
      @notes = @user.readable
    else
      @notes = []
    end
  end
  def new
    @note = Note.new
  end
  def create
    if !User.find_by(id: session[:user_id])
      redirect_to '/'
    end
    @note = Note.create(note_params)
    @note.readers << User.find_by(id: session[:user_id])
    @note.user_id = session[:user_id]
    @note.save
    redirect_to '/'
  end
  def update
    @note = Note.find_by(id: params["id"])
    authorize! :update, @note
    @note.update(note_params)
    redirect_to '/'
  end
  def edit
    @note = Note.find_by(id: params["id"])
    authorize! :update, @note
  end
  def destroy
    @note = Note.find_by(id: params["id"])
    authorize! :destroy, @note
  end
  private

  def note_params
    params.require(:note).permit(:visible_to, :content)
  end

end
