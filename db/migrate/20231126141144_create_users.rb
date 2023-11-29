class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :login
      t.string :date
      t.string :password_digest
      t.boolean :superuser, null: false, default: false
      t.integer :rating, null: 0, default: 0
      t.integer :balance, null: 0, default: 0
      t.string :current_sphere, null: 'speech', default: 'speech'
      t.integer :speech, null: 0, default: 0
      t.integer :productivity, null: 0, default: 0
      t.integer :sleep, null: 0, default: 0
      t.integer :nutrition, null: 0, default: 0
      t.boolean :tested, null: false, default: false
      t.integer :secret_number
    end
  end
end
