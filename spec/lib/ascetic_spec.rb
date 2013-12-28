require 'spec_helper'

describe Ascetic do
  it { Ascetic.service.must_be_instance_of Ascetic::Service }

  describe '#load!' do
    let(:value) { "Value" }
    let(:hash_config) { { "key" => value } }
    let(:json_config) { hash_config.to_json }

    before do
      File.stub(:read, json_config) { Ascetic.load! 'config.json' }
    end

    it { Ascetic.whatever?.must_equal false }
    it { Ascetic.key?.must_equal true }
    it { Ascetic.key.must_equal value }
  end
end
