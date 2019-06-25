class OperatorsItem < ApplicationRecord
  belongs_to :operators
  belongs_to :items

  enum action: [:picked, :checked, :packed]

end
