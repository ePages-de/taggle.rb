# frozen_string_literal: true

# Beyond JsonWebToken for API calls
class BeyondJwt
  def initialize(json_data)
    Rails.application.secrets.store(:access_token, json_data["access_token"])
  end
end
