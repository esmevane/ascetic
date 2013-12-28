module Ascetic
  autoload :Config,  'ascetic/config'
  autoload :Service, 'ascetic/service'
  autoload :Store,   'ascetic/store'

  def self.load! path
    @service = Service.new Store.new Config.new(path).parse
  end

  def self.service
    @service ||= Service.new
  end

  def self.respond_to? *arguments
    service.respond_to? *arguments
  end

  def self.method_missing symbol, *arguments, &block
    service.method_missing symbol, *arguments, &block
  end
end
