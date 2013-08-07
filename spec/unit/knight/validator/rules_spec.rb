# encoding: utf-8

require 'spec_helper'

describe Validator, '#rules' do

  let(:validator) { described_class.new(Rule::Presence.new(:username)) }
  let(:resource) { double('resource') }

  before do
    validator.add(Rule::Presence.new(:title), :register)
  end

  context 'default context' do
    subject { validator.rules }
    specify { expect(subject.size).to eql(1) }
  end

  context 'register context' do
    subject { validator.rules(:register) }
    specify { expect(subject.size).to eql(1) }
  end

  context 'not defined context' do
    subject { validator.rules(:else) }
    it { should be_instance_of(Set) }
    specify { expect(subject.size).to eql(0) }
  end
end
