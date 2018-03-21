# frozen_string_literal: true

# Class to get the initial token
class BeyondRequest
  include Utils

  def initialize(path, method, options = {})
    @shop_url = ENV["SHOP_URL"]
    @method = method
    @options = options
    @path = path
    @token = merchant_token
  end

  def perform(retried = nil)
    resp = send("method_#{@method}", connection)
    unauthorized_token(retried, resp) if error_in_status?(resp.status)
    resp
  end

  private
    def connection
      Faraday.new(url: @shop_url, ssl: { verify: true }) do |faraday|
        case @method
        when "post"
          faraday_post(faraday)
        when "delete"
          faraday_delete(faraday)
        end
        faraday_base(faraday)
      end
    end

    def default_timeout
      10
    end

    def error_in_status?(status)
      ["4", "5"].include? status.to_s.chars.first
    end

    def faraday_base(faraday)
      faraday.headers["Authorization"] = "Bearer #{@token}"
      faraday.headers["User-Agent"] = "Taggle"
      faraday.adapter :net_http
      faraday
    end

    def faraday_delete(faraday)
      faraday
    end

    def faraday_post(faraday)
      faraday.request :multipart
      faraday.request :url_encoded
      faraday.headers["Content-Type"] = "application/hal+json"
      faraday.headers["Accept"] = "application/hal+json"
      faraday
    end

    def method_delete(conn)
      conn.delete do |req|
        req.url @path
      end
    end

    def method_get(conn)
      conn.get do |req|
        req.url @path
        req.params = @options
        req.options.timeout = default_timeout
      end
    end

    def method_post(conn)
      conn.post do |req|
        req.url @path
        req.body = @options
      end
    end

    def retry_token
      @token = merchant_token
      perform(true)
    end

    def status_info(status)
      case status
      when 401
        raise "Unauthorized: Wrong token"
      when 403
        raise "Unauthorized: Lack of permissions"
      when 409
        raise "Error: Shop already exists"
      end
    end

    def unauthorized_token(retried, response)
      return retry_token if retried.nil?
      status_info(response.status)
    end
end
