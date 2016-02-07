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

  def find_previous_match

  end

  # To fix error: find DrawPosition you want fixed, then find player, then use the below:
  def fix_human_error(player_id:)
    pl = Player.find_by(id: player_id)
    dpp = DrawPositionsPlayer.new(player_id: player_id)
    self.draw_positions_players << dpp
  end

end
