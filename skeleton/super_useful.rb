# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    "No more caffeine!, please try again"
  end
end 

class NotAFruitError < StandardError
  def message
    "That is not a fruit! I am leaving"
  end
end 

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee" 
    raise CoffeeError
  else
    raise NotAFruitError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin 
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue NotAFruitError => e
    puts e.message 
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("years known must be greater than or equal to 5") if yrs_known.to_i < 5
    raise ArgumentError.new("name cannot be blank, please enter a valid name") if name.empty?
    raise ArgumentError.new("fav_pastime cannot be blank, please enter a valid fav_pastime") if fav_pastime.empty?
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known} years."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


