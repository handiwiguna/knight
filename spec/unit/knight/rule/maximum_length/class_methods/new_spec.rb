# encoding: utf-8

require 'spec_helper'

describe Rule::MaximumLength, '.new' do

  let(:attribute) { :foo }
  let(:maximum)   { 3 }
  let(:options)   { { message: 'message' } }

  context 'with options' do
    subject { described_class.new(attribute, maximum, options) }

    it { should be_instance_of(described_class) }
    its(:attribute_name) { should eql(attribute) }
    its(:maximum) { should eql(maximum) }
    its(:options) { should eql(options) }
  end

  context 'with no options' do
    subject { described_class.new(attribute, maximum) }

    it { should be_instance_of(described_class) }
    its(:options) { should be_empty }
    its(:message) { should eql('%{attribute} is too long') }
  end
end
