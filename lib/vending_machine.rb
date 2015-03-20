class Vending_machine

	def initialize
		@tango 	= Product.new "Tango",	150.0, 20
		@kitkat = Product.new "KitKat",	200.0, 10
		@pepsi 	= Product.new "Pepsi", 	100.0, 30
		@coins 	= Coins.new 5, 5, 5, 5, 5, 5, 2, 2
	end

	# def change
	# 	{
	# 		"1p"	=> 10,
	# 		"2p"	=> 10,
	# 		"5p" 	=> 10,
	# 		"10p" 	=> 10,
	# 		"20p" 	=> 8,
	# 		"50p" 	=> 8,
	# 		"£1" 	=> 5,
	# 		"£2" 	=> 5
	# 	}
	# end

	def products
		[@tango, @kitkat, @pepsi]
	end

	def coins
		@vending_machine_coins = []
		@coins.one_p.times {@vending_machine_coins << 1}
		@coins.two_p.times {@vending_machine_coins << 2}
		@coins.five_p.times {@vending_machine_coins << 5}
		@coins.ten_p.times {@vending_machine_coins << 10}
		@coins.twenty_p.times {@vending_machine_coins << 20}
		@coins.fifty_p.times {@vending_machine_coins << 50}
		@coins.one_pound.times {@vending_machine_coins << 100}
		@coins.two_pounds.times {@vending_machine_coins << 200}
		@vending_machine_coins
	end



	def products_names
		products.map{|p| p.name}
	end

	def select(product)
		products.select{|p|p.name == product}
	end

	def selected(product)
		@selected = select(product)[0]
	end

	def quantity(product)
		q = select(product)
		q[0].quantity
	end

	def price(product)
		p = select(product)
		p[0].price
	end

	# def convert(price)
	# 	if price.class == Fixnum || price.class == Float
	# 		return "#{price.to_i}p" if price < 100
	# 		return "£#{price.to_i/100}" if price >= 100
	# 	end

	# 	if price.class == String
	# 		return price.to_f if price.include? "p"
	# 		return(price.delete("£").to_f)*100 if price.include? "£"

	# 	end
	# end

	def convert(cash)
		if cash.class == String
			return cash.to_f if cash.include? "p"
			return (cash.delete("£").to_f)*100 if cash.include? "£"
		end

		if cash.class == Float || cash.class == Fixnum
			return "#{cash.to_i}p" if cash < 100
			return "£#{cash.to_i/100}" if cash >= 100
		end
	end

	def buy(product, amount)
		new_price = convert(amount)

		return "There are no more #{selected(product).name}" if remaining(product)==0
		
		if new_price == price(product)
			selected(product).one_less
			return "Your product:\n #{selected(product).name}"
		end

		if new_price > price(product)
			change = convert(new_price - price(product))
			return "Your product:\n #{selected(product).name}\nChange: #{change}"
		end
	end

	

	def remaining(product)
		selected(product).quantity
	end


end