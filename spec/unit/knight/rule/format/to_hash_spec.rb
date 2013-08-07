# encoding: utf-8

require 'spec_helper'

describe Rule::Format, '#to_hash' do
  subject { object.to_hash }

  let(:object) { described_class.new(:foo, /abc/) }

  it { should be_frozen }
  it { should eql({ attribute: :foo, format: /abc/ }) }
end
