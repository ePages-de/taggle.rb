# frozen_string_literal: true

# Class to connect ot beyond api
class BeyondConnection
  def beyond_token
    BeyondJwt.new(JSON.parse(@resp.body))
  end

  def initialize
    @client_id = ENV["CLIENT_ID"]
    @client_secret = ENV["CLIENT_SECRET"]
    @shop_url = ENV["SHOP_URL"]

    @resp = token_connection.post do |req|
      req.url "/api/oauth/token"
      req.body = payload
    end
  end

  private
    def headers
      {
        'Cache-Control': "no-cache",
        'Content-Type': "multipart/form-data",
        'User-Agent': "Krypton"
      }
    end

    def payload
      {
        'grant_type': "client_credentials"
      }
    end

    def token_connection
      Faraday.new(url: @shop_url, ssl: { verify: true }) do |faraday|
        faraday.request :multipart
        faraday.request :url_encoded
        faraday.adapter :net_http
        faraday.headers = headers
        faraday.basic_auth(@client_id, @client_secret)
      end
    end
end
