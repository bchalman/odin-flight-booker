include ActionView::Helpers::TextHelper

class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @airports_options = Airport.all.map{|a| [ "#{a.code}, #{a.name}", a.id ]}
    @num_passengers = [1,2,3,4].map{|num| [ pluralize(num, 'person'), num ]}
    @departure_time_options = Flight.select(:departure_time).group('DATE(departure_time)')
                                    .map{ |f| [ f.date_formatted, f.departure_time.to_date ]}
  end


  private

    def flight_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_time, :duration, :num_passengers)
    end
end
