# encoding: utf-8

require 'spec_helper'

describe Result, '.new' do
  subject { described_class.new(resource, rules) }

  let(:validator) { Validator.new(Rule::Presence.new(:title)) }
  let(:rules) { validator.rules }
  let(:resource) { double('resource') }

  it { should be_instance_of(described_class) }
end
