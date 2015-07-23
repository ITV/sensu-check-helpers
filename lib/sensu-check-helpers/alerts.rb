module SensuCheckHelpers
  module Alerts
    OK       = 0
    WARNING  = 1
    CRITICAL = 2

    def sensu_client_socket(message)
      UDPSocket.new.send(message + "\n", 0, '127.0.0.1', 3030)
    end

    def send_ok(alert_name, alert_message)
      handlers     = config[:handlers].split(',').map(&:strip)
      check_result = { name: alert_name, status: OK, output: "OK: #{alert_message}", handlers: handlers }
      sensu_client_socket check_result.to_json
    end

    def send_warning(alert_name, alert_message)
      handlers     = config[:handlers].split(',').map(&:strip)
      check_result = { name: alert_name, status: WARNING, output: "WARNING: #{alert_message}", handlers: handlers }
      sensu_client_socket check_result.to_json
    end

    def send_critical(alert_name, alert_message)
      handlers     = config[:handlers].split(',').map(&:strip)
      check_result = { name: alert_name, status: CRITICAL, output: "CRITICAL: #{alert_message}", handlers: handlers }
      sensu_client_socket check_result.to_json
    end
  end
end
