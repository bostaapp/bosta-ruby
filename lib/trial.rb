require('./Bosta.rb')


Bosta.apiKey = '0c36b60063dc3e11fa4a099c78e108c455ca283a4c64c95320a381df3d8772ac'
Bosta.baseUrl = 'http://localhost:3000'
firstTrial = Bosta::Resource.send('get', 'deliveries/search', {}, {:pageLimit => 1})

puts firstTrial.body