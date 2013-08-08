# encoding: utf-8

module Knight

  # Base functionality that added when included to a class
  module InstanceMethods
    DEFAULT_CONTEXT = :default

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
    # @param [Symbol] context
    #
    # @example
    #   user = User.new
    #
    #   class RegistrationValidator
    #     include Knight::InstanceMethods
    #   end
    #
    #   result = RegistrationValidator.new(user).run
    #
    # @return [Result]
    #
    # @api public
    def run(context = DEFAULT_CONTEXT)
      self.class.validator(context).run(resource)
    end

    module ClassMethods

      # Return the validator object
      #
      # @param [Symbol] context
      #
      # @example
      #   class RegistrationValidator
      #     include Knight::InstanceMethods
      #
      #     validator.add(Knight::Rule::Presence.new(:username))
      #   end
      #
      # @return [Validator]
      #
      # @api public
      def validator(context = DEFAULT_CONTEXT)
        validators.fetch(context) do |key|
          validators[key] = Validator.new
        end
      end

      # Return the validator object
      #
      # @param [Symbol] name
      #
      # @example
      #   class RegistrationValidator
      #     include Knight::InstanceMethods
      #
      #     context :register do |validator|
      #       validator.add(Knight::Rule::Presence.new(:username))
      #     end
      #   end
      #
      # @return [undefined]
      #
      # @api public
      def context(name)
        validator = validator(name)
        validator.rules.merge(shared_rules) unless name == DEFAULT_CONTEXT
        yield validator
      end

      private

      # Return all validators
      #
      # @return [Hash]
      #
      # @api private
      def validators
        @validators = @validators || {}
      end

      # Return rules for default context
      #
      # @return [Set(Rule)]
      #
      # @api private
      def shared_rules
        validator.rules
      end
    end
  end
end
