# coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      signin user
      redirect_to signin_path
      
    else
      flash.now[:danger] = 'nameかpasswordに誤りがあります。もう一度ご確認ください。'
      render 'new'

    end
  end

  def destroy
    flash[:success] =  'サインアウトしました。'
    sign_out
    redirect_to signin_path
  end
end
