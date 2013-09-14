require File.expand_path('../../../lib/comprehensible', __FILE__)

describe :comprehension do
  it "should return its input as a list without modifiers" do
    Array.comprehension({x: 1..10}).should eq (1..10).to_a
  end

  it "should zip multiple enums correctly without modifiers" do
    Array.comprehension({x: 1..10, y: 1..99}).should eq (1..10).to_a.zip((1..99).to_a)
  end

  it "should filter non-matching values using filters" do
    Array.comprehension({x: 1..10}, [->(x) { x > 5 }, ->(x) { x < 7}]).should eq [6]
  end

  it "should modify applicable values with mapping operations" do
    Array.comprehension({x: 1..3}, [], [->(x) { x ** x }, ->(x) { x ** x }]).should eq [1, 256, 443426488243037769948249630619149892803]
  end

  it "should apply mapping operations to filtered values" do
    Array.comprehension({x: 1..10}, [->(x) { x.odd? }], [->(x) { x ** x }]).should eq [1, 27, 3125, 823543, 387420489]
  end
end
