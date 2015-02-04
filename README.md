# Parser

## Execution

Start a new IRB session:

    $ irb

Load the parser.rb

    > load 'parser.rb'

Initialize a new instance

    > parser = Parser.new

Parse the config file and save in a Hash

    > config_hash = parser.parse

Inspect each element you need

    > config_hash[:host]
    > config_hash[:server_id]
    > config_hash[:test_mode]

## Tests

Run bundle if you don't have latest rSpec installed

Then run

    $ rspec spec/spec_parser.rb
