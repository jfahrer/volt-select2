# Volt::Select2

Simple wrapper to use select2 with Volt

## Installation

Add this line to your application's Gemfile:

    gem 'volt-select2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install volt-select2

## Usage

Initialize a select2 field:
```
<:select2:field include_blank="true" placeholder="Some placeholder" options="{{ ['test', 'test2'] }}" value="{{ params._selected }}" html_class="form-control">
```
* You can add a placeholder via the `placeholder` attr.
* The `include_blank` attr includes a blank field and adds the `allowClear` option to the select2 field
* `options` can either be an array or a hash (`Volt::Model`)
* `value` will be set to the selected option

For a select2 field with multiple option you can use the follow tag
```
<:select2:field:multiple placeholder="Some placeholder" options="{{ ['test', 'test2'] }}" value="{{ params._selected }}" html_class="form-control" />
```

## Contributing

1. Fork it ( http://github.com/jfahrer/volt-select2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
