#Jonathan Chu
#Triangle class

require_relative "Point"
require 'minitest/autorun'

class Triangle
	attr_accessor :point1, :point2, :point3
	def initialize point1, point2, point3
		if point1.class == Point && point2.class == Point && point3.class == Point
			@point1 = point1
			@point2 = point2
			@point3 = point3
		else
			puts "Invalid input"
		end
	end

	#returns the area of the triangle
	def area
		area = @point1.x * (@point2.y - @point3.y) + @point2.x * (@point3.y - @point1.y) + @point3.x * (@point1.y - @point2.y)
		area = area / 2
		return area.abs
	end
	#checks if is a valid triangle
	def valid?
		area != 0
	end
end

describe "Triangle" do
	before do
		@a_triangle = Triangle.new(Point.new(15,15), Point.new(23, 30), Point.new(50, 25))
	end

	it "creates valid triangle" do
		@a_triangle.valid?.must_equal true
	end

	it "calculates area correctly" do
		@a_triangle.area.must_equal 222.5
	end
end