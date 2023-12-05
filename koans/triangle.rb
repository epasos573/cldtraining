# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

  a, b, c = [a, b, c].sort
  raise TriangleError if a <= 0 || a + b <= c

  arr = [a, b, c]
  # Create new empty hash
  repeated_sides = Hash.new(0)

  # Iterate through each value in the array and store it to to a hash to find duplicates
  arr.each do |x|
    repeated_sides[x] += 1
  end

  # sort the hash by it's values in descending order, for logic to work later.
  repeated_sides = repeated_sides.sort_by {|k,v| v}.reverse.to_h

  # uncomment this below to see the duplicate sides hash
  #puts "#{repeated_sides}"

  # Iterate through the sorted hash, apply logic starting from highest and first value the iterator will find.

  # Try to use case switch

  #repeated_sides.each do |k,v|
  #  return v == 3 ? "equilateral".to_sym : v == 2 ? "isosceles".to_sym : "scalene".to_sym
  #end

  repeated_sides.each do |k,v|
    case v
    when 2
      return "isosceles".to_sym
    when 3
      return "equilateral".to_sym
    else
      return "scalene".to_sym
    end
  end



end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
