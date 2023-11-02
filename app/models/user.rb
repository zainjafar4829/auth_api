class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_token
  def create_token
    token = JsonWebToken.encode(user_id: self.id)
    self.update(auth_token: token)
  end
end
