# encoding: utf-8

require 'spec_helper'

describe Rule, '#error' do
  subject { rule.error(resource) }

  let(:klass) do
    Class.new do
      def foo
        'value'
      end
    end
  end
  let(:rule) { Rule::Presence.new(:foo) }
  let(:resource) { klass.new }

  context 'not matched' do
    before { rule.should_receive(:matches?).with('value').and_return(false) }

    it { should eql(Error.new(rule, resource)) }
  end

  context 'matched' do
    before { rule.should_receive(:matches?).with('value').and_return(true) }

    it { should be_nil }
  end
end
