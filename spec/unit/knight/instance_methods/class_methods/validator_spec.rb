# encoding: utf-8

require 'spec_helper'

describe InstanceMethods, '.validator' do
  subject { described_class.validator }

  let(:described_class) { Class.new { include InstanceMethods } }
  let(:object) { described_class.new(double('1')) }

  it { should be_instance_of(Validator) }
  specify { expect(subject).to equal(object.class.validator) }
end
