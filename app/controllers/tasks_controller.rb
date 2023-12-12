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

  def task_answer
    @user = User.find_by(id: session[:user_id])
    @task = Task.find_by(id: params[:task_id])

    @completed_task = CompletedTask.new(user_id:@user.id, task_id:@task.id)
    @completed_task.save

    sphere = params[:task_sphere]
    answer_cost = 0
    if params[:answer] == "answer_1"
      answer_cost = @task.answer_1_cost
      case sphere
        when "speech"
          @user.rating = @user.rating + answer_cost * params[:task_speech_bonus].to_i
          @user.speech = @user.speech + 3 + params[:task_speech_bonus].to_i
        when "sleep"
          @user.rating = @user.rating + answer_cost * params[:task_sleep_bonus].to_i
          @user.sleep = @user.sleep + 3 + params[:task_sleep_bonus].to_i
        when "productivity"
          @user.rating = @user.rating + answer_cost * params[:task_productivity_bonus].to_i
          @user.productivity = @user.productivity + 3 + params[:task_productivity_bonus].to_i
        when "nutrition"
          @user.rating = @user.rating + answer_cost * params[:task_nutrition_bonus].to_i
          @user.nutrition = @user.nutrition + 3 + params[:task_nutrition_bonus].to_i
      end
    elsif params[:answer] == "answer_2"
      answer_cost = @task.answer_2_cost
      case sphere
        when "speech"
          @user.rating = @user.rating + answer_cost * params[:task_speech_bonus].to_i
          @user.speech = @user.speech + 3 + params[:task_speech_bonus].to_i
        when "sleep"
          @user.rating = @user.rating + answer_cost * params[:task_sleep_bonus].to_i
          @user.sleep = @user.sleep + 3 + params[:task_sleep_bonus].to_i
        when "productivity"
          @user.rating = @user.rating + answer_cost * params[:task_productivity_bonus].to_i
          @user.productivity = @user.productivity + 3 + params[:task_productivity_bonus].to_i
        when "nutrition"
          @user.rating = @user.rating + answer_cost * params[:task_nutrition_bonus].to_i
          @user.nutrition = @user.nutrition + 3 + params[:task_nutrition_bonus].to_i
      end
    elsif params[:answer] == "answer_3"
      answer_cost = @task.answer_3_cost
      case sphere
        when "speech"
          @user.rating = @user.rating + answer_cost * params[:task_speech_bonus].to_i
          @user.speech = @user.speech + 3 + params[:task_speech_bonus].to_i
        when "sleep"
          @user.rating = @user.rating + answer_cost * params[:task_sleep_bonus].to_i
          @user.sleep = @user.sleep + 3 + params[:task_sleep_bonus].to_i
        when "productivity"
          @user.rating = @user.rating + answer_cost * params[:task_productivity_bonus].to_i
          @user.productivity = @user.productivity + 3 + params[:task_productivity_bonus].to_i
        when "nutrition"
          @user.rating = @user.rating + answer_cost * params[:task_nutrition_bonus].to_i
          @user.nutrition = @user.nutrition + 3 + params[:task_nutrition_bonus].to_i
      end
    end

    if answer_cost == 1
      @user.save
      redirect_to '/tasks/task'
      flash[:success] = "Не лучший ответ!"
    elsif answer_cost == 3
      @user.save
      redirect_to '/tasks/task'
      flash[:success] = "Нормальный ответ!"
    elsif answer_cost == 5
      @user.save
      redirect_to '/tasks/task'
      flash[:success] = "Хороший ответ!"
    else
      redirect_to '/tasks/task'
      flash[:success] = "Ошибка!"
    end
  end

  def test_answer
    @user = User.find_by(id: session[:user_id])
    @task = Task.find_by(id: params[:task_id])

    @completed_task = CompletedTask.new(user_id:@user.id, task_id:@task.id)
    @completed_task.save

    sphere = params[:task_sphere]
    if params[:answer] == "answer_1"
      @user.rating = @user.rating + @task.answer_1_cost
      case sphere
        when "speech"
          @user.speech = @user.speech + 25
        when "sleep"
          @user.sleep = @user.sleep + 25
        when "productivity"
          @user.productivity = @user.productivity + 25
        when "nutrition"
          @user.nutrition = @user.nutrition + 25
      end
    elsif params[:answer] == "answer_2"
      @user.rating = @user.rating + @task.answer_2_cost
      case sphere
        when "speech"
          @user.speech = @user.speech + 25
        when "sleep"
          @user.sleep = @user.sleep + 25
        when "productivity"
          @user.productivity = @user.productivity + 25
        when "nutrition"
          @user.nutrition = @user.nutrition + 25
      end
    elsif params[:answer] == "answer_3"
      @user.rating = @user.rating + @task.answer_3_cost
      case sphere
        when "speech"
          @user.speech = @user.speech + 25
        when "sleep"
          @user.sleep = @user.sleep + 25
        when "productivity"
          @user.productivity = @user.productivity + 25
        when "nutrition"
          @user.nutrition = @user.nutrition + 25
      end
    end

    if CompletedTask.all.length == 8
      @user.tested = true
      @user.save
      redirect_to '/tasks/task'
      flash[:success] = "Тестирование завершено!"
    else
      @user.save
      redirect_to '/tasks/test'
      flash[:success] = "Ответ записан!"
    end
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
      ((params[:answer_1_cost].to_i + params[:answer_2_cost].to_i + params[:answer_3_cost].to_i) == 9) and params[:task_class].to_i > 0 and params[:task_class].to_i < 7
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
