require './lib/Stack.rb'
require './lib/Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll

  def initialize (jobs_available, job_seekers)
    @waiting = Queue.new
    job_seekers.times {|n|
      @waiting.enqueue("Worker ##{n+1}")
    }

    @workers = Stack.new
    jobs_available.times {
      @workers.push(@waiting.dequeue)
    }

    @roll = 0
  end


  def cycle
    @roll = rand(1..6) #assuming a six-sided die
    @roll.times {
      @workers.pop
    }
    @roll.times {
      @workers.push(@waiting.dequeue)
    }
  end

end


# ## Allows us to run our code and see what's happening:
# sim = JobSimulation.new(6,10)
# puts "------------------------------"
# puts "Before the simulation starts"
# puts "Employed: #{sim.workers}"
# puts "Waitlist: #{sim.waiting}"
# puts "------------------------------"
# print "<enter to cycle>\n"
#
# count = 0
# until gets.chomp != ""
#   puts "-------Cycle #{count+=1}-------"
#   sim.cycle
#   puts "Employed: #{sim.workers}"
#   puts "Waitlist: #{sim.waiting}"
# end
