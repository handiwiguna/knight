# encoding: utf-8

require 'spec_helper'

describe Result, '#on' do
  subject { result.on(:foo) }

  let(:klass) do
    Class.new do
      attr_reader :foo
      def initialize(foo)
        @foo = foo
      end
    end
  end

  let(:result) { validator.run(resource) }
  let(:validator) { Validator.new(*rules) }
  let(:resource) { klass.new('bar') }
  let(:rules) do
    [
      Rule::Presence.new(:foo),
      Rule::ExactLength.new(:foo, 4),
      Rule::Presence.new(:username),
      Rule::ExactLength.new(:username, 3)
    ]
  end

  it { should be_instance_of(Set) }
  specify { expect(subject.size).to eql(1) }
  specify { expect(result.errors.size).to eql(2) }
end
