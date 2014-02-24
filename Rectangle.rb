#Jonathan Chu
#Rectange class

require_relative "Point"
require 'minitest/autorun'

class Rectangle
	attr_accessor :point1, :point2, :area
	def initialize point1, point2
		if point1.class == Point && point2.class == Point
			@point1 = point1
			@point2 = point2
		else
			puts "invalid input type"
		end
	end
	#returns the area of the rectangle in square meters
	def area
		x = @point1.x - @point2.x
		y = @point1.y - @point2.y
		return x.abs * y.abs
	end

	def valid?
		area != 0
	end
end

#tests
describe "Rectangle" do
	before do 
		@a_rectangle = Rectangle.new(Point.new(3,3), Point.new(4, 4))
	end

	it "creates valid rectangle" do
		@a_rectangle.valid?.must_equal true
	end

	it "correct area calculation" do
		@a_rectangle.area.must_equal 1
	end
end