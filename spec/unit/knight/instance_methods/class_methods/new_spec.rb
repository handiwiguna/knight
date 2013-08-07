# encoding: utf-8

require 'spec_helper'

describe InstanceMethods, '.new' do
  subject { described_class.new(resource) }

  let(:described_class) { Class.new { include InstanceMethods } }
  let(:resource) { double('resource') }

  its(:resource) { should eql(resource) }
end
