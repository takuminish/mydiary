class SessionsController < ApplicationController
  before_action :Signin_user, only: [:new]
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "#{user.name}さんでサインインしました。"
      signin user
      redirect_to user_url(user)

    else
      flash.now[:danger] = 'nameかpasswordに誤りがあります。もう一度ご確認ください。'
      render 'new'

    end
  end

  def destroy
    flash[:success] = 'サインアウトしました。'
    sign_out
    redirect_to signin_path
  end

  def Signin_user
    if signed_in?
      user = User.find_by(id: session[:user_id])
      flash[:warning] = '別のユーザでsigninしたいときはいったん、signoutしてください'
      redirect_to user_url(user)
    end
  end
end
