module Ascetic
  class Store
    attr_reader :contents

    def initialize options = Hash.new
      @contents = options
    end

    def set key, value
      contents[key] = value
    end

    def get key
      contents[key]
    end
  end
end
