# encoding: utf-8

require 'spec_helper'

describe Validator, '#run_on' do
  subject { validator.run_on(resource, attribute) }

  let(:validator) { described_class.new }
  let(:resource) { double('resource') }
  let(:attribute) { :username }

  it do
    validator.should_receive(:on).with(attribute)
    should be_instance_of(Result)
  end
  its(:resource) { should eql(resource) }
end
