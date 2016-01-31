class Match < ActiveRecord::Base
  has_many   :players

  belongs_to :location
  belongs_to :draw
end
