class Task < ApplicationRecord
validates :name, presence: true, uniqueness: true
validates :sphere, presence: true
validates :description, presence: true
validates :anwer_1, presence: true
validates :anwer_2, presence: true
validates :anwer_3, presence: true
validates :anwer_1_cost, presence: true, format: {
  with: /[0-9]/,
  message: 'имеет недопустимый формат'
}
validates :anwer_2_cost, presence: true, format: {
  with: /[0-9]/,
  message: 'имеет недопустимый формат'
}
validates :anwer_3_cost, presence: true, format: {
  with: /[0-9]/,
  message: 'имеет недопустимый формат'
}
end
