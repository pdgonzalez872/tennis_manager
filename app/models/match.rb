class Match < ActiveRecord::Base
  has_many :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :location
  belongs_to :draw

  def winner=(player_id)
    self.winner_id = player_id
  end

  def winner
    player = Player.find_by(self.winner_id)
  end

  def calculate_loser
    loser = self.players.select { |player| player.id != self.winner_id }
    self.loser_id = loser[0].id
  end

  def self.round(round_name)
    Match.where(name: "#{round_name}")
  end
end
