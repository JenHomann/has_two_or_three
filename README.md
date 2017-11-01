# About has_two_or_three

The most important thing to remember when using this gem is that it is pronounced as if you're asking a question and you're not really sure how many child records you'll need. So, "has two or three?" ... and throw in a bit of a shrug for good measure. Here, Elmo will demonstrate:

![](https://media.giphy.com/media/jPAdK8Nfzzwt2/giphy.gif?response_id=591f38c1bf7cf91970c7adc7)

Also, it should be clear that this gem is a joke. It was designed for me to learn how to build and publish a gem. It isn't entirely practical, except for the incredibly rare instance in which your application needs an object to have exactly two or three child objects ... in which case, please feel free to use this gem. But note: it is not yet tested, mostly because that was not a part of what I was trying to learn. But I'll get to that at some point. Or you can submit a PR if you _really_ want to write some tests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'has_two_or_three'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install has_two_or_three

## Usage

Once you've installed the gem, set up your has_two_or_three association just as you would any other. Any optional arguments will be configured as expected.

```ruby
class Parent < ActiveRecord::Base
  has_two_or_three :children, inverse_of: :parents, dependent: :destroy
end

class Child < AciveRecord::Base
  belongs_to :parent, inverse_of: :children
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/has_two_or_three. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

