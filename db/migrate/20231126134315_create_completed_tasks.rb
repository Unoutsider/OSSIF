class CreateCompletedTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :completed_tasks do |t|
      t.integer :user_id
      t.integer :task_id
    end
  end
end
