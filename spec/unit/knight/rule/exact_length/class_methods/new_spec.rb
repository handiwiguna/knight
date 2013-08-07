# encoding: utf-8

require 'spec_helper'

describe Rule::ExactLength, '.new' do

  let(:attribute) { :foo }
  let(:length)    { 3 }
  let(:options)   { { message: 'message' } }

  context 'with options' do
    subject { described_class.new(attribute, length, options) }

    it { should be_instance_of(described_class) }
    its(:attribute_name) { should eql(attribute) }
    its(:length) { should eql(length) }
    its(:options) { should eql(options) }
  end

  context 'with no options' do
    subject { described_class.new(attribute, length) }

    it { should be_instance_of(described_class) }
    its(:options) { should be_empty }
    its(:message) { should eql('%{attribute} has an invalid length') }
  end
end
