# Ditch

Just adding a few bits and peaces onto the [Creek](https://github.com/pythonicrubyist/creek) Ruby gem.
Nothing major just small things to make using the gem a bit more convenient, for my use anyway.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ditch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ditch

## Usage

```ruby
require 'ditch'

begin
  book = Ditch::Book.new 'resources/testing.xlsx'
  
  # Reading all data 
  sheet = book.sheet(0)
  sheet.rows.each { |r|
    puts "#{r.index} #{r.get('A')} - #{r.get('b')}"
  }
 
  # Process first row as Headers
  sheet = book.sheet(0, :first_row_is_header=>true)
  sheet.rows.each { |r|
    puts "#{r.lookup('Name')} is #{r.lookup('Age')} years old"
  }

rescue StandardError => e
  $stderr.puts(e.message)
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thorsager/ditch. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

