class NotesController < ApplicationController


  def show
    load_and_authorize_resource
  end
  def index
  end
  def new
  end
  def create
  end
  def update
    load_and_authorize_resource
  end
  def edit
    load_and_authorize_resource
  end

  private

  def note_params
    params.requite(:note).permit(:visible_to, :content)
  end

end
