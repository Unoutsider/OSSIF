class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        reset_session
        session[:user_id] = @user.id
        flash[:success] = "Добро пожаловать, #{@user.name}!"
        if User.find(session[:user_id]).superuser then
          redirect_to '/users/users_data'
        else
          redirect_to '/users/profile'
        end
      else
        flash[:warning] = 'Неверный e-mail или пароль'
        redirect_to '/sessions/new'
        return
      end
    else
      flash[:warning] = 'Неверный e-mail или пароль'
      redirect_to '/sessions/new'
      return
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Вы вышли из учетной записи!'
    redirect_to '/main/input'
  end
end
