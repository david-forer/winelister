#create some seed data

#create 3 users

david = User.create(name: "David", email: "david@microsoft.com", password: "password")
kalpana = User.create(name: "Kalpana", email: "kalpana@microsoft-type.com", password: "password")
eric = User.create(name: "Eric", email: "eric@landerss.com", password: "password")

#Create Some Wine Reviews

Winereview.create(wine_name: "Robert Mondavi Merlot", wine_notes: "tastes very oaky", user_id: "david.id")
Winereview.create(wine_name: "Little Penguin Sauv Blac", wine_notes: "Hints of cherry", user_id: "david.id")
Winereview.create(wine_name: "Four Wineries Chardonnay", wine_notes: "very refreshing grapefruit", user_id: "kalpana.id")
Winereview.create(wine_name: "Oak leaf Cabernet", wine_notes: "Tastes like a rose", user_id: "eric.id")

#Create some wine lists

Winelist.create(wine_name: "Best Merlots",  description: "Merlots i like",    user_id: "david.id")
Winelist.create(wine_name: "Best Australian wines",  description: "Pinot Noir's from AU",    user_id: "kalpana.id")
Winelist.create(wine_name: "Puerto Rican wines",  description: "Wines for hot times",    user_id: "eric.id")