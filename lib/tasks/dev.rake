
namespace :dev do
	desc "Rebuild system"
	task :build => ["tmp:clear", "log:clear", "db:drop","db:create","db:migrate"]
	task :rebuild => ["dev:build","db:seed"]
	task :fake => :environment do 
  	require 'populator'
  	require 'faker'

  	[User, Group, Post].each(&:delete_all)
  	Group.populate 5 do |groups|
  	  groups.title = Populator.words(1..3).titleize
  	  Post.populate 1..4 do |posts|
        posts.content = Populator.sentences(2..10)
        posts.created_at = 2.years.ago..Time.now
  	  end
  	end
  	User.populate 5 do |users|

  	  users.name = Faker::Name.name
  	  users.encrypted_password = Populator.words(1).titleize
  	  
  	  users.sign_in_count = "1"
  	  users.email = Faker::Internet.email
  	end
  end
end

