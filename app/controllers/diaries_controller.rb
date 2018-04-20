# coding: utf-8
class DiariesController < ApplicationController
  include DiariesHelper 

  before_action :not_signin_user, only: [:index, :show]
  before_action :true_diary, only: [:show]
  
  def index
    user = User.find_by(id: session[:user_id])
    @diary = Diary.where(user_id: user.id)
  end

  def show
    @diary = Diary.find_by(id: params[:id])
    @statement = markdown(@diary.statement)
  end

  def edit

  end

  def new
    @diary = Diary.new
  end

  def create
    user = User.find(session[:user_id])
    date = display_date
    @diary = Diary.new(display_date: date,statement: params[:diary][:statement],user_id: user.id)
    if @diary.save
      redirect_to diarylist_path
    else
      render 'new'
    end
  end
  
  def true_diary
    diary = Diary.find(params[:id])
    user = User.find(session[:user_id])
    unless diary.user_id == user.id
      flash[:danger] = '人のデータをみたらどろぼう!!'
      redirect_to user_url(user)
    end
  end
end


