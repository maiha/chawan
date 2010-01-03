module Chawan
  module Commands
    def parse(text)
      analyzer.parse(text)
    end
  end
end

module Chawan
  extend Commands
end
