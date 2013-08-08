# encoding: utf-8

require 'spec_helper'

describe Validator, '#add' do
  subject { validator.rules }

  let(:validator) { described_class.new(rule1) }
  let(:rule1) { Rule::ExactLength.new(:username, 10) }
  let(:rule2) { Rule::Presence.new(:username) }

  before do
    validator.add(rule2)
    validator.add(nil)
  end

  specify { expect(subject.size).to eql(2) }
  specify { expect(subject).to eql(Set.new([rule1, rule2])) }
end
