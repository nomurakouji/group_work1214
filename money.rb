class Money

  MONEY = [10, 50, 100, 500, 1000].freeze
  UNUSED_MONEY = [1, 5, 2000, 5000, 10000].freeze

  def initialize
    @slot_money = 0
  end

  def get_current_slot_money
    @slot_money
  end

  def return_money
    puts "#{@slot_money}円払い戻しました！"
    @slot_money = 0
  end

  def slot_money(money)
    unless MONEY.include?(money)
      puts "扱えないお金です。"
      puts "投入された#{money}円を返却します。" if UNUSED_MONEY.include?(money)
      get_current_slot_money 
    else
      @slot_money += money
    end
  end
end

class  Purchasing < Money

  def initialize
    super
    @sales_amount = 0
  end

  def add_sales_amount(price)
    @slot_money -= price
    @sales_amount += price
  end

  # ↓のメソッドをpurchasingクラスへ
  #
  def calc_accounting_processing
    #選んだドリンクの値段を定義
    @drink_price = @drink.get_drink_price(@main.decide_drink)
    #投入金額から選んだドリンクの値段をひく、売上高に選んだドリンクの値段を加える
    @sales_amount = @purchasing.add_sales_amount(drink_price)
    #投入金額をtotal_money=slot_moneyにする（扱いやすくする？）
    #total_moneyの役割 初期値0を設定
    #slot_moneyの役割 正規のお金か判定、正しければ加算
    @total_money = @purchasing.get_current_slot_money

    #在庫調整（在庫数ー購入したドリンク１本）
    ### drinkクラスの方がわかりやすいかも ###
    @drink.set_drink_stock=(@select_drink)
    #下記参照
    @calc_drink_accounting_processing = @drink.set_purchased_drinks
    #購入完了
    puts "#{@select_drink.to_s}が出力されました！"
  end
end