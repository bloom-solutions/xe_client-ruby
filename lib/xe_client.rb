require "xe_client/version"
require "active_model"
require "virtus"
require "httparty"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/date_time"
require "active_support/core_ext/string/conversions"
require "xe_client/indifferent_hash"
require "xe_client/models/quote"
require "xe_client/client"
require "xe_client/requests/base_request"
require "xe_client/requests/convert_from_request"
require "xe_client/responses/base_response"
require "xe_client/responses/convert_from_response"
require "xe_client/errors/error"
require "xe_client/errors/authentication_error"

module XEClient

  def self.new(opts)
    client = Client.new(opts)
    raise ArgumentError, client.errors.full_messages if client.invalid?
    client
  end

end
