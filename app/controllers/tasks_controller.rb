class TasksController < ApplicationController
  include TasksHelper
  before_action :validate_input, only: :offer_create

  def react
  end

  def offer
  end

  def offer_results
  end

  def edit
  end

  def tasks_data
  end

  def test
  end

  def task
  end

  def positive_offer
    @task = Task.find_by(id: params[:task_id])
    @user = User.find_by(id: params[:user_id])
    @task.agreed = true
    @user.balance = @user.balance + 50
    @task.save
    @user.save
    redirect_to '/tasks/tasks_data'
    flash[:success] = "Задание принято!"
  end

  def negative_offer
    @task = Task.find_by(id: params[:task_id])
    @task.agreed = true
    @task.sphere = 'garbage'
    @task.save
    redirect_to '/tasks/tasks_data'
    flash[:warning] = "Задание отклонено!"
  end

  def delete_task
    @task = Task.find_by(id: params[:task_id])
    @task.sphere = 'garbage'
    @task.save
    redirect_to '/tasks/edit'
    flash[:success] = "Задание удалено!"
  end

  def offer_create
    unless @task.valid?
      redirect_to '/tasks/offer'
      flash[:warning] = "Ошибка!"
      return
    else
      if (params[:sphere].to_s == 'speech' or params[:sphere].to_s == 'productivity' or params[:sphere].to_s == 'sleep' or params[:sphere].to_s == 'nutrition') and
      ((params[:answer_1_cost].to_i + params[:answer_2_cost].to_i + params[:answer_3_cost].to_i) == 9)
        @user = User.find(session[:user_id])
        if @user.superuser
          @task.agreed = true
        end
        @task.creater = @user.id
        @task.save
        redirect_to '/tasks/offer'
        flash[:success] = "Успешно!"
      else
        redirect_to '/tasks/offer'
        flash[:warning] = "Неверные параметры!"
      end
    end
  end

end
