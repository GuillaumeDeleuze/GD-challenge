class OperatorsItem < ApplicationRecord
  belongs_to :operator
  belongs_to :item

  # enum action: %i(picked checked packed)

  def picked?
    operator.postes.last.category == 'pickup'
  end
  
  def checked?
    operator.postes.last.category == 'checkup'
  end

  def packed?
    operator.postes.last.category == 'packup'
  end

  def action
    if packed?
      return 'packed'
    elsif checked?
      return 'checked'
    elsif picked?
      return 'picked'
    else
      return 'Aucune information'
    end 
  end
end
