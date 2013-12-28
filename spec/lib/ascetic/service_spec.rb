require 'spec_helper'

describe Ascetic::Service do

  describe 'default behavior' do
    let(:service) { Ascetic::Service.new }
    subject { service }
    it { subject.respond_to?(:whatever).must_equal true }
    it { subject.whatever.must_be_nil }
    it { subject.whatever?.must_equal false }
  end

  describe 'with a populated Store object' do
    let(:value) { "Value" }
    let(:store) { Ascetic::Store.new key: value }
    let(:service) { Ascetic::Service.new store }
    subject { service }
    it { subject.key.must_equal value }
    it { subject.key?.must_equal true }
  end

end
