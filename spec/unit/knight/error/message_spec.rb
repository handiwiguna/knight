# encoding: utf-8

require 'spec_helper'

describe Error, '#message' do
  subject { object.message }

  let(:object)   { described_class.new(rule, resource) }
  let(:resource) { klass.new }
  let(:klass) do
    Class.new do
      def foo
        'ab'
      end
    end
  end
  let(:message) { '%{attribute} must between %{minimum}-%{maximum} characters, value: %{value}' }
  let(:rule) { Rule::RangeLength.new(:foo, 3..5, message: message) }

  it { should eql('foo must between 3-5 characters, value: ab') }

  context 'with no attribute defined' do
    let(:klass) { Class.new }
    it { should eql('foo must between 3-5 characters, value: ') }
  end
end
