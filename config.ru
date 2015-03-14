require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  set :author,    'Ky'                                      # blog author
  set :title,     Dir.pwd.split('/').last                   # site title
  set :root,      "index"                                   # page to load on /
  set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
  set :markdown,  :smart                                    # use markdown + smart-mode
  set :disqus,    "blogsimplr"                              # disqus id, or false
  set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
  set :ext,       'txt'                                     # file extension for articles
  set :cache,     28800                                     # cache duration, in seconds
  set :twitter,   'kylescottmcgill'                         # Twitter Account
  set :sitetitle, 'Kyle Scott Mcgill'
  # set :to_html,     lambda {|path, page, ctx|
  #   ::Haml::Engine.new(File.read("templates/pages/#{page}.haml"), :format => :html5, :ugly => true).render(ctx)
  # }
  set :error do |code|                                      # The HTML for your error page
    "<font style='font-size:300%'>toto, we're not in Kansas anymore (#{code})</font>"
  end
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end

run toto