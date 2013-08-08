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
      @rule     = rule
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
      @rule.message % @rule.to_hash.merge(value: value)
    end

    # Return error attribute name
    #
    # @return [String]
    #
    # @api private
    def attribute_name
      @rule.attribute_name
    end

    # Return error value
    #
    # @return [Object]
    #
    # @api private
    def value
      @resource.public_send(attribute_name) if @resource.respond_to?(attribute_name)
    end
  end
end
