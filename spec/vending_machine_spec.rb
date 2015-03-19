require 'vending_machine'

describe Vending_machine do 
	let (:vending_machine) {Vending_machine.new}

	it 'contains change when created' do 
		expect(vending_machine.change.keys).to eq ["1p","2p","5p","10p", "20p", "50p","£1", "£2"]
	end


	it 'contains products' do
		expect(vending_machine.products.keys).to eq ["Tango", "Kit-Kat", "Pepsi"]
	end

	it 'products have a price' do 
		expect(vending_machine.price("Tango")).to eq 1
	end

	it 'returns a product when selected by the customer' do 
		expect(vending_machine.select("Tango")).to eq "Tango"
	end
end