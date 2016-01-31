class Draw < ActiveRecord::Base

  has_many :matches
  has_many :draw_positions

  belongs_to :tournament

end
