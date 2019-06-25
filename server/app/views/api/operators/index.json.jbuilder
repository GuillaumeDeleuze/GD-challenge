json.array! @operators do |operator|
  json.extract! operator, :id, :name, :points
end
