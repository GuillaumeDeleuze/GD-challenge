OperatorsItem.destroy_all
Item.destroy_all
Product.destroy_all
OperatorsPoste.destroy_all
Operator.destroy_all
Poste.destroy_all

Poste.categories.keys.each { |cat| Poste.create!(category: cat) }

Operator.create!([
  { first_name: "Hubert", last_name: "Bonisseur De La Bath" },
  { first_name: "Noël", last_name: "Flantier" },
  { first_name: "Jack", last_name: "Jefferson" },
  { first_name: "Von", last_name: "Zimmel" },
  { first_name: "Larmina", last_name: "Betouche" }
])

Product.create!([
  { name: "Robe rouge" },
  { name: "Robe jaune" },
  { name: "Robe bleue" },
  { name: "Robe verte" }
])

# Travailler le seed pour créer des items => les affilier à un opérateur 

40.times do
  Item.create!(product_id: rand(1..4))
end

item = 0
puts 'create 30 picked items'
30.times do
  item += 1 
  OperatorsItem.create!(
    operator_id: rand(1..5), 
    item_id: item,
    action: 0,
    done: true,
    )
end 

item = 30 
puts 'create 5 non picked items'
5.times do
  item += 1 
  OperatorsItem.create!(
    operator_id: rand(1..5), 
    item_id: item,
    action: 0,
    )
end 

puts 'create 20 checked items'
item = 0
20.times do
  item += 1 
  OperatorsItem.create!(
    operator_id: rand(1..5), 
    item_id: item,
    action: 1,
    done: true,
    )
end 

puts 'create 10 unchecked items'
item = 20
10.times do
  item += 1 
  OperatorsItem.create!(
    operator_id: rand(1..5), 
    item_id: item,
    action: 1,
    done: true,
    )
end 

puts 'create packed items'
item = 0
20.times do
  item += 1 
  OperatorsItem.create!(
    operator_id: rand(1..5), 
    item_id: item,
    action: 2,
    done: [true, false].sample,
    )
end 