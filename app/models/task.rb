class Task < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :sphere, presence: true
  validates :description, presence: true
  validates :answer_1, presence: true
  validates :answer_2, presence: true
  validates :answer_3, presence: true
  validates :answer_1_cost, presence: true, format: {
    with: /[0-9]/,
    message: 'имеет недопустимый формат'
  }
  validates :answer_2_cost, presence: true, format: {
    with: /[0-9]/,
    message: 'имеет недопустимый формат'
  }
  validates :answer_3_cost, presence: true, format: {
    with: /[0-9]/,
    message: 'имеет недопустимый формат'
  }
  validates :task_class, presence: true
end
