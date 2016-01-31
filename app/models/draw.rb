class Draw < ActiveRecord::Base

  has_many :matches

  belongs_to :tournament

end
