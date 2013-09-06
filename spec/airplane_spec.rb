require_relative '../lib/weather'
require_relative '../lib/airplane'

describe Airplane do 
	let(:airplane) { Airplane.new }

	it 'can take off if the weather is sunny' do
		weather = Weather.new
		expect(weather.conditions.first).to eq 'sunny'
		expect(airplane.airplane_take_off).to be_true
	
	end
	


end 