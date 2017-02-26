require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/job-simulation'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Test Terrible Company" do

  describe "job simulation implementation" do
    it "creates a JobSimulation" do
      q = JobSimulation.new(6,10)
      q.class.must_equal JobSimulation
    end

    it "begins with a number of workers equal to the number of jobs available" do
      q =JobSimulation.new(6,10)
      q.workers.size.must_equal 6
    end

    it "begins with waiting list equal to the number of available workers left after jobs available are filled" do
      q =JobSimulation.new(6,10)
      q.waiting.size.must_equal (10-6)
    end
  end

  describe "Cycle" do

    describe "roll" do
      it "generates an integer from 1 to 6" do
        q =JobSimulation.new(6,10)
        q.cycle
        (1..6).must_include(q.roll)
      end
    end

    it "removes a number of people off the worker list, and then moves that same number of people from the waitlist to the worker list" do
      q =JobSimulation.new(1,10)
      q.cycle
      q.waiting.size.must_equal (10 - 1 - q.workers.size)
    end
  end
end
