# encoding: utf-8

require 'spec_helper'

describe Rule, '#to_hash' do
  subject { object.to_hash }

  let(:described_class) { Class.new(Rule) }
  let(:object) { described_class.new(:foo) }

  it { should be_frozen }
  it { should eql({ attribute: :foo }) }
end
