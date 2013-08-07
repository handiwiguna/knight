# encoding: utf-8

require 'spec_helper'

describe Rule::ExactLength, '#to_hash' do
  subject { object.to_hash }

  let(:object) { described_class.new(:foo, 3) }

  it { should be_frozen }
  it { should eql({ attribute: :foo, length: 3 }) }
end
