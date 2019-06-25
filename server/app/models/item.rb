class Item < ApplicationRecord
  belongs_to :product

  validates :product, presence: true
  validates :status, presence: true

  enum status: [:pending, :picked, :checked, :packed]

# implémenter fonction pour voir "qui" à effectuer l'action 
# Solution à envisager :

# Ajouter une nouvelle table : operators_items
# Permettrait de savoir qui est en charge d'un item
# boolean done default false 
# Quand le statut passerait de done false à true -> status += 1 -> passe à un nouvel opérateur selon son poste

# Nécessite de rajouter d'autres colonnes à items ? (picked_by, checked_by, packed_by?) 

end
