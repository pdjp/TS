class Schedule < ApplicationRecord
  validates :content, {presence: true}
  validates :user_id, {presence: true}
  validates :money, {presence: true}
  def user
    return User.find_by(id: self.user_id)
  end
end
