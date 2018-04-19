class DiariesController < ApplicationController

  def index
    user = User.find_by(id: session[:user_id])
    @diary = Diary.where(user_id: user.id)
  end
    
end
