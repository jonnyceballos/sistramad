module RouteTranslator
  class Route
    attr_reader :route_set, :path, :name, :options_constraints, :options, :mapping

    def initialize(route_set, path, name, options_constraints, options, mapping)
      @route_set           = route_set
      @path                = path
      @name                = name
      @options_constraints = options_constraints
      @options             = options
      @mapping             = mapping
    end

    def scope
      @scope ||=
        if mapping.defaults[:controller]
          [:routes, :controllers].concat mapping.defaults[:controller].split('/').map(&:to_sym)
        else
          [:routes, :controllers]
        end
    end
  end
end
