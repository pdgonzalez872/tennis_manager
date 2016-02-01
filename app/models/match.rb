class Match < ActiveRecord::Base
  has_many   :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :location
  belongs_to :draw

  def self.round(round_name)
    Match.where(name: "#{round_name}")
  end
end
