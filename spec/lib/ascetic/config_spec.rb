require 'spec_helper'

describe Ascetic::Config do
  let(:base_hash) do
    { 'first_level' => { 'second_level' => true },
      'array_key' => ['array_value'] }
  end

  let(:symbolized_hash) { symbolize base_hash }
  let(:config) { Ascetic::Config.new file }

  describe 'with JSON' do
    let(:file) { 'config.json' }

    describe '#strategy' do
      subject { config.strategy }
      it { File.stub(:read, '') { subject.must_equal JSON }}
    end

    describe '#message' do
      subject { config.message }
      it { File.stub(:read, '') { subject.must_equal :parse } }
    end

    describe '#parse' do
      let(:json) { base_hash.to_json }
      subject { File.stub(:read, json) { config.parse } }
      it { subject.must_be_instance_of Hash }
      it { subject.must_equal symbolized_hash }
    end

  end

  describe 'with YAML' do
    let(:file) { 'config.yml' }

    describe '#strategy' do
      subject { config.strategy }
      it { File.stub(:read, '') { subject.must_equal YAML }}
    end

    describe '#message' do
      subject { config.message }
      it { File.stub(:read, '') { subject.must_equal :load } }
    end

    describe '#parse' do
      let(:yaml) { base_hash.to_yaml }
      subject { File.stub(:read, yaml) { config.parse } }
      it { subject.must_be_instance_of Hash }
      it { subject.must_equal symbolized_hash }
    end

  end
end
