# Simple Form Recurring Select

[![Build Status](https://travis-ci.org/tomasc/simple_form_recurring_select.svg)](https://travis-ci.org/tomasc/simple_form_recurring_select) [![Gem Version](https://badge.fury.io/rb/simple_form_recurring_select.svg)](http://badge.fury.io/rb/simple_form_recurring_select) [![Coverage Status](https://img.shields.io/coveralls/tomasc/simple_form_recurring_select.svg)](https://coveralls.io/r/tomasc/recurring_select)

Wrapper around the [recurring_select](https://github.com/GetJobber/recurring_select) gem for Simple Form.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_form_recurring_select'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_form_recurring_select

## Usage

In model:

```ruby
  class MyModel
    include SimpleFormRecurringSelect::HasRecurrenceRule
    has_recurrence_rule

    def recurrence_rule
      @recurrence_rule ||= schedule.recurrence_rules.first
    end

    private

    def update_schedule
      self.schedule = IceCube::Schedule.new(schedule.start_time) do |s|
        s.add_recurrence_rule(@recurrence_rule) if @recurrence_rule.present?
      end
    end
  end
```

This will setup `recurrence_rule` accessor that converts JSON coming from a form to [IceCube::Rule](https://github.com/seejohnrun/ice_cube). The logic of adding the recurrence rule to a schedule is left up to you.

In forms:

```ruby
  = form.input :recurrence_rule, as: :recurring_select
```

## Configuration

Accessor & schedule accessor / method names can be configured as follows:

```ruby
  class MyModel
    include SimpleFormRecurringSelect::HasRecurringSelect
    has_recurring_select accessor_name: :my_recurrence_rule
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/tomasc/simple_form_recurring_select/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
