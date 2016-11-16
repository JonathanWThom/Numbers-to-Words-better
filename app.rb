require('sinatra')
require('sinatra/reloader')
require('./lib/numbers_to_words')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/number') do
  @number = params.fetch('number').to_i.numbers_to_words()
  erb(:number)
end
