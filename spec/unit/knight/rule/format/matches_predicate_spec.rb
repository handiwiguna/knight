# encoding: utf-8

require 'spec_helper'

describe Rule::Format, '#matches?' do
  subject { rule.matches?(value) }

  let(:rule) { described_class.new(:foo, /abc/) }

  %w(
    abcxxx
    xxxabc
    xxxabcxxx
  ).each do |value|
    context "with value: #{value.inspect}" do
      let(:value) { value }
      it { should be_true }
    end
  end

  %w(
    bcxxx
    xxxac
    xxxabxxx
  ).each do |value|
    context "with value: #{value.inspect}" do
      let(:value) { value }
      it { should be_false }
    end
  end
end
