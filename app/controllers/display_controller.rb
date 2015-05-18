class DisplayController < ApplicationController
  def weather
      c = Scraper.new
	  c.get_station
  end
end
