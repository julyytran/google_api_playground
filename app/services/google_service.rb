class GoogleService
  attr_reader :connection, :params

   def initialize
      # @params = "origin=1510+Blake+Street+Denver+Colorado&destination=6715+West+Colfax+Avenue+Lakewood+Colorado&key=#{ENV['GOOGLE_MAPS_DISTANCE_MATRIX_KEY']}"
      @connection = Faraday.new("https://maps.googleapis.com/maps/api/distancematrix/json?") do |faraday|
        # faraday.adapter  Faraday.default_adapter
        faraday.params[:key] = ENV['GOOGLE_MAPS_DISTANCE_MATRIX_KEY']
        faraday.params[:origin] = "1510+Blake+Street+Denver+Colorado"
        faraday.params[:destination] = "6715+West+Colfax+Avenue+Lakewood+Colorado"
      end
   end

   def get
     connection.get(@params).body
   end
 end
