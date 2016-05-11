class Mark < ActiveRecord::Base
  belongs_to :student
  belongs_to :stream_subject
  belongs_to :mark
end
