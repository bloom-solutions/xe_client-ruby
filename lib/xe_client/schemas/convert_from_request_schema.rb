module MyGem
  class ConvertFromRequestSchema < Dry::Validation::Contract

    params do
      required(:account_id).filled(:str?)
      required(:api_key).filled(:str?)
      required(:host).filled(:str?)
    end

  end
end
