# encoding: utf-8

require 'spec_helper'

describe InstanceMethods, '.run' do

  let(:described_class) do
    Class.new do
      include InstanceMethods
      validator.add(Rule::Presence.new(:username))

      context :registration do |validator|
        validator.add(Rule::Presence.new(:username))
        validator.add(Rule::Presence.new(:title))
      end
    end
  end
  let(:object) { described_class.new(resource) }
  let(:resource) { double('resource') }

  context 'run without context' do
    subject { object.run }
    it { should be_instance_of(Result) }
    specify { expect(subject.rules).to eql(described_class.validator.rules) }
    specify { expect(subject.rules.size).to eql(1) }
  end

  context 'run with context' do
    subject { object.run(:registration) }
    specify { expect(subject.rules).to eql(described_class.validator(:registration).rules) }
    specify { expect(subject.rules.size).to eql(2) }
  end
end
