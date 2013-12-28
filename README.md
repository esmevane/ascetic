# Ascetic

Ascetic is a basic tool to interact with JSON or YAML configuration files.

## Installation

Place this in your `Gemfile`:

```ruby
gem 'ascetic'
```

Then `bundle install`.

## Usage

```ruby
require 'ascetic'

# Yaml files:
Ascetic.load! '/path/to/config.yml'

# Json files:
Ascetic.load! '/path/to/config.json'
```

Ascetic will marshal the files and expose the options as methods.  For example, if your `config.json` looks like this:

```json
{
  "api_key": "ec_fn_11h5bseljre35x"
}
```

You will have the `api_key` method and a special `api_key?` presence check method available on your Ascetic object, like so:

```ruby
Ascetic.api_key?
# => true

Ascetic.api_key
# => "ec_fn_11h5bseljre35x"
```

Any value set to `false`, or value which is not present in your configuration file, will result in `false` when a presence check is run.

```ruby
Ascetic.option_not_present_in_config?
# => false

Ascetic.option_not_present_in_config
# => nil

Ascetic.option_set_to_false_in_config?
# => false

Ascetic.option_set_to_false_in_config
# => false
```
