require 'product'

describe Product do 
	let(:product) {Product.new "Tango", 150.0, 20}
	
	it 'has a name when initialized' do 
		expect(product.name).to eq 'Tango'
	end

	it 'has a price when initialized' do 
		expect(product.price).to eq 150.0
	end

	it 'has a quantity' do 
		expect(product.quantity).to eq 20
	end

	it 'quantity minus one' do
		product.one_less
		expect(product.quantity).to eq 19
	end

end