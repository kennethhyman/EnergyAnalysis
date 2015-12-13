module CountriesHelper
	def is_listed?(data, units = "GWh/year")
		if (data == 0.0 || data == nil)
			"This data was not listed"
		else
			return data.to_s + " " + units
		end
	end
end
