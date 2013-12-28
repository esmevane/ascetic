require 'simplecov'

SimpleCov.start { add_filter '/spec/' }

require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/ascetic'

def symbolize value
  return value unless value.is_a? Hash
  value.reduce(Hash.new) do |hash, (key, value)|
    hash[key.to_sym] = symbolize value
    hash
  end
end
