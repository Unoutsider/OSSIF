class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :sphere
      t.text :description
      t.string :anwer_1
      t.string :answer_2
      t.string :answer_3
      t.integer :answer_1_cost
      t.integer :answer_2_cost
      t.integer :answer_3_cost
      t.boolean :agreed, null: true, default: true
    end
  end
end
