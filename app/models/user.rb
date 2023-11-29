class User < ApplicationRecord
has_secure_password

validates :email, presence: true, uniqueness: true, format: {
  with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
  message: 'имеет недопустимый формат'
}
validates :name, presence: true
validates :date, presence: true
validates :login, presence: true, uniqueness: true
validates :secret_number, presence: true
end
