# encoding: utf-8

require 'spec_helper'

describe Rule::Inclusion, '#to_hash' do
  subject { object.to_hash }

  let(:object) { described_class.new(:foo, [2, 4]) }

  it { should be_frozen }
  it { should eql({ attribute: :foo, within: [2, 4] }) }
end
