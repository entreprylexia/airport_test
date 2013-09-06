class Weather 

	def conditions 
  	@conditions = ["sunny", "stormy"]

    end 

    def choose_weather

    return :sunny if Random.rand(0..1) == 0
    :stormy


    end 




end 
