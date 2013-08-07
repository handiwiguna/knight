# encoding: utf-8

require 'spec_helper'

describe Rule::MaximumLength, '#to_hash' do
  subject { object.to_hash }

  let(:object) { described_class.new(:foo, 20) }

  it { should be_frozen }
  it { should eql({ attribute: :foo, maximum: 20 }) }
end
