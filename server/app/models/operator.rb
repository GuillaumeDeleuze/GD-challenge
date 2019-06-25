class Operator < ApplicationRecord
  has_many :operators_postes, dependent: :destroy
  has_many :postes, through: :operators_postes
  has_many :operators_items, dependent: :destroy
  has_many :items, through: :operators_items

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
