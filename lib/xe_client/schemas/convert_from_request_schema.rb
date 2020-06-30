module MyGem
  ConvertFromRequestSchema = Dry::Validation.Schema do
    required(:account_id).filled(:str?)
    required(:api_key).filled(:str?)
    required(:host).filled(:str?)
  end
end
