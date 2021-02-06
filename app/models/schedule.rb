class Schedule < ApplicationRecord
  validates :content, {presence: true}
end
