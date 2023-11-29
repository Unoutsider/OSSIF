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
      if @user.superuser
        redirect_to '/users/users_data'
      else
        redirect_to '/users/profile'
      end
    end
  end

  def new_password
    @user = User.find_by(email: params[:email])
    if @user
      if params[:secret_number].to_i == @user.secret_number.to_i
        @user.password = params[:password]
        @user.save
        flash[:success] = "Пароль успешно изменён!"
        redirect_to '/sessions/new'
      else
        flash[:warning] = 'Неверное секретное число!'
        redirect_to '/users/reset'
        return
      end
    else
      flash[:warning] = 'Неверный e-mail!'
      redirect_to '/users/reset'
      return
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    reset_session
  end

  def cash_check
    @user = User.find_by(id: session[:user_id])
    if params[:card_owner].empty? or params[:card_number].empty?
      flash[:warning] = "Заполните все поля!"
    else
      if params[:cash].to_i < @user.balance and params[:cash].to_i > 0
        flash[:success] = "Вывод средств выполнен успешно!"
        @user.balance = @user.balance - params[:cash].to_i
        @user.save
        redirect_to '/users/withdrawal'
      else
        flash[:warning] = "Введена некорректная сумма для вывода!"
        redirect_to '/users/withdrawal'
      end
    end
  end

  def competition_speech
  end
  def competition_productivity
  end
  def competition_sleep
  end
  def competition_nutrition
  end
  def offer
  end
  def withdrawal
  end
  def reset
  end
  def new
  end
  def show
  end
  def task
  end
  def profile
  end
  def rating
  end
  def test
  end
  def users_data
  end
  def tasks_data
  end
  def competitions_data
  end
  def edit
  end
  def react
  end
end
