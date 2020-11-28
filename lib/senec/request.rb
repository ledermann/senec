require 'net/http'
require 'json'
require 'senec/value'
require 'senec/constants'

module Senec
  class Request
    def initialize(host:)
      @host = host
    end

    def house_power
      value = response.dig('ENERGY', 'GUI_HOUSE_POW')
      Senec::Value.new(value).to_i
    end

    def inverter_power
      value = response.dig('ENERGY', 'GUI_INVERTER_POWER')
      Senec::Value.new(value).to_i
    end

    def bat_power
      value = response.dig('ENERGY', 'GUI_BAT_DATA_POWER')
      Senec::Value.new(value).to_i
    end

    def grid_power
      value = response.dig('ENERGY', 'GUI_GRID_POW')
      Senec::Value.new(value).to_i
    end

    def current_state
      value = response.dig('STATISTIC', 'CURRENT_STATE')
      state = Senec::Value.new(value).to_i

      STATE_NAMES[state]
    end

    private

    def response
      @response ||= begin
        res = Net::HTTP.post uri, Senec::BASIC_REQUEST.to_json

        case res
        when Net::HTTPOK
          JSON.parse(res.body)
        else
          throw "Failure: #{res.value}"
        end
      end
    end

    def uri
      URI.parse("http://#{@host}/lala.cgi")
    end
  end
end
