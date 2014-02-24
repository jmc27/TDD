#Jonathan Chu
#Circle class

require_relative "Point"
require 'minitest/autorun'

class Circle
	attr_accessor :center, :radius
	def initialize center, radius
		if center.class == Point
			@PI = 3.1415
			@center = center
			@radius = radius.to_f
		else
			puts "invalid input"
		end
	end

	#returns area of a circle
	def area
		return @PI * @radius ** 2
	end
	#checks if circle is valid
	def valid?
		area != 0
	end
end

describe "Circle" do 
	before do
		@a_circle = Circle.new(Point.new(3, 3), 3)
	end

	it "creates valid circle" do
		@a_circle.valid?.must_equal true
	end

	it "calculates area correctly" do
		@a_circle.area.round(2).must_equal 28.27
	end
end