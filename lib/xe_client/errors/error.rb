module XEClient
  class Error < StandardError

    CODE_ERROR_MAP = {
      1 => "AuthenticationError",
    }
    attr_accessor :code

    def self.new_from_response(response)
      return nil if response.code.nil?
      klass = if class_name = CODE_ERROR_MAP[response.code]
                XEClient.const_get(class_name)
              else
                self
              end
      error = klass.new(response.message)
      error.code = response.code
      error
    end

  end
end
