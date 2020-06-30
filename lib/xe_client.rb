require "xe_client/version"
require "api_client_base"
require "active_model"
require "dry-validation"
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
require "xe_client/schemas/convert_from_request_schema"
require "xe_client/errors/error"
require "xe_client/errors/authentication_error"

module XEClient

  include APIClientBase::Base.module

  DEFAULT_HOST = "https://xecdapi.xe.com"

  with_configuration do
    has :host, classes: String, default: DEFAULT_HOST
    has :account_id, classes: String
    has :api_key, classes: String
  end

end
