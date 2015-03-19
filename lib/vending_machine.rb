class Vending_machine

	def change
		{
			"1p"	=> nil,
			"2p"	=> nil,
			"5p" 	=> nil,
			"10p" 	=> nil,
			"20p" 	=> nil,
			"50p" 	=> nil,
			"£1" 	=> nil,
			"£2" 	=> nil
		}

	end

	def products
		{
			"Tango" 	=> 1,
		 	"Kit-Kat" 	=> 2,
		 	"Pepsi"		=> 1
		 }
	end

	def price(product)
		products[product]
	end

	def select(product)
		return product
	end

end
