class Match < ActiveRecord::Base
  has_many :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :location
  belongs_to :draw

  def winner
    Player.find_by(id: self.winner_id)
  end

  def loser
    Player.find_by(id: self.loser_id)
  end

  def calculate_loser
    loser = self.players.select { |player| player.id != self.winner_id }
    self.loser_id = loser[0].id
  end

  def update_winner_loser_and_save(player_id:)
    self.winner_id = player_id
    self.calculate_loser
    self.save
  end

  def self.round(round_name)
    Match.where(name: "#{round_name}")
  end
end
