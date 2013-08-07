# encoding: utf-8

require 'spec_helper'

describe Rule::Inclusion, '#matches?' do
  subject { rule.matches?(value) }

  let(:rule) { described_class.new(:foo, within) }

  context 'Array' do
    let(:within) { [1, 2, 3] }

    describe 'matched' do
      let(:value) { 5 }
      it { should be_false }
    end

    describe 'not matched' do
      let(:value) { 3 }
      it { should be_true }
    end
  end

  context 'Range' do
    let(:within) { 1..3 }

    describe 'matched' do
      let(:value) { 5 }
      it { should be_false }
    end

    describe 'not matched' do
      let(:value) { 2 }
      it { should be_true }
    end
  end

  context 'cover? vs include?' do
    let(:within) { double('within') }
    let(:value) { 5 }

    it 'send cover?' do
      within.stub(:kind_of?).and_return(true)
      within.should_receive(:cover?).with(value).and_return(false)
      should be_false
    end
  end
end
