class Vending_machine

	attr_accessor :coins

	def initialize
		@tango 	= Product.new "Tango",	150.0, 20
		@kitkat = Product.new "KitKat",	200.0, 10
		@pepsi 	= Product.new "Pepsi", 	100.0, 30
		@coins 	= Coins.new 5, 5, 5, 5, 5, 5, 2, 2
	end

	def products
		[@tango, @kitkat, @pepsi]
	end

	def available_coins
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

		return "There are no more #{selected(product).name}" if remaining(product) == 0
		
		if new_price == price(product)
			selected(product).one_less
			@coins.receive(amount)
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