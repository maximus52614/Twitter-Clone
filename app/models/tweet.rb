class Tweet < ApplicationRecord
  belongs_to :user
  validates_length_of :content, :minimum => 0, :maximum => 75, :allow_blank => false
end
