require 'vending_machine'
require 'product'

describe Vending_machine do 
	
	let (:vending_machine) 	{Vending_machine.new}
	let(:tango)				{Product.new "Tango", 150.0, 20}
	let(:kitkat)			{Product.new "KitKat", 200.0, 10}
	let(:pepsi)				{Product.new "Pepsi", 100.0, 30}

	context 'when created' do 

		it 'contains products' do 
			expect(vending_machine.products_names).to eq ["Tango", "KitKat", "Pepsi"]
		end

		it 'products have a price' do 
			expect(vending_machine.price("Tango")).to eq 150
		end

	# it 'contains change when created' do 
	# 	expect(vending_machine.change.keys).to eq ["1p","2p","5p","10p", "20p", "50p","£1", "£2"]
	# end

	# it 'contains products' do
	# 	expect(vending_machine.products_names).to eq ["Tango", "Kit-Kat", "Pepsi"]
	# end

		

	# it 'contains 10 coins of denomination 1p' do 
	# 	expect(vending_machine.change["1p"]).to eq 10
	# end

	# it 'contains 10 coins of denomination 5p' do
	# 	expect(vending_machine.change["5p"]).to eq 10
	# end

	# it 'contains 10 coins of denomination 10p' do 
	# 	expect(vending_machine.change["10p"]). to eq 10
	# end

	# it 'contains 8 coins of denomination 20p' do 
	# 	expect(vending_machine.change["20p"]).to eq 8
	# end

	# it 'contains 8 coins of denomination 50p' do 
	# 	expect(vending_machine.change["50p"]).to eq 8
	# end

	# it 'contains 5 coins of denomination £1' do 
	# 	expect(vending_machine.change["£1"]).to eq 5
	# end

	# it 'contains 5 coins of denomination £2' do
	# 	expect(vending_machine.change["£2"]).to eq 5
	# end

	# it 'can convert price to denomination p' do
	# 	expect(vending_machine.convert(20)).to eq "20p"
	# end

	# it 'can convert price to denomination £' do 
	# 	expect(vending_machine.convert(100)).to eq "£1"
	# end

	# it 'can convert denomination p to price' do 
	# 	expect(vending_machine.convert("20p")).to eq 20
	# end

	# it 'can convert denomination £ to price' do 
	# 	expect(vending_machine.convert("£1")).to eq 100
	# end

	# it 'contains 20 cans of Tango' do 
	# 	expect(vending_machine.quantity("Tango")).to eq 20
	# end

	# it 'contains 10 packs of Kit-Kat' do 
	# 	expect(vending_machine.quantity("Kit-Kat")).to eq 10
	# end

	# it 'contains 30 cans of Pepsi' do 
	# 	expect(vending_machine.quantity("Pepsi")).to eq 30
	# end

	end

	context 'Converting change' do 

		it 'can convert price to denomination p' do 
			expect(vending_machine.convert(20)).to eq "20p"
		end

		it 'can convert price to denomination £' do 
			expect(vending_machine.convert(100)).to eq "£1"
		end

		it 'can convert denomination p to price' do 
			expect(vending_machine.convert("20p")).to eq 20
		end

		it 'can convert denomination £ to price' do 
			expect(vending_machine.convert("£1")).to eq 100
		end
	end

	context 'Selecting products' do 

		it 'returns a product when selected and no change if the money provided is correct' do 
			expect(vending_machine.buy("Tango","£1.5")).to eq "Your product:\n Tango"
		end

		it 'returns change if too much money is provided' do 
			expect(vending_machine.buy("Tango", "£2")).to eq "Your product:\n Tango\nChange: 50p"
		end
	end

	context 'Keeping track of products and change' do 

		it 'knows when a product is selected and is removed from the vending machine' do 
			vending_machine.buy("Tango", "£1.5")
			expect(vending_machine.remaining("Tango")).to eq 19
		end

		it 'knows when a product is selected but is not removed from the vending machine if the money is not enough' do
			vending_machine.buy("KitKat", "£1.5")
			expect(vending_machine.remaining("KitKat")).to eq 10
		end

		it 'knows when there are no more items of a product' do 
			10.times {vending_machine.buy("KitKat","£2")}
			expect(vending_machine.buy("KitKat","£2")).to eq "There are no more KitKat"
		end
	end

end

		# it 'requests for more money if it is not enough' do 
		# 	expect(vending_machine.select("Kit-Kat", "£1")).to eq "Please insert another £1"
		# end