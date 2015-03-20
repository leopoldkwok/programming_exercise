require 'vending_machine'
require 'product'
require 'coins'

describe Vending_machine do 
	
	let(:vending_machine) 	{Vending_machine.new}

	context 'when created' do 

		it 'contains products' do 
			expect(vending_machine.products_names).to eq ["Tango", "KitKat", "Pepsi"]
		end

		it 'products have a price' do 
			expect(vending_machine.price("Tango")).to eq 150
		end

		it 'contains coins when created' do 
			expect(vending_machine.available_coins).to eq [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 5, 5, 5, 5, 5, 10, 10, 10, 10, 10, 20, 20, 20, 20, 20, 50, 50, 50, 50, 50, 100, 100, 200, 200]
		end

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

		it 'totals up the coins in the vending machine' do
			vending_machine.buy("Tango", "£1.5")
			expect(vending_machine.coins.fifty_p).to eq 6
			expect(vending_machine.coins.one_pound).to eq 3
			expect(vending_machine.coins.total).to eq 1190
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