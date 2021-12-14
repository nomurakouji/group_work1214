class Drink

  def initialize  
    @drink = { "コーラ": { "price": 120, "stock": 5 },
            "水": { "price": 100, "stock": 5},
            "レッドブル": { "price": 200, "stock": 5 }}
  end

  def get_drink_stock(select_drink)
    @drink[select_drink][:stock]
  end

  def set_drink_stock=(select_drink)
    @drink[select_drink][:stock] -= 1
  end 

  def get_drink_price(select_drink)
    @drink[select_drink][:price]
  end

  def display_drink_list
    @drink.keys.each do |n|
      stock = get_drink_stock(n)
      n = n.to_s
      puts "#{n}：#{stock}本"
    end
  end
  
  def get_stock_drink_list
    @drink.keys.select{|n|
      drink = n.to_sym
      @drink[drink][:stock] > 0
    }
  end

  # ↓のメソッドをdrinkクラスへ
  #購入したドリンクの種類と量を定義
  def set_purchased_drinks
    #@purchased_drinkを定義
    #初めて購入する時のみ、空のハッシュを作成する
    @purchased_drink = {} if @purchased_drink.nil?
    #購入したドリンクの種類が選んだドリンクの種類を含んでいる場合
    if @purchased_drink.keys.include?(@select_drink)
    #購入したドリンクの購入量を１増やす
      @purchased_drink[@select_drink][:stock] += 1
    else 
    #購入したドリンクの種類が選んだドリンクの種類を含んでいない場合
    #購入したドリンクのハッシュを作成
      @purchased_drink[@select_drink] = {}
    #購入したドリンクにキー、バリューを追加
      @purchased_drink[@select_drink].store(:stock, 1)
    end
  end
end
