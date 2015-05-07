module SensuCheckHelpers

  module Request

    def http_request(url)
      response = open url
      JSON.parse response.read
    end

  end

end
