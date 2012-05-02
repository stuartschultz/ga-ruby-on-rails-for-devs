require 'rubygems'
require 'rack'

class WebServer
  def call(env)
    begin
      base_path = Dir.pwd + "/public"
      filename = env["PATH_INFO"]
        filename = "/index.html" if filename.length <= 1
      page_path = base_path + filename 
      File.open(page_path) do |page|
        page = page.read
        page_length = page.length.to_s
        page_type = Rack::Mime.mime_type(File.extname(page_path))
        [200, {"Content-Type" => page_type, "Content-Length" => page_length}, [page]]
      end # do
    rescue Errno::ENOENT => e # file not found exception
      [404, {"Content-Type" => "text/html"}, [e]] 
    rescue Exception => e # other errors
      [500, {"Content-Type" => "text/html"}, [e]] 
    end # rescues
  end # def call
end # class WebServer

Rack::Handler::Mongrel.run WebServer.new, :Port => 9292