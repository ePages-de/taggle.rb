# frozen_string_literal: true

# Utils for Beyond API calls
module Utils
  def merchant_token
    if Rails.application.secrets[:access_token].present?
      Rails.application.secrets[:access_token]
    else
      BeyondConnection.new.beyond_token
    end
  end
end
