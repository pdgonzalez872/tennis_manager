class DrawPosition < ActiveRecord::Base
  has_one :player

  belongs_to :match
  belongs_to :draw
end
