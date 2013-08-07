# encoding: utf-8

require 'spec_helper'

describe Knight do
  subject { result.valid? }

  let(:result) { validator.new(resource).run }
  let(:validator) do
    Class.new do
      include InstanceMethods
      validator.add(Rule::Presence.new(:username))
      validator.add(Rule::ExactLength.new(:username, 4))
      validator.add(Rule::Inclusion.new(:username, %w(john bejo)))
      validator.add(Rule::Format.new(:username, /\Ajo/))
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

  let(:resource) { user_class.new('john') }
  it { should be_true }
end
