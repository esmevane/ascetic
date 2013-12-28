require 'json'
require 'yaml'

module Ascetic
  class Config
    attr_reader :contents, :message, :strategy

    STRATEGIES = { '.json' => JSON, '.yml' => YAML }
    MESSAGES   = { '.json' => :parse, '.yml' => :load }

    def initialize path
      extension = File.extname path
      @contents = File.read path
      @strategy = STRATEGIES[extension]
      @message  = MESSAGES[extension]
    end

    def parse
      result = strategy.send message, contents
      symbolize result
    end

    private

    def symbolize value
      return value unless value.is_a? Hash
      value.reduce(Hash.new) do |hash, (key, value)|
        hash[key.to_sym] = symbolize value
        hash
      end
    end

  end
end