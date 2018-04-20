# coding: utf-8
class DiariesController < ApplicationController
  before_action :not_signin_user, only: [:index, :show]
  before_action :true_diary, only: [:show]
  
  def index
    user = User.find_by(id: session[:user_id])
    @diary = Diary.where(user_id: user.id)
  end

  def show
    @diary = Diary.find_by(id: params[:id])
  end

  def ture_diary
    diary = Diary.find(params[:id])
    user = User.find(session[:user_id])
    unless diary.user_id == user.id
      flash[:danger] = '人のデータをみたらどろぼう!!'
      redirect_to user_url(user)
    end
  end
end


