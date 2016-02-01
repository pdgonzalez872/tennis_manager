class Match < ActiveRecord::Base
  has_many   :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :location
  belongs_to :draw
end
