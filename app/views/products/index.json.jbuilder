json.array! @products do |product|
  json.id product.id
  json.title product.title
  json.date product.date
  json.image_url product.image_url
  json.link product.link
end
