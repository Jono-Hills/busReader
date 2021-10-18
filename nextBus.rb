# Roadmap
#
# Use net:http for request
# Args
#     Bus, Stop (number or name)
require 'nokogiri'
require 'net/http'

class BusStopReader

  def initialize
    @bus = "17"
    @stop = "917" #PlatformNo 41896
    @returnAll = true
  end

  def printNextBus
    outputStr = '';
    uri = URI('https://www.metroinfo.co.nz/api/nextbus')
    uri.query = URI.encode_www_form(:PlatformTag => @stop)

    responseRaw = Net::HTTP.get(uri)
    response = Nokogiri::XML(responseRaw).remove_namespaces!
    platform = response.xpath("//Platform")
    outputStr += "+++++++++\n"
    outputStr += "Stop: #{platform.first.attributes["Name"].value}\n"
    outputStr += "\nNext Bus:\n+++++++++\n"

    routes = response.xpath("//Route")


    routes.each do |route|
      busNo = route.attributes["RouteNo"].value
      # make map here
      # sort by time instead of number
      # print to string

      if (@returnAll || busNo == @bus)

        trips = route.children[1].children
        i = 1

        while i < trips.size()
          trip = trips[i]
          outputStr += "#{'%-2d'%busNo}|" + getDurationString(trip) + "\n"
          i += 2

        end
        outputStr += "  |----------------------\n"
        break unless @returnAll
      end
    end
    print outputStr
  end

  def parseArgs
    for i in 0...ARGV.length
      arg = ARGV[i].split('=')

      case arg[0]
      when "--bus"
        @bus = getArgValue(arg)
        @returnAll = false

      when "--stop"
        @stop = getArgValue(arg)

      else
        raise ArgumentError.new(arg[0])
      end
    end
  end

  def getArgValue(arg)
    raise ArgumentError.new(arg[0]) if arg.length != 2
    arg[1]
  end

  def getDurationString(trip)
    durationString = ' ' * 20
    timeLeft = Integer(trip.attributes["ETA"].value).floor
    if timeLeft >= 20
      durationString += '🚌'
    else
      durationString.insert(timeLeft, '🚌')
    end
    durationString += " #{trip.attributes["ETA"].value}m"
    return durationString
  end
end

class ArgumentError < StandardError
    def initialize(arg)
      msg = "Invalid argument usage: " + arg + ". Available arguments: --bus=<busNumber>, --stop=<stopNumber>"
      super(msg)
    end
end


busReader = BusStopReader.new
busReader.parseArgs

while true
  busReader.printNextBus

  sleep(30)
  puts "\e[H\e[2J"

  # Do things
  # Like stdin read to start platform search
  # Emoji buses using col widths to show time left
  #     puts `tput cols`
  # Or other cool things
  # Look into syswide commands



end

