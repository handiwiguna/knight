# encoding: utf-8

module Knight

  # A representation of an error
  class Error
    include Equalizer.new(:rule, :resource)

    # Broken rule
    #
    # @return [Rule]
    #
    # @api private
    attr_reader :rule

    # Object under validation
    #
    # @return [Object]
    #
    # @api private
    attr_reader :resource

    # Initialize an error
    #
    # @param [Rule] rule
    # @param [Object] resource
    #
    # @return [Error]
    #
    # @api private
    def initialize(rule, resource)
      @rule = rule
      @resource = resource
    end

    # Return formatted error message
    #
    # @example
    #   error_message = error.message
    #
    # @return [String]
    #
    # @api public
    def message
      rule.message % rule.to_hash.merge(value: value)
    end

    private

    # Return attribute value
    #
    # @return [Object]
    #
    # @api private
    def value
      attribute = rule.attribute_name
      resource.public_send(attribute) if resource.respond_to?(attribute)
    end
  end
end
