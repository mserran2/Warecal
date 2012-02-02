class Assigment < ActiveRecord::Base
  belongs_to :shift
  belongs_to :user
end
