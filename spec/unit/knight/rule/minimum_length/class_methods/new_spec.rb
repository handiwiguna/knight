# encoding: utf-8

require 'spec_helper'

describe Rule::MinimumLength, '.new' do

  let(:attribute) { :foo }
  let(:minimum)   { 3 }
  let(:options)   { { message: 'message' } }

  context 'with options' do
    subject { described_class.new(attribute, minimum, options) }

    it { should be_instance_of(described_class) }
    its(:attribute_name) { should eql(attribute) }
    its(:minimum) { should eql(minimum) }
    its(:options) { should eql(options) }
  end

  context 'with no options' do
    subject { described_class.new(attribute, minimum) }

    it { should be_instance_of(described_class) }
    its(:options) { should be_empty }
    its(:message) { should eql('%{attribute} is too short') }
  end
end
