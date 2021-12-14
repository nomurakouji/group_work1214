@drink = { "コーラ": { "price": 120, "stock": 5 },
            "水": { "price": 100, "stock": 5},
            "レッドブル": { "price": 200, "stock": 5 }}


get_stock_drink_list =
    @drink.keys.select{|n|
      drink = n.to_sym
      @drink[drink][:stock] > 0
    }

puts get_stock_drink_list