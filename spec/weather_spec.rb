require 'weather'


describe Weather do 

	let(:weather) { Weather.new }


	it 'can be sunny' do 
		expect(weather.conditions.first).to eq 'sunny'

	end 

	it 'can be stormy' do 
		expect(weather.conditions.last).to eq 'stormy'

	end 

	it 'should be sunny 50% of the time' do 
		expect(Random).to receive(:rand).with(0..1).and_return(0)

		expect(weather.choose_weather).to eq :sunny

	end 


	it 'should be stormy 50% of the time' do
      expect(Random).to receive(:rand).with(0..1).and_return(1)

      expect(weather.choose_weather).to eq :stormy

  end 



end 