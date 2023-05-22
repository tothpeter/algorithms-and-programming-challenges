# FlexLogger

It is a flexible logging mechanism built on top of the Rails logger. It allows you to log multiple arguments in any order, combining them into a single line log message. Additionally, it supports special arguments such as exceptions and Loan objects.

## Special Arguments

It provides support for special arguments:

- __Exception__: You can pass a single exception as an argument, and FlexLogger will log its message and backtrace as the last part of the log line.
- __Loan object__: When passing a Loan object, FlexLogger extracts its reference ID and uses it as an extra namespace in the log message.


## Versions

The v1 verion is what I developed for a previous project and which is still in use after many years.
I think it is a good enough solution.

The v2 version is more like done by the book.

## Usage

You can use FlexLogger by either creating an instance with a namespace or directly calling its class methods.

The `info` and `error` methods are all variadic, meaning you can pass them any number of arguments in any order.
You can access them on the `FlexLogger` class or on an instance of it.

Use the class methods if you don't need a namespace and the instance methods if you do.

### With a namespace

When creating an instance, you can provide an optional `namespace` parameter, which will be included in log messages to distinguish the origin or context of the log entries.

```ruby
# namespace is optional
flex_logger = FlexLogger.new('namespace')

exception = StandardError.new('Error message')

flex_logger.info('Log message', { a: 1, b: 2 }, exception)

# It will log
# '[namespace] Log message | {:a=>1, :b=>2} | StandardError: Error message'
```

### Without a namespace

The `FlexLogger` class provides class methods `info` and `error` for convenience.

```ruby
FlexLogger.info('Log message')

# It will log
# Log message
```

### Logging Methods

The `FlexLogger` class provides the following logging methods:
- `info`
- `error`

It's important to note that the logging methods forward the log calls to the Rails.logger, so the actual logging behavior will depend on the underlying Rails configuration.
