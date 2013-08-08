# encoding: utf-8

require 'spec_helper'

describe Validator, '#on' do
  subject { validator.on(:username) }

  let(:validator) { described_class.new(*rules) }
  let(:rules) { [Rule::Presence.new(:username), Rule::Presence.new(:password)] }

  it { should be_instance_of(Set) }
  specify { expect(subject.size).to eql(1) }
end
