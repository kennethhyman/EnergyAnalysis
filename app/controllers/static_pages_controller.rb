class StaticPagesController < ApplicationController
  def home
  end

  def future_study
  end

  def bibliography
  end
  def conclusion
  end
  def analysis
  	@countries = Country.all
  end
end
