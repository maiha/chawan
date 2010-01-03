module Chawan
  module Analyzers
    class AbstractAnalyzer
      attr_reader :options

      def initialize(options = {})
        @options = options.dup.freeze
      end

      def parse(text)
        raise NotImplementedError, "#{self.class}#parse should be implemented"
      end
    end
  end
end
