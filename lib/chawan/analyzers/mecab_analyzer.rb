require 'tempfile'
require File.dirname(__FILE__) + '/chasen_analyzer'

module Chawan
  module Analyzers
    class MecabAnalyzer < ChasenAnalyzer
      Fields = "表層形\t品詞,品詞細分類1,品詞細分類2,品詞細分類3,活用形,活用型,原形,読み,発音".split(/,|\s/)

      class Node < Chawan::Node
        # not used yet
      end

      private
        def instantiate(line, fields)
          Node.new(line.split(/,|\s/), fields)
        end

        def execute(text)
          transaction(text) do |tmp|
            `mecab #{tmp.path}`
          end
        end

        def transaction(buffer, &block)
          tmp = Tempfile.new("mecab-text")
          tmp.print(buffer)
          tmp.close
          block.call(tmp)
        ensure
          tmp.close(true)
        end
    end
  end
end

