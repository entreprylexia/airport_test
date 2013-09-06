class Airport

	attr_reader :capacity, :weather, :list_of_airplanes, :threats

	def initialize (capacity, weather) 
		airplanes= []
		@capacity, @weather = capacity, weather
		@airplanes = airplanes
		@list_of_airplanes = []
		@threats = false
		
	end 

	def has_sunny_weather?
    @weather.state == :sunny
    end
    
	
	def has_airplanes?
		!@airplanes.empty?
	end 


	def has_space_in_list?
    list_of_airplanes.count < capacity
    end


	def clear_to_land?
    has_space_in_list? and has_sunny_weather?
    end

    def land(airplane)
    @list_of_airplanes << airplane if clear_to_land?
    end



    def new_airplane 
    	@list_of_airplanes << Airplane.new if @list_of_airplanes.count < @capacity
    end 

    
    def clear_to_take_off?
    has_sunny_weather?
    end


    def take_off(airplane)
    @list_of_airplanes.delete(airplane) if clear_to_take_off?
    end


    def bomb_threats(threats)
		@threats = threats
	end

   



end 