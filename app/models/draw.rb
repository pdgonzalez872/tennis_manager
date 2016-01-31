class Draw < ActiveRecord::Base

  before_create :create_draw_positions

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

  def create_matches_and_draw_positions
    # matches_count.
  end
end
