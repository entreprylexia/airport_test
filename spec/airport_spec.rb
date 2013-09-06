require_relative '../lib/weather'

require 'airport'

describe Airport do 

	let(:weather) { double :Weather }
	let(:airport) { Airport.new(10, weather) }
	let(:airplane) { double :Airplane }



	it 'has no airplanes' do
      expect(airport).not_to have_airplanes
    end 

  

    it 'should have weather' do
    	expect(airport.weather).to eq weather
    end


	it 'has maximum capacity of 10' do
	   expect(airport.capacity).to eq 10

 	end

 	it 'should have a empty list of airplanes' do
    	expect(airport.list_of_airplanes).to be_empty
  	end


    it 'if there is space in the airport and sunny weather airplane can land' do
      	expect(weather).to receive(:state).and_return :sunny
     	expect(airport).to be_clear_to_land
    end


    it 'place plane on the list' do
       expect(airport).to receive(:clear_to_land?).and_return true
       airport.land(airplane)
	   expect(airport.list_of_airplanes).to include airplane
    end


     it 'if the weather is stormy, the plane cannot land' do
      expect(weather).to receive(:state).and_return :stormy
      expect(airport).not_to be_clear_to_land
    end


    it 'if there is no space in the airport, plane cannot land' do
       airport = Airport.new(0, weather)
	   expect(airport).not_to be_clear_to_land
    end



     it 'airplane can land if the weather is sunny' do
       expect(weather).to receive(:state).and_return :sunny
       expect(airport).to be_clear_to_take_off
    end


     it 'after plane takes off its removed from the list' do
      expect(airport).to receive(:clear_to_land?).and_return true
      airport.land(airplane)
      expect(airport).to receive(:clear_to_take_off?).and_return true
      airport.take_off(airplane)

      expect(airport.list_of_airplanes).not_to include airplane
    end


context 'BOMB Treats are introduced' do


	it 'can have bomb threats' do
		airport.bomb_threats(true)
		expect(airport.threats).to be_true
	end


	it 'can have a bomb threat and sunny weather but planes cannot take off' do
		airport.land(airplane)
		expect(weather).to receive(:state).and_return :sunny
		airport.bomb_threats(true)
		expect(airport.clear_to_take_off?).to be_false
	end


	it 'can have a bomb threat called off' do
		airport.bomb_threats(true)
		airport.bomb_threats(false)
		expect(airport.threats).to be_false
	end







end 


end