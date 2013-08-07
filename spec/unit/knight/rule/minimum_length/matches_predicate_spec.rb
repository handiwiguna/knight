# encoding: utf-8

require 'spec_helper'

describe Rule::MinimumLength, '#matches?' do
  subject { rule.matches?(value) }

  let(:rule) { described_class.new(:foo, 3) }

  %w(abc abcd).each do |value|
    context "with value: #{value.inspect}" do
      let(:value) { value }
      it { should be_true }
    end
  end

  context 'shorter' do
    let(:value) { 'ab' }
    it { should be_false }
  end
end
