
module Chawan
  module Analyzers
    class ChasenAnalyzer < AbstractAnalyzer
      Fields = []

      def parse(text)
        lines = execute(text).split(/\n/)
        lines.pop == "EOS" or              # "EOS"
          raise CannotAnalyze
        return lines.map{|line| instantiate(line, self.class::Fields)}
      end

      private
        def execute(text)
          require 'chasen'
#    format = %w[%m %y %M %Y %h %P- %t %T- %f %F- %?U/unknown/known/].join("\t") + "\t\n"
          Chasen.getopt('-i', 'w')
          Chasen.sparse(text)
        end

        def instantiate(line, fields)
        end
    end
  end
end

