# encoding: utf-8

module Knight

  # Base functionality that added when included to a class
  module InstanceMethods

    # Return the resource
    #
    # @return [Object]
    #
    # @api private
    attr_reader :resource

    # Extend base class to support validation
    #
    # @param [Object] object
    #
    # @return [undefined]
    #
    # @api private
    def self.included(base)
      super
      base.extend(ClassMethods)
    end

    # Set the resource
    #
    # @param [Object] resource
    #
    # @return [undefined]
    #
    # @api private
    def initialize(resource)
      @resource = resource
    end

    # Return the validation result
    #
    # @example
    #   user = User.new
    #
    #   class RegistrationValidator
    #     include Knight::InstanceMethods
    #     validator.add(Knight::Rule::Presence.new(:username))
    #   end
    #
    #   result = RegistrationValidator.new(user).result
    #
    # @return [Result]
    #
    # @api public
    def run(context = Validator::DEFAULT_CONTEXT)
      self.class.validator.run(resource, context)
    end

    module ClassMethods

      # Return the validator object
      #
      # @return [Validator]
      #
      # @api private
      def validator
        @validator = @validator || Validator.new
      end
    end
  end
end
