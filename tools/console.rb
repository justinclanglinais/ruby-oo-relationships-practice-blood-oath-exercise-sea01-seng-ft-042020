require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Create some data to test with
cult1 = Cult.new(name: "Cult of Joe", location: "London", founding_year: 2020, slogan: "All hail Joe")
cult2 = Cult.new(name: "Cult of Cthulhu", location: "Underwater", founding_year: 1928, slogan: "Giant eldritch horrors from other dimensions are awesome")
cult3 = Cult.new(name: "Cool Cult", location: "Hull", founding_year: 1988, slogan: "Please join my cult, I'm really lonely :(")

follower1 = Follower.new(name: "Timmy O' Toole", age: 20, life_motto: "Somebody please - tell me what to think!!!")
follower2 = Follower.new(name: "Sally Smith", age: 19, life_motto: "Decisions are hard!!!")
follower3 = Follower.new(name: "Justin Langlinais", age: 36, life_motto: "It's tape.")
follower4 = Follower.new(name: "Lucy Langlinais", age: 12, life_motto: "Gimme' food!")
follower5 = Follower.new(name: "Sarah Baker", age: 30, life_motto: "Don't sit still!")
follower6 = Follower.new(name: "Ashton Ellis", age: 34, life_motto: "I'm perfect and handsome and smart.")
follower7 = Follower.new(name: "Joe Peterson", age: 40, life_motto: "Grotcha'!")
follower8 = Follower.new(name: "Pam Peterson", age: 40, life_motto: "Aaaiiinndd...")
follower9 = Follower.new(name: "Keenan Cornelius", age: 28, life_motto: "The lapel is king.")
follower10 = Follower.new(name: "JT Torres", age: 29, life_motto: "Hard work pays off.")
follower11 = Follower.new(name: "Brian J. Johnson", age: 47, life_motto: "Perfect practice makes perfect.")
follower12 = Follower.new(name: "Harris Richardson", age: 35, life_motto: "For sure.")
follower13 = Follower.new(name: "Tisdale Fry", age: 32, life_motto: "They're from Paris.")

# Create some relationships between the instances we've created for testing - we now have one cult with two followers, one cult with only one follower and one cult with no followers at all :(
cult1.recruit_follower(follower13)
cult1.recruit_follower(follower1)
cult1.recruit_follower(follower6)
cult1.recruit_follower(follower7)
cult1.recruit_follower(follower12)

cult2.recruit_follower(follower4)
cult2.recruit_follower(follower5)
cult2.recruit_follower(follower10)
cult2.recruit_follower(follower11)
cult2.recruit_follower(follower12)

cult3.recruit_follower(follower8)
cult3.recruit_follower(follower3)
cult3.recruit_follower(follower9)
cult3.recruit_follower(follower6)
cult3.recruit_follower(follower2)
cult3.recruit_follower(follower12)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
