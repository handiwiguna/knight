# encoding: utf-8

require 'spec_helper'

describe Validator, '#run' do

  let(:validator) { described_class.new(Rule::Presence.new(:username)) }
  let(:resource) { double('resource') }

  before do
    validator.add(Rule::Presence.new(:title), :register)
  end

  context 'default context' do
    subject { validator.run(resource) }
    it { should be_instance_of(Result) }
    its(:resource) { should eql(resource) }
    specify { expect(subject.rules).to eql(validator.rules) }
  end

  context 'register context' do
    subject { validator.run(resource, :register) }
    it { should be_instance_of(Result) }
    specify { expect(subject.rules).to eql(validator.rules(:register)) }
  end
end
