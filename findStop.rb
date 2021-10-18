
  # Platform finder
  # https://www.metroinfo.co.nz/api/gis
  # Params: seperate words by space, prefix with 'street[]='

  # https://www.metroinfo.co.nz/api/gis?street[]=Wairakei&street[]='Rd'

  # Response:

  # "features": [
  #   {
  #       "attributes": {
  #           "PlatformName": "Wairakei Rd near Abros Pl",
  #           "RouteNos": "17",
  #           "PlatformNo": 16481,
  #           "PlatformTag": 645,
  #           "RoadName": "Wairakei Rd",
  #           "BearingToRoad": 213,
  #           "BearingToRoad": 213
  #       }
  #   },

  # Get name and tag n display
require 'JSON'
require 'net/http'


class BusStopFinder
    def initialize
        
    end

    def parseArgs
        searchTerms = ARGV[0].split(' ')

        searchTerms
    end

    def findStops(searchTerms)
        requestParams = searchTerms.map { |k| "street[]=#{k}" }.join("&")

        outputStr = '';
        uri = URI('https://www.metroinfo.co.nz/api/gis?' + requestParams)
        # uri.query = URI.encode_www_form(:PlatformTag => @stop)
    
        responseRaw = Net::HTTP.post_form(uri, 'q' => 'ruby', 'max' => '50')
        response = JSON.parse(responseRaw.body)
        results = response["features"]
        results.each do |stop|
            stopData = stop["attributes"]
            # Change to use string formatting "#{stopData['PlatformName']}"
            # BearingToRoad gets direction, 57 is north, 237 is souf

            outputStr += stopData["PlatformName"] + " " + stopData['PlatformTag'].to_s + "\n"
        end

        puts outputStr
    end
end

stopFinder = BusStopFinder.new
searchTerms = stopFinder.parseArgs
stopFinder.findStops(searchTerms)

