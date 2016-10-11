require 'json'
file = File.read('contacts.json')
data_hash = JSON.parse(file)
puts(data_hash)