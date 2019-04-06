class Note < ApplicationRecord
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

end
