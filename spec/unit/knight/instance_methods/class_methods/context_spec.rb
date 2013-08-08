# encoding: utf-8

require 'spec_helper'

describe InstanceMethods, '.context' do

  let(:described_class) { Class.new { include InstanceMethods } }

  it 'only call validator once' do
    described_class.should_receive(:validator).once.and_return(Validator.new)
    described_class.context(:default) do |validator|
      validator.add Rule::Presence.new(:foo)
    end
  end

  it do
    described_class.validator.add(Rule::Presence.new(:foo))
    described_class.context(:registration) do |validator|
      validator.add Rule::Presence.new(:bar)
    end
    expect(described_class.validator(:default).rules.size).to eql(1)
    expect(described_class.validator(:registration).rules.size).to eql(2)
  end
end
