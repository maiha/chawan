
require 'spec'
require 'rr'

require File.join(File.dirname(__FILE__), '/../lib/chawan')

def data(key)
  path = File.join(File.dirname(__FILE__) + "/fixtures/#{key}")
  File.read(path){}
end
