# Seed data for Panaderia

# Categorías
categories = {
  pan: Category.find_or_create_by!(name: "Pan") { |c| c.description = "Panes artesanales" },
  pasteleria: Category.find_or_create_by!(name: "Pastelería") { |c| c.description = "Pasteles y tortas" },
  bolleria: Category.find_or_create_by!(name: "Bollería") { |c| c.description = "Croissants, media lunas y más" },
  dulces: Category.find_or_create_by!(name: "Dulces") { |c| c.description = "Galletas, alfajores y dulces varios" },
  salados: Category.find_or_create_by!(name: "Salados") { |c| c.description = "Empanadas, pizzetas y más" }
}

# Ingredientes
ingredients = {
  harina: Ingredient.find_or_create_by!(name: "Harina de trigo") { |i| i.unit = "kg"; i.cost = 2.50; i.stock = 50 },
  levadura: Ingredient.find_or_create_by!(name: "Levadura") { |i| i.unit = "g"; i.cost = 0.10; i.stock = 500 },
  sal: Ingredient.find_or_create_by!(name: "Sal") { |i| i.unit = "kg"; i.cost = 1.00; i.stock = 10 },
  azucar: Ingredient.find_or_create_by!(name: "Azúcar") { |i| i.unit = "kg"; i.cost = 3.00; i.stock = 20 },
  mantequilla: Ingredient.find_or_create_by!(name: "Mantequilla") { |i| i.unit = "kg"; i.cost = 12.00; i.stock = 15 },
  huevos: Ingredient.find_or_create_by!(name: "Huevos") { |i| i.unit = "unidad"; i.cost = 0.50; i.stock = 100 },
  leche: Ingredient.find_or_create_by!(name: "Leche") { |i| i.unit = "litro"; i.cost = 1.50; i.stock = 20 },
  chocolate: Ingredient.find_or_create_by!(name: "Chocolate") { |i| i.unit = "kg"; i.cost = 15.00; i.stock = 5 },
  queso: Ingredient.find_or_create_by!(name: "Queso") { |i| i.unit = "kg"; i.cost = 10.00; i.stock = 8 },
  jamon: Ingredient.find_or_create_by!(name: "Jamón") { |i| i.unit = "kg"; i.cost = 18.00; i.stock = 5 }
}

# Productos
products = {
  pan_lactal: Product.find_or_create_by!(name: "Pan Lactal") do |p|
    p.description = "Pan blanco suave, ideal para sándwiches"
    p.price = 4.50
    p.category = categories[:pan]
    p.available = true
  end,
  pan_integral: Product.find_or_create_by!(name: "Pan Integral") do |p|
    p.description = "Pan integral con semillas"
    p.price = 5.50
    p.category = categories[:pan]
    p.price = 5.50
    p.available = true
  end,
  croissant: Product.find_or_create_by!(name: "Croissant") do |p|
    p.description = "Croissant de mantequilla"
    p.price = 3.00
    p.category = categories[:bolleria]
    p.available = true
  end,
  medialuna: Product.find_or_create_by!(name: "Media Luna") do |p|
    p.description = "Media luna dulce"
    p.price = 2.50
    p.category = categories[:bolleria]
    p.available = true
  end,
  torta_chocolate: Product.find_or_create_by!(name: "Torta de Chocolate") do |p|
    p.description = "Torta de chocolate con cobertura"
    p.price = 45.00
    p.category = categories[:pasteleria]
    p.available = true
  end,
  galletas: Product.find_or_create_by!(name: "Galletas de Avena") do |p|
    p.description = "Galletas caseras de avena"
    p.price = 8.00
    p.category = categories[:dulces]
    p.available = true
  end,
  empanadas: Product.find_or_create_by!(name: "Empanada de Carne") do |p|
    p.description = "Empanada rellena de carne cortada a cuchillo"
    p.price = 5.00
    p.category = categories[:salados]
    p.available = true
  end,
  pizzeta: Product.find_or_create_by!(name: "Pizzeta") do |p|
    p.description = "Pizzeta individual con muzzarella"
    p.price = 6.00
    p.category = categories[:salados]
    p.available = true
  end,
  facturas: Product.find_or_create_by!(name: "Facturas") do |p|
    p.description = "Facturas con crema pastelera"
    p.price = 4.00
    p.category = categories[:bolleria]
    p.available = true
  end,
  alfajores: Product.find_or_create_by!(name: "Alfajores de Maicena") do |p|
    p.description = "Alfajores rellenos de dulce de leche"
    p.price = 15.00
    p.category = categories[:dulces]
    p.available = true
  end
}

