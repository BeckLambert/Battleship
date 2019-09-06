require_relative '../ships'
 
	 describe 'Ships' do
	 	let(:carrier) {Ships.new(name: "Carrier",  size:  5, quanity: 1, sunken: false)}
	 	describe '#initialize' do
 			
 		it 'it can be initialize with a name' do
 			expect(carrier.name).to eq "Carrier"
 		end
 
 		it 'it can be initialize with a size' do
 			expect(carrier.size).to eq 5
 		end
 
 		it 'it can be initialize with a quanity value' do
 			expect(carrier.quanity).to eq 1
 		end
 
 		it 'it can be initialize with a sunken value' do
 			expect(carrier.sunken).to eq false
 		end
 
 		it 'it can be initialize with a position' do
 			expect(carrier.position).to eq []
 		end
 
 		it 'the ships quanity can be updated' do
 			carrier.quanity = 0 
  			expect(carrier.quanity).to eq 0
 		end
 
 		it 'the ships sunken value can be updated' do
 			carrier.sunken = true
 			expect(carrier.sunken).to eq true
 		end
 
 		it 'the ships position can be updated' do
 			carrier.position = ["A1"] 
 			expect(carrier.position).to eq ["A1"] 
 		end
 	end
 end 