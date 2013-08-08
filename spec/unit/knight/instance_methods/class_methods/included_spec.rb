# encoding: utf-8

require 'spec_helper'

describe InstanceMethods, '.included' do
  subject { described_class }

  let(:klass)  { Class.new }

  it 'delegates to the ancestor' do
    included_ancestor = false
    mod = Module.new do
      define_method(:included) { |_| included_ancestor = true }
    end
    subject.extend mod
    expect { klass.send(:include, subject) }.to change { included_ancestor }.from(false).to(true)
  end

  it 'respond_to validator' do
    klass.send(:include, subject)
    expect(klass).to respond_to(:validator)
  end

  it 'extends the klass' do
    klass.singleton_class.should_not include(described_class::ClassMethods)
    klass.send(:include, subject)
    klass.singleton_class.should include(described_class::ClassMethods)
  end
end
