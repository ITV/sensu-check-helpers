module SensuCheckHelpers

  module Request

    def http_request(url, bypass_ssl: false)
      response = bypass_ssl ? open(url, { :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE }) : open(url)
      JSON.parse response.read
    end

  end

end
