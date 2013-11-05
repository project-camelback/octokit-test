require_relative '../config/environment'

MY_LOGIN = "danielchangnyc"
MY_PASSWORD = "github55"

client = Octokit::Client.new \
  :login => MY_LOGIN,
  :password => MY_PASSWORD

user = client.user

first_gist_filename = user.rels[:gists].get.data[1].attrs[:files].attrs.values.first.attrs[:filename]
first_gist_content = user.rels[:gists].get.data[1].attrs[:files].attrs.values.first.rels[:raw].get.data

puts first_gist_filename
puts first_gist

# binding.pry