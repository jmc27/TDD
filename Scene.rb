#Jonathan Chu
#Scene class

require_relative "Rectangle"
require_relative "Triangle"
require_relative "Circle"
require 'minitest/autorun'

class Scene
	attr_accessor :shapes
	
	def initialize
		@shapes = []
	end

	#returns the number of shapes in the scene
	def shape_count
		return @shapes.length
	end

	#sum of all the areas
	def total_area
		area = 0
		shapes.each do |shape|
			area = area + shape.area
		end
		return area
	end

	#add shape to scene
	def add_shape shape
		if shape.class == Rectangle or shape.class == Triangle or shape.class == Circle
			@shapes.push shape
		else
			puts "Not a shape"
		end
	end

	#removes a shape from the scene
	def remove_shape
		@shapes.delete_at(0)
	end
end

describe "Scene" do
	before do
		@a_scene = Scene.new
		@a_rectangle = Rectangle.new(Point.new(3, 3), Point.new(4, 4))
		@a_triangle = Triangle.new(Point.new(15,15), Point.new(23, 30), Point.new(50, 25))
		@a_circle = Circle.new(Point.new(3, 3), 3)
	end

	it "adds shapes properly" do
		@a_scene.add_shape @a_rectangle
		@a_scene.shapes.length.must_equal 1
		@a_scene.shapes[0].must_equal @a_rectangle
	end

	it "counts shapes properly" do
		@a_scene.add_shape @a_rectangle
		@a_scene.add_shape @a_triangle
		@a_scene.shape_count.must_equal 2
	end

	it "calculates total area properly" do
		@a_scene.add_shape @a_rectangle
		@a_scene.add_shape @a_triangle
		@a_scene.add_shape @a_circle
		@a_scene.total_area.must_equal(@a_rectangle.area + @a_triangle.area + @a_circle.area)
	end

	it "removes a shape properly" do
		@a_scene.add_shape @a_rectangle
		@a_scene.add_shape @a_triangle
		@a_scene.add_shape @a_circle
		@a_scene.remove_shape.must_equal @a_rectangle
	end
end