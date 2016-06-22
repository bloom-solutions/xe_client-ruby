module XEClient
  class IndifferentHash < Virtus::Attribute
    def coerce(value)
      value.is_a?(::Hash) ? value.with_indifferent_access : value
    end
  end
end
