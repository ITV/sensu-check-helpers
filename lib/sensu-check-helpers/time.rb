module SensuCheckHelpers
  module Time
    def time_period_in_seconds(end_time, start_time)
      end_time - start_time
    end

    def as_seconds(duration)
      ChronicDuration.parse(duration.to_s, keep_zero: true)
    end

    def pretty_time(duration)
      ChronicDuration.output(duration, format: :long)
    end
  end
end
