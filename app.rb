require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_organizer')
require('pry')


get('/') do
  @cds = CD.all()
  erb(:index)
end

post('/mycd') do
  album = params.fetch('album')
  artist = params.fetch('artist')
  @newcd = CD.new({:album =>album, :artist => artist})
  @newcd.save()
  @cds = CD.all()
  erb(:index)
end
get('/artist') do
  @search_artist = params.fetch("search_artist")
  @cds = CD.all()
  erb(:artist)
end

get('/mycd/:id') do
  @foundcd = CD.find(params.fetch("id"))
  erb(:mycd)
end

get("/clear") do
  @cds = CD.all()
  @cds.clear()
  erb(:index)
end
