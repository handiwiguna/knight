# encoding: utf-8

require 'spec_helper'

describe Rule::Format, '.new' do
  let(:attribute) { :foo }
  let(:regexp)    { /abc/ }
  let(:options)   { { message: 'message' } }

  context 'with options' do
    subject { described_class.new(attribute, regexp, options) }

    it { should be_instance_of(described_class) }
    its(:attribute_name) { should eql(attribute) }
    its(:regexp) { should eql(regexp) }
    its(:options) { should eql(options) }
  end

  context 'with no options' do
    subject { described_class.new(attribute, regexp) }

    it { should be_instance_of(described_class) }
    its(:options) { should be_empty }
    its(:message) { should eql('%{attribute} has an invalid format') }
  end
end
