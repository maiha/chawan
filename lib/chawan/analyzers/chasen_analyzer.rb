
module Chawan
  module Analyzers
    class ChasenAnalyzer < AbstractAnalyzer
      # "%m\t%y\t%M\t%U(%P-)\t%\t%\n" # default format
      Format = "%m\t%P:\t%y\t\n"
      Fields = %w{ 見出し 品詞 読み }

      def parse(text)
        lines = execute(text).split(/\n/)
        lines.pop == "EOS" or              # "EOS"
          raise CannotAnalyze
        nodes = lines.map{|line| instantiate(line, self.class::Fields)}
        return Nodes.new(nodes)
      end

      private
        def execute(text)
          require 'chasen'
          Chasen.getopt('-i', 'w', '-F', self.class::Format)
          Chasen.sparse(text)
        end

        def instantiate(line, keys)
          vals = line.split(/,|\s/)
          vals[1] = vals[1].split(/:/).first # '名詞-副詞可能' -> '名詞'
          Node.new(vals, keys)
        end
    end
  end
end

