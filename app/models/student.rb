class Student < ApplicationRecord
  belongs_to :user
  has_many :capstones
  has_many :educations
  has_many :experiences
  has_many :skills
end
