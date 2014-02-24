#Jonathan Chu
#Point class

require 'minitest/autorun'

class Point
	attr_accessor :x, :y
	def initialize x, y
		@x = x
		@y = y

	end
end


#tests
describe Point do 
	before do
		@a_point = Point.new(3, 4)
	end

	it "creates a valid point" do
		@a_point.valid?.must_equal true
	end
	
end