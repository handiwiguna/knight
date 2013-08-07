# encoding: utf-8

describe Validator, '#context' do

  before do
    validator.context :registration do |context|
      context << Rule::Presence.new(:username)
    end
  end

  let(:validator) { described_class.new }
  specify { expect(validator.rules(:registration).size).to eql(1) }
end
