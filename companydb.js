// created collections
db.createCollection("users")
db.createCollection("admin")
db.createCollection("categories")
db.createCollection("products")
db.createCollection("orders")
db.createCollection("order_details")


// insert into users
db.users.insertMany([
    { _id: 1, name: "bruce wayne", password: "!123", address: "wayne mansion", postal_code: 000111, city: "gotham", phone: "+1 (234) 567-8910" },
    { _id: 2, name: "shrek", password: "!arrh", address: "swamp", postal_code: 101010, city: "far far away", phone: "+1 (098) 765-4321" }
])

// insert into admin
db.admin.insertOne({ _id: 1, name: "batman", role: "is_admin", user_id: { _id: 1 } })

// insert into categories
db.categories.insertMany([
    { _id: 1, name: "Tops" },
    { _id: 2, name: "Dresses" },
    { _id: 3, name: "Beach wear" }
])

// insert into products
db.products.insertMany([
    { _id: 1, name: "Hollow Out Tie Back Cover Up", price: 15.00, size: "medium", category_id: { _id: 3 } },
    { _id: 2, name: "EMERY ROSE Floral Print Notched Neck Tee", price: 16.00, size: "small", category_id: { _id: 1 } },
    { _id: 3, name: "Maternity Solid Bodycon Dress", price: 8.00, size: "large", category_id: { _id: 2 } }
])

// insert into order_details
db.order_details.insertOne({ _id: 1, order_id: { _id: 1 }, product_id: { _id: 3 }, product_price: 8.00, quantity: 2 })

// insert into orders
db.orders.insertOne({ _id: 1, order_no: "1111FFA", order_total: 16.00, order_date: "1000-01-01 00:00:00", shipping_date: "9999-12-31 23:59:59", is_delivered: false, user_id: { _id: 2 } })

// update data
db.categories.updateOne({ _id: 1 }, { $set: { "name": "sports & outdoors" } })

// delete data
db.products.deleteOne({ _id: 1 })

// query data
db.categories.findOne({ _id: 1 })

// get all products based on category id 
db.products.aggregate([{ $lookup: { from: "categories", localField: "category_id", foreignField: "_id", as: "categories" } }])