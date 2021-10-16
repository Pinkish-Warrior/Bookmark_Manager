require 'rack'
require_relative './app'

run BookmarkManager

class HelloRack

  def call(*)
    [200, { "Content-Type" => "text/html" }, ["Hello Rack!"]]
  end

end

run HelloRack.new
