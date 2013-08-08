# encoding: utf-8

module Knight
  class Result
    include Equalizer.new(:resource, :rules)

    # Return the resource
    #
    # @return [Object]
    #
    # @api private
    attr_reader :resource

    # Return the rule set
    #
    # @return [Set(Rule)]
    #
    # @api private
    attr_reader :rules

    # Initialize a validation result
    #
    # @param [Object] resource
    # @param [Set(Rule)] rules
    #
    # @return [Result]
    #
    # @api private
    def initialize(resource, rules)
      @resource = resource
      @rules    = rules
    end

    # Check the result valid or not
    #
    # @example
    #   validator = Validator.new(Rule::Presence.new(:username))
    #   user = User.new(username: 'john')
    #
    #   result = validator.run(resource)
    #   result.valid?
    #
    # @return [true] if valid
    # @return [false] otherwise
    #
    # @api public
    def valid?
      errors.empty?
    end

    # Return the result errors
    #
    # @example
    #   validator = Validator.new(Rule::Presence.new(:username))
    #   user = User.new(username: 'john')
    #
    #   result = validator.run(resource)
    #   result.errors
    #
    # @return [Set(Error)]
    #
    # @api public
    def errors
      rules.each_with_object(Set.new) do |rule, errors|
        error = attribute_check(rule)
        errors << error if error
      end
    end

    # Return the errors for specific attribute
    #
    # @example
    #   validator = Validator.new(Rule::Presence.new(:username))
    #   user = User.new(username: 'john')
    #
    #   result = validator.run(resource)
    #   result.on(:username)
    #
    # @return [Set(Error)]
    #
    # @api public
    def on(attribute)
      errors.select { |error| error.attribute_name == attribute }
    end

    private

    # Check an attribute to the rule
    #
    # @return [Error] if invalid
    # @return [nil] otherwise
    #
    # @api private
    def attribute_check(rule)
      if resource.respond_to?(rule.attribute_name)
        rule.error(resource)
      else
        Error.new(rule, resource) if rule.kind_of?(Rule::Presence)
      end
    end
  end
end
