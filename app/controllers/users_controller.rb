# coding: utf-8
class UsersController < ApplicationController
  before_action :signin_user, only: [:new]
  before_action :not_signin_user, only: [:show]
  before_action :true_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      signin @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def not_signin_user
    unless signed_in?
      flash[:danger] = 'ログインしてください'
      redirect_to signin_path
    end
  end

  def signin_user
    if signed_in?
      user = User.find(session[:user_id])
      flash[:warning] = 'signupしたいときはいったん、signoutしてください'
      redirect_to user_url(user)
    end
  end

  def true_user
    access_user = User.find(params[:id])
    current_user = User.find(session[:user_id])
    unless current_user == access_user
      flash[:danger] = '人のデータをみたらどろぼう!!'
      redirect_to user_url(current_user)
    end
  end
end
