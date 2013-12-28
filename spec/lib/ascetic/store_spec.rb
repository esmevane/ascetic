require 'spec_helper'

describe Ascetic::Store do
  let(:store) { Ascetic::Store.new }

  describe 'accessors' do
    subject { store }
    it { subject.must_respond_to :contents }
  end

  describe '#set' do
    subject { store }
    let(:value) { "Value" }
    it 'sets a value in #contents' do
      store.set :key, value
      store.contents[:key].must_equal value
    end
  end

  describe '#get' do
    let(:store) { Ascetic::Store.new key: value }
    let(:value) { "Value" }
    subject { store.get :key }
    it { subject.must_equal value }
  end

end
