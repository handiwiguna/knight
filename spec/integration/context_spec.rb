# encoding: utf-8

require 'spec_helper'

describe Knight do

  let(:klass) do
    Class.new do
      include InstanceMethods

      validator.add(Rule::Presence.new(:foo))

      context :context1 do |validator|
        validator.add(Rule::Presence.new(:bar))
      end

      validator.add(Rule::Presence.new(:baz))

      context :default do |validator|
        validator.add(Rule::Presence.new(:username))
      end

      context :context1 do |validator|
        validator.add(Rule::Presence.new(:password))
      end

      context :context2 do |validator|
        validator.add(Rule::Presence.new(:title))
      end
    end
  end

  context 'default context' do
    subject { klass.validator }
    specify { expect(subject.rules.size).to eql(3) }
  end

  context 'context1' do
    subject { klass.validator(:context1) }
    specify { expect(subject.rules.size).to eql(5) }
  end

  context 'context2' do
    subject { klass.validator(:context2) }
    specify { expect(subject.rules.size).to eql(4) }
  end

  context 'not exists context' do
    subject { klass.validator(:registration) }
    specify { expect(subject.rules.size).to eql(0) }
  end
end
