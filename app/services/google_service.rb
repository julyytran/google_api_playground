class GoogleService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://maps.googleapis.com/maps/api/distancematrix/json")
  end

  def addresses
    thing = parse(connection.get("?origins=Vancouver+BC%7CSeattle&destinations=San+Francisco%7CVictoria+BC&mode=bicycling&language=fr-FR&key=#{ENV['GOOGLE_API_KEY']}"))
    # thing = parse(connection.get("?origin=1510+Blake+Street+Denver+Colorado&destination=6715+West+Colfax+Avenue+Lakewood+Colorado&key=#{ENV['GOOGLE_API_KEY']}"))
    # result = thing[:rows]
  end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end