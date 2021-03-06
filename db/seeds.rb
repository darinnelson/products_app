Product.create(name: "Basketball goal", price: 1200, image_url: "https://www.produnkhoops.com/images/design/products/pds_profile_s1.jpg", description: "Pro Dunk Silver Basketball System")
Product.create(name: "Baseball glove", price: 20, image_url: "https://baseballmonkey.nexcesscdn.net/media/catalog/product/cache/5/thumbnail/600x/9df78eab33525d08d6e5fb8d27136e95/m/i/mizuno-312380-pro-limited-edition-gmp500j-adult-baseball-glove.jpg", description: "Mizuno GMP500J Pro LE 11.75")
Product.create(name: "Soccer Ball", price: 20, image_url: "https://cdn3.volusion.com/goz35.avhz4/v/vspfiles/photos/EB-NISC2320-440-2.jpg?1456231556", description: "Nike CR7 Prestige")
Product.create(name: "Running shoes", price: 90, image_url: "https://m.media-amazon.com/images/I/91uOh4kv-HL._SX480_.jpg", description: "Hoka One One")

Supplier.create(name: "Sports Authority", email: "sportauthority@email.com", phone_number: "1-111-111-1111")
Supplier.create(name: "Dick's Sporting Goods", email: "dickssportinggoods@email.com", phone_number: "1-111-111-1111")

Image.create(image_url: "https://dks.scene7.com/is/image/dkscdn/16GLRUGLRLL72CXXXBKE", product_id: 1)
Image.create(image_url: "https://www.competitiveedgeproducts.com/assets/images/1602.jpg", product_id: 1)
Image.create(image_url: "https://i1.adis.ws/i/mizunousa/312438_R52C?w=500&h=500&fmt=jpg&bg=rgb(255,255,255)&img404=404&v=1", product_id: 2)
Image.create(image_url: "https://cdn3.volusion.com/goz35.avhz4/v/vspfiles/photos/EB-NISC2320-440-2.jpg?1456231556", product_id: 3)
Image.create(image_url: "https://media.kohlsimg.com/is/image/kohls/2853318_Carbon_Orange?wid=500&hei=500&op_sharpen=1", product_id: 4)

Category.create(name: "Wearable")
Category.create(name: "Ball")
Category.create(name: "Gloves")
Category.create(name: "Baseball stuff")

CategoryProduct.create(category_id: 1, product_id: 1)
CategoryProduct.create(category_id: 1, product_id: 2)
CategoryProduct.create(category_id: 3, product_id: 2)
CategoryProduct.create(category_id: 4, product_id: 2)
CategoryProduct.create(category_id: 2, product_id: 3)
CategoryProduct.create(category_id: 1, product_id: 4)
