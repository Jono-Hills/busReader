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
    @stop = "654"
    @returnAll = true
  end

  def printNextBus
    uri = URI('https://www.metroinfo.co.nz/api/nextbus')
    uri.query = URI.encode_www_form(:PlatformTag => @stop)

    responseRaw = Net::HTTP.get(uri)
    response = Nokogiri::XML(responseRaw).remove_namespaces!
    platform = response.xpath("//Platform")
    puts "+++++++++"
    puts "Stop: " + platform.first.attributes["Name"].value
    puts "\nNext Bus:\n+++++++++"

    routes = response.xpath("//Route")
    

    routes.each do |route|
      busNo = route.attributes["RouteNo"].value

      if (@returnAll || busNo == @bus)

        puts busNo + "|\n---"
        trips = route.children[1].children
        i = 1

        while i < trips.size()
          puts "     #{trips[i].attributes["ETA"].value}m"
          i += 2
        end

        puts "========"
        break unless @returnAll
      end
    end
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
end

class ArgumentError < StandardError
    def initialize(arg)
      msg = "Invalid argument usage: " + arg + ". Available arguments: --bus=<busNumber>, --stop=<stopNumber>"
      super(msg)
    end
end


busReader = BusStopReader.new
busReader.parseArgs
busReader.printNextBus

