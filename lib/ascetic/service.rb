module Ascetic
  class Service
    attr_reader :store

    def initialize store = Store.new
      @store = store
    end

    def method_missing symbol, *arguments, &block
      last_character = symbol.slice -1, 1
      last_character == "?" ? present?(symbol) : get_from_store(symbol)
    end

    def respond_to? *_
      true
    end

    private

    def present? symbol
      key_name = symbol.slice(0...-1).to_sym
      result = get_from_store key_name
      !!result
    end

    def get_from_store symbol
      store.get symbol
    end

  end
end
