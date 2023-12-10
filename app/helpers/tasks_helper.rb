module TasksHelper
  def validate_input
    @task = Task.new(params.permit(:name, :sphere, :description, :answer_1, :answer_2, :answer_3, :answer_1_cost, :answer_2_cost, :answer_3_cost))
    unless @task.valid?
      redirect_to '/tasks/offer'
      flash[:warning] = @task.errors.full_messages.to_sentence
    end
  end
end
