# encoding: utf-8

require 'spec_helper'

describe Result, '#errors' do
  subject { result.errors }

  let(:klass) do
    Class.new do
      attr_reader :foo
      def initialize(foo)
        @foo = foo
      end
    end
  end
  let(:validator) { Validator.new(*rules) }
  let(:result) { validator.run(resource) }

  context 'valid object' do
    let(:resource) { klass.new('bar') }
    let(:rules) { [Rule::Presence.new(:foo)] }
    specify { expect(subject.size).to eql(0) }
  end

  context 'valid object' do
    let(:resource) { Class.new }
    let(:rules) { [Rule::ExactLength.new(:bar, 3)] }
    specify { expect(subject.size).to eql(0) }
  end

  context 'multi rules on distinct attribute' do
    let(:rules) do
      [Rule::Presence.new(:foo), Rule::ExactLength.new(:bar, 3)]
    end

    context 'empty string' do
      let(:resource) { klass.new('') }
      specify { expect(subject.size).to eql(1) }
      specify { expect(subject.first.rule).to be_instance_of(Rule::Presence) }
    end

    context 'invalid object' do
      let(:resource) { Class.new }
      specify { expect(subject.size).to eql(1) }
      specify { expect(subject.first.rule).to be_instance_of(Rule::Presence) }
    end
  end

  context 'multi rules on 1 attribute' do
    let(:rules) do
      [Rule::Presence.new(:foo), Rule::ExactLength.new(:foo, 3)]
    end

    context 'empty string' do
      let(:resource) { klass.new('') }
      specify { expect(subject.size).to eql(2) }
    end

    context 'invalid value' do
      let(:resource) { klass.new('john') }
      specify { expect(subject.size).to eql(1) }
      specify { expect(subject.first.rule).to be_instance_of(Rule::ExactLength) }
    end

    context 'invalid object' do
      let(:resource) { Class.new }
      specify { expect(subject.size).to eql(1) }
      specify { expect(subject.first.rule).to be_instance_of(Rule::Presence) }
    end
  end
end
