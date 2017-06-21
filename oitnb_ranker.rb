require 'sinatra'
enable :sessions

get '/' do
  erb :index
end

get '/all' do
  @list = get_file
  erb :all
end


Choices = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'CUR' => 'Curry',
  'NOO' => 'Noodles',
}

def get_file
  file = File.open('data', 'r')
  list = Marshal.load(File.read(file))
end