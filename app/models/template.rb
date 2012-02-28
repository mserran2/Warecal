class Template < ActiveRecord::Base
  has_many :shifts
  #validates :start, :format => {:with => /([012]|[1-9]):[0-5][0-9](\\s)?(?i)(am|pm)/, :message => "Start time must be entered as 12:00pm"}
  #validates :start, :format => {:with => /([012]|[1-9]):[0-5][0-9](\\s)?(?i)(am|pm)/, :message => "End time must be entered as 12:00pm"}
end
