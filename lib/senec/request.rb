require 'http'
require 'json'
require 'senec/value'
require 'senec/constants'

module Senec
  class Request
    def initialize(host:)
      @host = host
    end

    def house_power
      get('ENERGY', 'GUI_HOUSE_POW')
    end

    def inverter_power
      get('ENERGY', 'GUI_INVERTER_POWER')
    end

    def bat_power
      get('ENERGY', 'GUI_BAT_DATA_POWER')
    end

    def bat_fuel_charge
      get('ENERGY', 'GUI_BAT_DATA_FUEL_CHARGE')
    end

    def bat_charge_current
      get('ENERGY', 'GUI_BAT_DATA_CURRENT')
    end

    def bat_voltage
      get('ENERGY', 'GUI_BAT_DATA_VOLTAGE')
    end

    def grid_power
      get('ENERGY', 'GUI_GRID_POW')
    end

    def wallbox_charge_power
      get('WALLBOX', 'APPARENT_CHARGING_POWER')
    end

    def case_temp
      get('TEMPMEASURE', 'CASE_TEMP')
    end

    def current_state
      state = get('STATISTIC', 'CURRENT_STATE')

      STATE_NAMES[state]
    end

    def measure_time
      get('STATISTIC', 'MEASURE_TIME')
    end

    private

    def get(*keys)
      value = response.dig(*keys)

      if value.is_a?(Array)
        value.map do |v|
          Senec::Value.new(v).decoded
        end
      else
        Senec::Value.new(value).decoded
      end
    end

    def response
      @response ||= begin
        res = HTTP.post uri, json: Senec::BASIC_REQUEST

        if res.status.success?
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
