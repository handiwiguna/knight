# encoding: utf-8

module Knight
  class Validator

    DEFAULT_CONTEXT = :default

    # Initialize a validator
    #
    # @example
    #   Validator.new
    #   Validator.new(Rule::Presence.new(:username))
    #
    # @param [Array(Rule)] rules
    #
    # @return [Validator]
    #
    # @api public
    def initialize(*rules)
      @rules = {}
      rules.each { |rule| add(rule) }
    end

    # Add a rule
    #
    # @example
    #   validator = Validator.new
    #   validator.add(Rule::Presence.new(:username))
    #
    # @param [Rule] rule
    # @param [Symbol] context
    #
    # @return [Set(Rule)]
    #
    # @api public
    def add(rule, context_name = DEFAULT_CONTEXT)
      context(context_name) { |rules| rules << rule } if rule
    end

    # Run the validator
    #
    # @example
    #   validator = Validator.new(Rule::Presence.new(:username))
    #   user = User.new(username: 'john')
    #   validator.run(user)
    #
    # @param [Object] resource
    # @param [Symbol] context
    #
    # @return [Result]
    #
    # @api public
    def run(resource, context_name = DEFAULT_CONTEXT)
      Result.new(resource, rules(context_name))
    end

    # Run the validator
    #
    # @example
    #   validator = Validator.new(Rule::Presence.new(:username))
    #   validator.rules
    #
    # @param [Symbol] context
    #
    # @return [Set(Rule)]
    #
    # @api public
    def rules(context_name = DEFAULT_CONTEXT)
      @rules.fetch(context_name) do |key|
        @rules[key] = Set.new
      end
    end

    # Accept block
    #
    # @example
    #   validator = Validator.new
    #   validator.context :registration do |context|
    #     context << Rule::Presence.new(:username)
    #   end
    #
    # @param [Symbol] name
    #
    # @return [undefined]
    #
    # @api public
    def context(name)
      yield rules(name)
    end
  end
end
