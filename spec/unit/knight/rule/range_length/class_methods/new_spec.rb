# encoding: utf-8

require 'spec_helper'

describe Rule::RangeLength, '.new' do

  let(:attribute) { :foo }
  let(:range)     { 3..4 }
  let(:options)   { { message: 'message' } }

  context 'with options' do
    subject { described_class.new(attribute, range, options) }

    it { should be_instance_of(described_class) }
    its(:attribute_name) { should eql(attribute) }
    its(:range) { should eql(range) }
    its(:options) { should eql(options) }
  end

  context 'with no options' do
    subject { described_class.new(attribute, range) }

    it { should be_instance_of(described_class) }
    its(:options) { should be_empty }
    its(:message) { should eql('%{attribute} has an invalid length') }
  end
end
