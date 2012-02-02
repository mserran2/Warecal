class User < ActiveRecord::Base
  has_many :assigments
  has_many :shifts, through: :assigments
end
