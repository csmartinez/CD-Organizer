require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_organizer')
require('pry')
#require('.lib/artists')


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
  # id = params.fetch("cd_id").to_i
  # @cd= CD.find(id)
  # @cd.add_newcd(@newcd)
  erb(:index)
end

get('/mycd/:id') do
  @foundcd = CD.find(params.fetch("id"))
  erb(:mycd)
end
