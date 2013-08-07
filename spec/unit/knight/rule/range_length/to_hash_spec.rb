# encoding: utf-8

require 'spec_helper'

describe Rule::RangeLength, '#to_hash' do
  subject { object.to_hash }

  let(:object) { described_class.new(:foo, (4...6)) }

  it { should be_frozen }
  it { should eql({ attribute: :foo, minimum: 4, maximum: 5 }) }
end
