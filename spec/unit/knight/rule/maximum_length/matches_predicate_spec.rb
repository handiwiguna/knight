# encoding: utf-8

require 'spec_helper'

describe Rule::MaximumLength, '#matches?' do
  subject { rule.matches?(value) }

  let(:rule) { described_class.new(:foo, 3) }

  %w(ab abc).each do |value|
    context "with value: #{value.inspect}" do
      let(:value) { value }
      it { should be_true }
    end
  end

  context 'longer' do
    let(:value) { 'abcd' }
    it { should be_false }
  end
end
