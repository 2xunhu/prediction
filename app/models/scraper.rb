class Scraper < ActiveRecord::Base
require 'nokogiri'
require 'open-uri'
require 'json'
URL = 'http://www.bom.gov.au/vic/observations/melbourne.shtml'
KEY_URL = 'http://www.bom.gov.au'
BASE_URL = 'https://api.forecast.io/forecast'
API_KEY = 'a658ee7536eb1134bc14b1baec64061c'
def get_station
@location_lat=[]
@location_lon=[]
@locationname=[]
@station_latlon=[]
            #find link that includes "/products/IDV60901/IDV60901."
           doc = Nokogiri::HTML(open(URL))
		   addlinks = doc.css("a").select{|k| k['href'].include? "/products/IDV60901/IDV60901."}
           datalinks=[]
		  
		   latlon=[]
		   addlinks.each do |link|
            datalinks.push KEY_URL + "/" + link['href']
            end

     datalinks.each do |link|
	 #go to the link of location
      doclink = Nokogiri::HTML(open(link))
	  location_lat_lon = doclink.css('table[class="stationdetails"]')
	  lat= location_lat_lon.css('td[4]').text
	  lon = location_lat_lon.css('td[5]').text
	  @location_lat.push(lat.gsub!("Lat:",""))
	  @location_lon.push(lon.gsub!("Lon:",""))
      end 
	# store the location into array
	  doc.css("#tMELBOURNE").each do |a|
       dataStation = a.css("tr")
       dataStation.each do |b|
	     tempname = b.css("a").text
	     if(tempname!="")
		     @locationname<<tempname
		 end
		 end
	 end
    for i in 0..@locationname.length-1
	     @station=@locationname[i]
		 @station_lat=@location_lat[i]
		 @station_lon = @location_lon[i]
		 Station.create(:name=>"#{@station}", :lat=>"#{@station_lat}", :lon=>"#{@station_lon}")
		 end	
       	 
end
def get_latlon
      for i in 0..@locationname.length-1
	       @station_latlon[i]="#{@location_lat[i]},#{@location_lon[i]}"
	  end
	      return @station_latlon
end
def get_datetime
    time1 = Time.new
    currenttime = time1.to_i
    time2 = time1-86400
    yesterday = time2.to_i
    forecast_past = JSON.parse(open("#{BASE_URL}/#{API_KEY}/#{LAT_LONG},#{yesterday}").read)
    yesterday_data = forecast_past["hourly"]["data"]
    forecast_today = JSON.parse(open("#{BASE_URL}/#{API_KEY}/#{LAT_LONG},#{currenttime}").read)
    today_data=forecast_today["hourly"]["data"]
    @time_array=[]
for i in 0..yesterday_data.length-1
    @time_array.push(Time.at(yesterday_data[i]["time"]))
end
for i in 0..today_data.length-1   
	 if today_data[i]["time"]<currenttime
	@time_array.push(Time.at(today_data[i]["time"]))
	 end	     
end
     return @time_array.reverse
end


end

