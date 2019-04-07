class NotesController < ApplicationController


  def show
  end
  def index
  end
  def new
  end
  def create
  end
  def update
  end
  def edit
  end

  private

  def note_params
    params.requite(:note).permit(:visible_to, :content)
  end

end                 
