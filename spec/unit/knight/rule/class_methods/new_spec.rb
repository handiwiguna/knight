# encoding: utf-8

require 'spec_helper'

describe Rule, '.new' do

  {
    Rule::Presence => "%{attribute} can't be blank"
  }.each do |described_class, default_message|
    context 'when called on the Rule subclass' do
      let(:object)    { described_class }
      let(:attribute) { :foo }
      let(:options)   { { message: 'message' } }

      context 'with options' do
        subject { object.new(attribute, options) }

        it { should be_instance_of(object) }
        its(:attribute_name) { should eql(attribute) }
        its(:options) { should eql(options) }
        its(:message) { should eql('message') }
      end

      context 'with no options' do
        subject { object.new(attribute) }

        it { should be_instance_of(object) }
        its(:options) { should be_empty }
        its(:message) { should eql(default_message) }
      end
    end
  end

  context 'when called on the Rule class' do
    subject { described_class.new(:foo) }
    specify { expect { subject }.to raise_error(NotImplementedError, "#{described_class} is an abstract type") }
  end
end
