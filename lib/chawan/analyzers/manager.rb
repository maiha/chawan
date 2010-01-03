module Chawan
  module Analyzers
    module Manager
      def analyzers
        @analyzers ||= {}
      end

      def analyzer(name = nil)
        name ? analyzer_for(name) : current_analyzer
      end

      def analyzer_for(name)
        analyzers[name.to_s] or raise AnalyzerNotFound, name.to_s
      end

      def current_analyzer
        @analyzer or raise AnalyzerNotSetup
      end

      def define_analyzer(name, analyzer)
        analyzers[name] = analyzer

        unless respond_to?(name)
          eval(<<-RUBY)
            def Chawan.#{name}
              Chawan['#{name}']
            end
          RUBY
        end
      end

      def setup(name, setter = nil)
        define_analyzer(name.to_s, setter) if setter
        @analyzer = analyzer_for(name)
      end

      def [](name)
        analyzer_for(name)
      end
    end
  end
end

