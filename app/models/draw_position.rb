class DrawPosition < ActiveRecord::Base
  has_many :draw_positions_players
  has_many :players, through: :draw_positions_players

  belongs_to :match
  belongs_to :draw

  # http://stackoverflow.com/questions/11487709/how-to-pass-arbitrary-non-model-attribute-values-to-a-rails-action
  attr_accessor :winner

  def has_player?
    self.players.first.nil?
  end
end
