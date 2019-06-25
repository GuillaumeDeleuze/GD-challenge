class OperatorsItem < ApplicationRecord
  belongs_to :operator
  belongs_to :item

  enum action: [:picked, :checked, :packed]

end
