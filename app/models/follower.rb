class Follower
  # Get a follower's name, age and life motto
  attr_reader :name, :age, :life_motto

  # Keep track of all followers
  @@all = []

  # Create a new follower with a name, age and life motto
  def initialize(name:, age:, life_motto:)
    @name = name
    @age = age
    @life_motto = life_motto
    # Add the newly created follower to the list of all of the followers
    @@all << self
  end

  # Get all followers
  def self.all
    @@all
  end

  # Take a cult and have this follower join that cult
  def join_cult(cult)
    # Create a new blood oath that belongs to this follower and the cult we were given
    if age >= cult.minimum_age
      BloodOath.new(initiation_date: Time.now, follower: self, cult: cult)
    else
      diff = cult.minimum_age - self.age
      puts "Sorry, you're too young to pledge your soul to #{cult.name}!  Try again in #{diff} years!"
    end
  end

  # Get all bloodoaths this follower has made
  def blood_oaths
    # First, get all of the blood oaths and then from them, select only the ones that belong to this follower
    BloodOath.all.select { |blood_oath| blood_oath.follower == self }
  end

  # Get all cults that this follower is in
  def cults
    # First, get all of this follower's blood oaths and then for each one, return the cult that blood oath belongs to
    self.blood_oaths.map { |blood_oath| blood_oath.cult }
  end

  def my_cults_slogans
    cults.map{|cult|puts cult.slogan}
  end

  def follow_cult_members
    # find my current cults
    # map all followers from each of those cults
    # put all of those followers in one array (flatten)
    cults.map{|cult|cult.followers}.flatten.uniq
  end

  # Take an age and find all followers who are that age or older
  def self.of_a_certain_age(age)
    # First, get all of the followers, then select only the ones that have an age greater than or equal to the age given
    self.all.select { |follower| follower.age >= age }
  end

  # def self.all_by_cults
  #   # returns array wherein each element/person is an array of cults which each element/person belongs to
  #   all.map{|ppl|ppl.cults}
  # end

  # def self.cult_count
  #   # returns array of integers representing how many cults each follower is a part of
  #   # this isn't organized/sorted in a particular way
  #   # relies on the preceeding method
  #   all_by_cults.map{|grp|grp.count}
  # end

  def self.most_active
    # iterate through all followers and return each of their cults array
    # find .count of each array
    # find max_by for highest .count of cults for a follower
    # iterate back through all followers and return the follower with those cults
        # all_by_cults = self.all.map{|ppl|ppl.cults}
        # cult_count = all_by_cults.map{|grp|grp.count}
        # highest_cult_count = cult_count.sort[-1]
        # Follower.all.find{|ppl|ppl.cults.count==highest_cult_count}

    # could have also made instance method to return a follower's cult count
    # iterate over Follower.all cult count to find highest value
    # return follower instance whose value was highest
    
    # -- array.sort_by {|a|-a.count} --
    all.sort_by{|ppl|ppl.cults.count}[-1]
  end

  def self.top_ten
    all.sort_by{|ppl|-ppl.cults.count}.first(10)
  end
end
