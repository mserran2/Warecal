class Shift < ActiveRecord::Base
  has_many :assigments
  has_many :users, through: :assigments
  belongs_to :template
end
