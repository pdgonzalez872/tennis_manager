class DrawPosition < ActiveRecord::Base
  has_many :players

  belongs_to :match
  belongs_to :draw

  def has_player?
    self.players.first.nil?
  end
end
