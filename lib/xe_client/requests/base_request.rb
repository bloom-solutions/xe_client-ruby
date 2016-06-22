module XEClient
  class BaseRequest

    include Virtus.model
    attribute :account_id, String
    attribute :api_key, String
    attribute :url, String

    include ActiveModel::Validations
    validates :account_id, :api_key, :url, presence: true

    def self.call(opts)
      self.new(opts).call
    end

  end
end
