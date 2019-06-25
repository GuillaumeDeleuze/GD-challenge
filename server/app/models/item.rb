class Item < ApplicationRecord
  belongs_to :product
  has_many :operators_items
  has_many :operators, through: :operators_items

  validates :product, presence: true
  validates :status, presence: true

  enum status: [:pending, :picking, :checking, :packing]

# implémenter fonction pour voir "qui" a effectuer l'action 
# Solution à envisager :

# Ajouter une nouvelle table : operators_items
# Permettrait de savoir qui est en charge d'un item
# boolean done default false 
# Quand le statut passerait de done false à true -> status += 1 -> passe à un nouvel opérateur selon son poste

# 1 - Nécessite de rajouter d'autres colonnes à items ? (picked_by, checked_by, packed_by?) 
# 2 - ou à operators_items ? (enum action: [:picked, :checked, :packed])
# Si lecture à partir de la DB = plus rapide d'avoir les infos avec solution 1 mais rajoute + de colonne

end
