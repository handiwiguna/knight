# encoding: utf-8

require 'spec_helper'

describe InstanceMethods, '.run' do
  subject { object.run }

  let(:described_class) do
    Class.new do
      include InstanceMethods
      validator.add(Rule::Presence.new(:username))
      validator.add(Rule::Presence.new(:title), :registration)
    end
  end
  let(:object) { described_class.new(resource) }
  let(:resource) { double('resource') }

  context 'default context' do
    subject { object.run }
    specify { expect(subject.rules).to eql(described_class.validator.rules) }
    specify { expect(subject.rules.size).to eql(1) }
  end

  context 'register context' do
    subject { object.run(:registration) }
    specify { expect(subject.rules).to eql(described_class.validator.rules(:registration)) }
    specify { expect(subject.rules.size).to eql(1) }
  end
end
