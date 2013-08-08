# encoding: utf-8

require 'spec_helper'

describe Knight do
  subject { result.valid? }

  let(:object) { validator.new(resource) }
  let(:resource) { user_class.new('john') }
  let(:validator) do
    Class.new do
      include InstanceMethods
      validator.add(Rule::Presence.new(:username))

      context :registration do |validator|
        validator.add(Rule::ExactLength.new(:username, 4))
        validator.add(Rule::Presence.new(:title))
        validator.add(Rule::ExactLength.new(:description, 40))
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
    let(:result) { object.run }
    it { should be_true }
  end

  context 'invalid' do
    let(:result) { object.run(:registration) }
    it { should be_false }
  end
end
