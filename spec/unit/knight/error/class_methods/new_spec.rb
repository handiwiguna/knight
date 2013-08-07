# encoding: utf-8

require 'spec_helper'

describe Error, '.new' do
  subject { described_class.new(rule, resource) }

  let(:resource) { double('resource') }
  let(:rule) { Rule::Presence.new(:foo) }

  it { should be_instance_of(described_class) }

  its(:rule) { should eql(rule) }
  its(:resource) { should eql(resource) }
end
