# encoding: utf-8

require 'spec_helper'

describe Validator, '#run' do
  subject { validator.run(resource) }

  let(:validator) { described_class.new(Rule::Presence.new(:username)) }
  let(:resource) { double('resource') }

  it { should be_instance_of(Result) }
  its(:resource) { should eql(resource) }
  its(:rules) { should eql(validator.rules) }
end
