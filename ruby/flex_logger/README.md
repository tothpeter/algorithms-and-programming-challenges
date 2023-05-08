# Flex logger

It adds a flexible layer on top of the Rails logger.
You can pass it any number of arguments in any order and it will log them in a single line.

You can pass it one exception wich will be logged with its message and backtrace as the last part of the log line.

You can pass it a Loan object and it will use its reference ID as an extra namespace.

## Versions

The v1 verion is what I developed for a previous project and which is still in use.
I think it is a good enough solution.

The v2 version is morel like done by the book.

## Usage

```ruby
flex_logger = FlexLogger.new('namespace')

exception = StandardError.new('Error message')

flex_logger.info('Log message', { a: 1, b: 2 }, exception)

# It will log
# '[namespace] Log message | {:a=>1, :b=>2} | StandardError: Error message'
```
