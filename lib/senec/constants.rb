module Senec
  # For a full list of available vars, see http://[IP-of-your-SENEC]/vars.html
  # Comments taken from https://gist.github.com/smashnet/82ad0b9d7f0ba2e5098e6649ba08f88a
  BASIC_REQUEST = {
    ENERGY: {
      STAT_STATE: '',                   # Current state of the system (int, see SYSTEM_STATE_NAME)
      GUI_BAT_DATA_CURRENT: '',         # Battery charge current: negative if discharging, positiv if charging (A)
      GUI_BAT_DATA_FUEL_CHARGE: '',     # Remaining battery (percent)
      GUI_BAT_DATA_POWER: '',           # Battery charge power: negative if discharging, positiv if charging (W)
      GUI_BAT_DATA_VOLTAGE: '',         # Battery voltage (V)
      GUI_GRID_POW: '',                 # Grid power: negative if exporting, positiv if importing (W)
      GUI_HOUSE_POW: '',                # House power consumption (W)
      GUI_INVERTER_POWER: '',           # PV production (W)
      STAT_HOURS_OF_OPERATION: ''       # Appliance hours of operation
    },
    WIZARD: {
      APPLICATION_VERSION: ''
    },
    RTC: {
      UTC_OFFSET: '',
      WEB_TIME: ''
    },
    PV1: {
      MPP_POWER: '',                    # List: MPP power (W)
      POWER_RATIO: ''                   # Grid export limit (percent)
    },
    TEMPMEASURE: {
      CASE_TEMP: ''
    },
    WALLBOX: {
      APPARENT_CHARGING_POWER: ''
    }
  }.freeze
end
