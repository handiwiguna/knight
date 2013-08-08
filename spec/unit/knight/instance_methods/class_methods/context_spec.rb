# encoding: utf-8

require 'spec_helper'

describe InstanceMethods, '.context' do

  let(:described_class) { Class.new { include InstanceMethods } }

  it do
    described_class.should_receive(:validator).with(:registration).and_return(Validator.new)
    described_class.context(:registration) do |validator|
      validator.add Rule::Presence.new(:foo)
    end
  end
end
