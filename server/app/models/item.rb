class Item < ApplicationRecord
  belongs_to :product
  has_many :operators_items
  has_many :operators, through: :operators_items

  validates :product, presence: true


  # def dernière action
    # Doit indiquer : opérateur -> action -> done ?  
  # end

  def last_action
    if operators_items.last == nil
      "Rien en cours pour le moment"
    else
      "#{operators_items.last.operator.name} - #{operators_items.last.action} - #{operators_items.last.done? ? "Fait" : "En cours"}"
    end
  end


  # def suivi 
    # Doit indiquer : liste des opérateurs - action - si dernière action = done
  # end

  def tracking
    if operators_items.last == nil
      "Non pris en charge pour le moment"
    else
      operators_items.each do |track|
        puts "#{track.operator.name} - #{track.action}"
      end
      "#{operators_items.last.done? ? "Fait" : "En cours"}"
    end
  end
end