# encoding: utf-8

require 'spec_helper'

describe Result, '#valid?' do
  subject { result.valid? }

  let(:klass) do
    Class.new do
      attr_reader :foo
      def initialize(foo)
        @foo = foo
      end
    end
  end
  let(:validator) { Validator.new(Rule::Presence.new(:foo)) }
  let(:result) { validator.run(resource) }

  context 'valid result' do
    let(:resource) { klass.new('bar') }
    it { should be_true }
  end

  context 'invalid result' do
    let(:resource) { klass.new('') }
    it { should be_false }
  end
end
