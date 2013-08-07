# encoding: utf-8

require 'spec_helper'

describe Validator, '.new' do
  subject { described_class.new(*rules) }

  let(:rules) do
    [
      Rule::Presence.new(:title),
      Rule::Presence.new(:title),
      Rule::Presence.new(:age),
      Rule::ExactLength.new(:title, 20),
    ]
  end
  it { should be_instance_of(described_class) }
  specify { expect(subject.rules.size).to eql(3) }
end
