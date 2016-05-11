class Stream < ActiveRecord::Base
  has_many :stream_subjects
  belongs_to :board
end
