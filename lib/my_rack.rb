require 'rack'

app = Proc.new do |env|
  ['200', {'Content-type' => 'text/html'}, ['A barebone rack app.']]
end

Rack::Handler::WEBrick.run(app, Port: 3000)
