class Draw < ActiveRecord::Base

  before_create :create_draw_structure

  has_many :matches
  has_many :draw_positions
  has_many :players, through: :draw_positions

  belongs_to :tournament

  def self.has_adjacent_players?(draw_position)
    dp1 = DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2).player.nil?
    dp2 = DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2 + 1).player.nil?

    if dp1 && dp2
      return false
    end
    true
  end

  def self.fetch_player_options(draw_position)
    player_options = {
        player1: DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2).players.first,
        player2: DrawPosition.find_by(draw_positions_number: draw_position.draw_positions_number * 2 + 1).players.first }
  end

  private

  def draw_positions_count
      (2 * self.size) - 1
  end

  def create_draw_positions
    draw_positions_count.times do |d|
      dp = DrawPosition.new
      self.draw_positions << dp
    end
  end

  def matches_count
    self.size - 1
  end

  def create_draw_structure
    rounds = { "champion"   => 1,
               "final"      => (2..3),
               "semis"      => (4..7),
               "quarters"   => (8..15),
               "oitavas"    => (16..31),
               "sixty_four" => (32..63) }

    rounds.each do |k,v|
      k == "champion" ? create_champion_position : create_matches_and_draw_positions(rounds["#{k}"], "#{k}")
    end
  end

  def create_matches_and_draw_positions(starting_point, name)
    starting_point.each do |t|
      if t.even?
        ct = self.draw_positions.count
        m = Match.create!(match_number: t/2, name: name)
        self.matches << m

        dp1 = DrawPosition.create!(draw_positions_number: m.match_number * 2)
        m.draw_positions << dp1
        self.draw_positions << dp1

        dp2 = DrawPosition.create!(draw_positions_number: m.match_number * 2 + 1)
        m.draw_positions << dp2
        self.draw_positions << dp2
      else
        next
      end
    end
  end

  def create_champion_position
    dp = DrawPosition.create!(draw_positions_number: 1)
    self.draw_positions << dp
  end
end
