# encoding: utf-8

require 'spec_helper'

describe Rule::Presence, '#matches?' do
  subject { rule.matches?(value) }

  let(:rule) { described_class.new(:foo) }

  [
    nil,
    '',
    {},
    [],
    Set.new,
  ].each do |value|
    context "with value: #{value.inspect}" do
      let(:value) { value }
      it { should be_false }
    end
  end

  context 'when the value is a string' do
    let(:value) { 'bar' }
    it { should be_true }
  end
end
