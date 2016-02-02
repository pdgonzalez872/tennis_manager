class DrawPosition < ActiveRecord::Base
  has_many :player

  belongs_to :match
  belongs_to :draw
end
