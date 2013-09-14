# Comprehensible

Comprehensible is a way to build list comprehensions in Ruby.

### Is it a hack?

Of course.

### Ok, so what does it do?

You pass in some source enumerables with labels along with some filtering and
mapping lambdas, and you get an array back.

### How is the result built?

The filters are applied to their matching source in order, and the mappers are
composed based on their arguments and applied to the output of the filters.

If more than one enumerable is present prior to return, the results for each are
zipped together.

### Can I see a few examples?

Sure.

```ruby
# Square the even xs
Array.comprehension({x: 1..10}, [->(x) { x.even? }], [->(x) { x ** x }])
=> [4, 256, 46656, 16777216, 10000000000]

# Zip odd x and even y pairs
Array.comprehension({x: 1..10, y: 1..10}, [->(x) { x.odd? }, ->(y) { y.even? }], [])
=> [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10]]

# Solution to Euler 1 (http://projecteuler.net/problem=1)
Array.comprehension({x: 1...1000}, [->(x) { x % 3 == 0 || x % 5 == 0 }], []).reduce(:+)
=> 233168

# log2 growth
Hash[Array.comprehension({x: 1..1000, y: 1..1000}, [], [->(y) { Math.log2(y) }])]
=> {1=>0.0,
 2=>1.0,
 3=>1.584962500721156,
 [...]
 998=>9.96289600533726,
 999=>9.964340867792417,
 1000=>9.965784284662087}
```

### How can I play with this?

`gem install comprehensible`

Then you should be able to use it with

`require comprehensible`

### What are the limitations?

There are some (lots):

* Function argument names must match a key in the enums hash.
* Lambdas can only have a single argument, otherwise execution ordering is a headache.
* Filters are run before mappers, you can't filter using mappers either

:(
