# encoding: utf-8

require 'spec_helper'

describe Rule::ExactLength, '#matches?' do
  subject { rule.matches?(value) }

  let(:rule) { described_class.new(:foo, 3) }
  let(:value) { 'abc' }

  it { should be_true }

  %w(ab abcdef).each do |value|
    context "with value: #{value.inspect}" do
      let(:value) { value }
      it { should be_false }
    end
  end
end
