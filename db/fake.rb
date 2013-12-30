require "populator"

User.populate(10) do |person|
  person.name = "John"
  
end