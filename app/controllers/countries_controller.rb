class CountriesController < ApplicationController
  def index
  	@countries = Country.paginate(page: params[:page])
  end
  def show
    @countries = Country.all
  	@country = Country.find(params[:id])
  end
  def total_x_gdp_graph
    @xInput = []
    @yInput = []
  	graph = Gruff::Scatter.new(400)
 	  graph.title = "Total Renewable vs GDP per capita" 
  	graph.theme_greyscale
    graph.x_axis_label = "GDP per capita($)"
    graph.y_axis_label = "Total Renewable (GWh/year)"
  

 	  # gather data from database
    @countries = Country.all
    @country = Country.find(params[:country])
    @countries.each do |country|
      unless (country.gdp_per_capita.nil? || country.total_renewable.nil?)
        @xInput << country.gdp_per_capita
        @yInput << country.total_renewable
      end
    end
    @inputs = set_country_data(@xInput, @yInput, 1, 1000)
    
 	  graph.data("50 randomly selected countries", @inputs[0], @inputs[1])
    unless (@country.gdp_per_capita.nil? || @country.total_renewable.nil?)
      if (@country.total_renewable * 1000 > 100000)
        graph.data(@country.name, [@country.gdp_per_capita], [100000], '#0000EE')
      else
        graph.data(@country.name, [@country.gdp_per_capita], [@country.total_renewable * 1000], '#0000EE')
 	    end
    end
    graph.minimum_value = 0
    graph.minimum_x_value = 0
    graph.maximum_value = 100000
    graph.maximum_x_value = 100000

    send_data(graph.to_blob, 
 	  :disposition => 'inline', 
 	  :type => 'image/png', 
 	  :filename => "gdpxtotalrenewable.png")
  end
  def total_x_imr_graph
    @xInput = []
    @yInput = []
    graph = Gruff::Scatter.new(400)
    graph.title = "Total Renewable vs Infant Mortality Rate" 
    graph.theme_greyscale
    graph.x_axis_label = "Infant Mortality Rate (per 1000)"
    graph.y_axis_label = "Total Renewable (GWh/year)"
  

    # gather data from database
    @countries = Country.all
    @country = Country.find(params[:country])
    @countries.each do |country|
      unless (country.imr.nil? || country.total_renewable.nil?)
        @xInput << country.imr
        @yInput << country.total_renewable
      end
    end
    @inputs = set_country_data(@xInput, @yInput, 1, 1000)
    
    graph.data("50 randomly selected countries", @inputs[0], @inputs[1])
    unless (@country.imr.nil? || @country.total_renewable.nil?)
      if (@country.total_renewable * 1000 > 100000)
        graph.data(@country.name, [@country.imr], [100000], '#0000EE')
      else
        graph.data(@country.name, [@country.imr], [@country.total_renewable * 1000], '#0000EE')
      end
    end
    graph.minimum_value = 0
    graph.minimum_x_value = 0
    graph.maximum_value = 100000
    graph.maximum_x_value = 100

    send_data(graph.to_blob, 
    :disposition => 'inline', 
    :type => 'image/png', 
    :filename => "imrxtotalrenewable.png")
  end
  def percent_x_gdp_graph
    @xInput = []
    @yInput = []
    graph = Gruff::Scatter.new(400)
    graph.title = "Total Renewable vs GDP per capita" 
    graph.theme_greyscale
    graph.x_axis_label = "GDP per capita($)"
    graph.y_axis_label = "Total Renewable (GWh/year)"
  

    # gather data from database
    @countries = Country.all
    @country = Country.find(params[:country])
    @countries.each do |country|
      unless (country.gdp_per_capita.nil? || country.percent_total.nil?)
        @xInput << country.gdp_per_capita
        @yInput << country.percent_total
      end
    end
    @inputs = set_country_data(@xInput, @yInput, 1, 1)
    
    graph.data("50 randomly selected countries", @inputs[0], @inputs[1])
    unless (@country.gdp_per_capita.nil? || @country.percent_total.nil?)
      graph.data(@country.name, [@country.gdp_per_capita], [@country.percent_total], '#0000EE')
    end

    graph.maximum_value = 100
    graph.minimum_value = 0
    graph.maximum_x_value = 100000
    graph.minimum_x_value = 0
    send_data(graph.to_blob, 
    :disposition => 'inline', 
    :type => 'image/png', 
    :filename => "gdpxpercentrenewable.png")

  end
  def percent_x_imr_graph
    @xInput = []
    @yInput = []
    graph = Gruff::Scatter.new(400)
    graph.title = "Total Renewable vs GDP per capita" 
    graph.theme_greyscale
    graph.x_axis_label = "Infant Mortality Rate (per 1000)"
    graph.y_axis_label = "Total Renewable (GWh/year)"
  

    # gather data from database
    @countries = Country.all
    @country = Country.find(params[:country])
    @countries.each do |country|
      unless (country.imr.nil? || country.percent_total.nil?)
        @xInput << country.imr
        @yInput << country.percent_total
      end
    end
    @inputs = set_country_data(@xInput, @yInput, 1, 1)
    
    graph.data("50 randomly selected countries", @inputs[0], @inputs[1])
    unless (@country.imr.nil? || @country.percent_total.nil?)
      graph.data(@country.name, [@country.imr], [@country.percent_total], '#0000EE')
    end

    graph.maximum_value = 100
    graph.minimum_value = 0
    graph.maximum_x_value = 100
    graph.minimum_x_value = 0
    send_data(graph.to_blob, 
    :disposition => 'inline', 
    :type => 'image/png', 
    :filename => "imrxpercentrenewable.png")

  end

  private
  def set_country_data(xData, yData, xScalar = 1, yScalar = 1)
    newX = []
    newY = []
    xData.length.times do |i|
      if (Random.rand(1) && newX.length <= 50)
        newX << (xData[i] * xScalar)
        newY << (yData[i] * yScalar)
      end
    end
    [newX, newY]
  end
end
