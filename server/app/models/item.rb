class Item < ApplicationRecord
  belongs_to :product

  validates :product, presence: true


# Si sélectionne robe rouge 

# Je veux voir => Picked ? y / n
# Si oui => par qui ? + checked ? y / n 
# Si oui => par qui ? + packed ? y / n 
# Si oui => par qui ?

# Dans model items => 
# ajouter « status » picked / checked / packed default 0 

# implémenter fonction pour voir "qui" à effectuer l'action
end
