class User < ApplicationRecord
has_many :viewers
has_many :readable, through: :viewers, source: :note
has_many :notes
end
