require_relative '../config/environment'

MY_LOGIN = "danielchangnyc"
MY_PASSWORD = "github55"

client = Octokit::Client.new \
  :login => MY_LOGIN,
  :password => MY_PASSWORD

user_repos = client.list_repos.collect do |repo|
  repo.name
end

puts "PUBLIC REPOSITORIES FOR FLATIRON SCHOOL"
puts "================================================"

org_private_repos = client.org_repos('flatiron-school', {:type => 'private'}).each do |repo|
  puts "#{repo.name} was created at #{repo.created_at}"
end

puts "\n"
puts "\n"
puts "PRIVATE REPOSITORIES FOR FLATIRON SCHOOL"
puts "================================================"

org_repos = client.org_repos('flatiron-school', {:type => 'public'}).each do |repo|
  puts "#{repo.name} was created at #{repo.created_at}"
end
