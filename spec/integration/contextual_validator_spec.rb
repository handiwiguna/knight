# encoding: utf-8

require 'spec_helper'

describe Knight do
  subject { result.valid? }

  let(:validator) do
    Class.new do
      include InstanceMethods
      validator.add(Rule::Presence.new(:username))
      validator.add(Rule::ExactLength.new(:username, 3..4), :registration)

      validator.context :registration do |context|
        context << Rule::Presence.new(:title)
        context << Rule::ExactLength.new(:description, 40)
      end
    end
  end

  let(:user_class) do
    Class.new do
      attr_reader :username
      def initialize(username)
        @username = username
      end
    end
  end

  context 'valid' do
    let(:result) { validator.new(resource).run }
    let(:resource) { user_class.new('john') }
    it { should be_true }
  end

  context 'invalid' do
    let(:result) { validator.new(resource).run(:registration) }
    let(:resource) { user_class.new('john') }
    it { should be_false }
  end
end
