# encoding: utf-8

require 'spec_helper'

describe InstanceMethods, '.validator' do

  let(:described_class) { Class.new { include InstanceMethods } }
  let(:object) { described_class.new(double('1')) }

  context 'default context' do
    subject { described_class.validator }

    it { should be_instance_of(Validator) }
    specify { expect(subject).to equal(object.class.validator) }
  end

  context 'registration context' do
    subject { described_class.validator(:registration) }

    it { should be_instance_of(Validator) }
    specify { expect(subject).not_to equal(described_class.validator) }
  end
end
