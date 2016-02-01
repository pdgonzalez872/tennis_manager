class Draw < ActiveRecord::Base

  before_create :create_draw_structure

  has_many :matches
  has_many :draw_positions

  belongs_to :tournament

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

    # TODO: refactor this for a programmatic solution
    rounds = { "final"      => (2..3),
               "semis"      => (4..7),
               "quarters"   => (8..15),
               "oitavas"    => (16..31),
               "sixty_four" => (32..61) }

    # create champion position - just a DrawPosition of #1
    create_champion_position

    # create finals
    rounds["final"].step(2) do |t|
      ct = self.draw_positions.count
      m = Match.create!(match_number: t/2)
      self.matches << m

      dp1 = DrawPosition.create!(draw_positions_number: ct)
      m.draw_positions << dp1
      self.draw_positions << dp1

      dp2 = DrawPosition.create!(draw_positions_number: ct + 1)
      m.draw_positions << dp2
      self.draw_positions << dp2
    end

    # create_matches_and_draw_positions(semis)

    # create quarters

    # create oitavas

  end

  def create_matches_and_draw_positions(starting_point)
    starting_point.step(2) do |t|
      ct = self.draw_positions.count
      m = Match.create!(match_number: t/2)
      self.matches << m

      dp1 = DrawPosition.create!(draw_positions_number: ct/2)
      m.draw_positions << dp1
      self.draw_positions << dp1

      dp2 = DrawPosition.create!(draw_positions_number: ct/2 + 1)
      m.draw_positions << dp2
      self.draw_positions << dp2
    end
  end

  def create_champion_position
    dp = DrawPosition.create!(draw_positions_number: 1)
    self.draw_positions << dp
  end
end