# Recetas (ProductIngredients)
recipes = {
  pan_lactal: [
    { ingredient: ingredients[:harina], quantity: 0.5 },
    { ingredient: ingredients[:levadura], quantity: 10 },
    { ingredient: ingredients[:sal], quantity: 0.01 },
    { ingredient: ingredients[:azucar], quantity: 0.02 },
    { ingredient: ingredients[:mantequilla], quantity: 0.03 },
    { ingredient: ingredients[:huevos], quantity: 2 },
    { ingredient: ingredients[:leche], quantity: 0.15 }
  ],
  pan_integral: [
    { ingredient: ingredients[:harina], quantity: 0.5 },
    { ingredient: ingredients[:levadura], quantity: 10 },
    { ingredient: ingredients[:sal], quantity: 0.01 },
    { ingredient: ingredients[:mantequilla], quantity: 0.02 }
  ],
  croissant: [
    { ingredient: ingredients[:harina], quantity: 0.25 },
    { ingredient: ingredients[:mantequilla], quantity: 0.15 },
    { ingredient: ingredients[:huevos], quantity: 1 },
    { ingredient: ingredients[:levadura], quantity: 5 },
    { ingredient: ingredients[:azucar], quantity: 0.02 },
    { ingredient: ingredients[:leche], quantity: 0.05 }
  ],
  medialuna: [
    { ingredient: ingredients[:harina], quantity: 0.15 },
    { ingredient: ingredients[:mantequilla], quantity: 0.08 },
    { ingredient: ingredients[:huevos], quantity: 1 },
    { ingredient: ingredients[:azucar], quantity: 0.03 }
  ],
  torta_chocolate: [
    { ingredient: ingredients[:harina], quantity: 0.3 },
    { ingredient: ingredients[:chocolate], quantity: 0.2 },
    { ingredient: ingredients[:huevos], quantity: 4 },
    { ingredient: ingredients[:azucar], quantity: 0.2 },
    { ingredient: ingredients[:mantequilla], quantity: 0.1 },
    { ingredient: ingredients[:leche], quantity: 0.1 }
  ],
  galletas: [
    { ingredient: ingredients[:harina], quantity: 0.2 },
    { ingredient: ingredients[:mantequilla], quantity: 0.1 },
    { ingredient: ingredients[:azucar], quantity: 0.1 },
    { ingredient: ingredients[:huevos], quantity: 1 }
  ],
  empanadas: [
    { ingredient: ingredients[:harina], quantity: 0.15 },
    { ingredient: ingredients[:huevos], quantity: 1 },
    { ingredient: ingredients[:jamon], quantity: 0.05 }
  ],
  pizzeta: [
    { ingredient: ingredients[:harina], quantity: 0.15 },
    { ingredient: ingredients[:queso], quantity: 0.08 },
    { ingredient: ingredients[:huevos], quantity: 1 }
  ],
  facturas: [
    { ingredient: ingredients[:harina], quantity: 0.2 },
    { ingredient: ingredients[:mantequilla], quantity: 0.1 },
    { ingredient: ingredients[:azucar], quantity: 0.05 },
    { ingredient: ingredients[:huevos], quantity: 1 },
    { ingredient: ingredients[:leche], quantity: 0.05 }
  ],
  alfajores: [
    { ingredient: ingredients[:harina], quantity: 0.15 },
    { ingredient: ingredients[:mantequilla], quantity: 0.08 },
    { ingredient: ingredients[:azucar], quantity: 0.05 },
    { ingredient: ingredients[:huevos], quantity: 1 }
  ]
}

recipes.each do |product_key, recipe|
  product = products[product_key]
  recipe.each do |item|
    ProductIngredient.find_or_create_by!(
      product: product,
      ingredient: item[:ingredient]
    ) do |pi|
      pi.quantity = item[:quantity]
    end
  end
end

# Clientes
customers = {
  maria: Customer.find_or_create_by!(email: "maria@email.com") do |c|
    c.name = "María García"
    c.phone = "1234567890"
    c.address = "Calle Principal 123"
  end,
  juan: Customer.find_or_create_by!(email: "juan@email.com") do |c|
    c.name = "Juan López"
    c.phone = "0987654321"
    c.address = "Avenida Libertad 456"
  end,
  ana: Customer.find_or_create_by!(email: "ana@email.com") do |c|
    c.name = "Ana Martínez"
    c.phone = "5551234567"
    c.address = "Calle San Martín 789"
  end
}

# Pedidos de ejemplo
orders = [
  { customer: customers[:maria], status: "completed", items: [ { product: products[:pan_lactal], quantity: 2 }, { product: products[:croissant], quantity: 4 } ] },
  { customer: customers[:juan], status: "pending", items: [ { product: products[:torta_chocolate], quantity: 1 }, { product: products[:alfajores], quantity: 2 } ] },
  { customer: customers[:ana], status: "preparing", items: [ { product: products[:empanadas], quantity: 6 }, { product: products[:pizzeta], quantity: 3 } ] }
]

orders.each do |order_data|
  order = Order.find_or_create_by!(customer: order_data[:customer], status: order_data[:status]) do |o|
    o.total = 0
  end

  order_data[:items].each do |item|
    OrderItem.find_or_create_by!(order: order, product: item[:product]) do |oi|
      oi.quantity = item[:quantity]
      oi.price = item[:product].price
    end
  end

  order.update!(total: order.order_items.sum { |oi| oi.quantity * oi.price })
end

puts "Seed completado:"
puts "  - #{Category.count} categorías"
puts "  - #{Ingredient.count} ingredientes"
puts "  - #{Product.count} productos"
puts "  - #{ProductIngredient.count} relaciones producto-ingrediente"
puts "  - #{Customer.count} clientes"
puts "  - #{Order.count} pedidos"
