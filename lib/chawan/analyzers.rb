
require File.dirname(__FILE__) + '/analyzers/manager'
require File.dirname(__FILE__) + '/analyzers/abstract_analyzer'

module Chawan
  extend Analyzers::Manager
end

Dir.glob( File.dirname(__FILE__) + '/analyzers/*_analyzer.rb' ).sort.each do |path|
  require path
end

module Chawan
  module Analyzers
    constants.sort.grep(/(.*?)Analyzer$/) do
      name  = $1.downcase
      klass = Chawan::Analyzers.const_get($&)
      next if name == 'abstract'
      Chawan.setup(name, klass.new)
    end
  end
end
 
