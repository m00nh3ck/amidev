require 'rubygems'
require 'sinatra'
require 'haml'
require 'net/smtp'
require 'pony'

# Helpers
require './lib/render_partial'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public, 'public'
set :haml, {:format => :html5} # default Haml format is :xhtml

# Application routes
get '/' do
  haml :index, :layout => :'layouts/application'
end

get '/portfolio' do
  haml :portfolio, :layout => :'layouts/page'
end

get '/contact' do
  haml :contact, :layout => :'layouts/page'
end

post '/contact' do
  name = params[:name]
  email = params[:email]
  subject = params[:subject]
  email_message = params[:email_message]
  Pony.mail(:to => 'rafal.zdziech@gmail.com', :from => email, :subject => subject, :body => email_message)

  haml :contact, :layout => :'layouts/page'

end


get '/blog' do
  haml :blog, :layout => :'layouts/page'
end

get '/about' do
  haml :about, :layout => :'layouts/page'
end
