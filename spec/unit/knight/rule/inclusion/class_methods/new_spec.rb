# encoding: utf-8

require 'spec_helper'

describe Rule::Inclusion, '.new' do
  subject { described_class.new(attribute, within) }

  let(:attribute) { :foo }
  let(:within)    { 3..5 }
  let(:options)   { { message: 'message' } }

  context 'with options' do
    subject { described_class.new(attribute, within, options) }

    it { should be_instance_of(described_class) }
    its(:attribute_name) { should eql(attribute) }
    its(:within) { should eql(within) }
    its(:options) { should eql(options) }
  end

  context 'with no options' do
    subject { described_class.new(attribute, within) }

    it { should be_instance_of(described_class) }
    its(:options) { should be_empty }
    its(:message) { should eql('%{attribute} is not included in the list') }
  end
end
