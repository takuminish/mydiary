# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def not_signin_user
    unless signed_in?
      flash[:danger] = 'ログインしてください'
      redirect_to signin_path
    end
  end

 end
