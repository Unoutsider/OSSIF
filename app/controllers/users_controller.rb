class UsersController < ApplicationController
  include UsersHelper
  before_action :validate_input, only: :create

  def create
    unless @user.valid?
      redirect_to '/users/create'
      return
    else
      @user.save
      session[:user_id] = @user.id
      flash[:success] = "Добро пожаловать, #{@user.name}!"
      redirect_to home_path
    end
  end

  def new
  end

  def show
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    reset_session
  end
end
