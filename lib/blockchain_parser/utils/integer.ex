defmodule BlockchainParser.Parsers.Integer do

  def parse(<<0xFD, data :: short-unsigned-integer-length(16)>>) do
    data
  end

  def parse(<<0xFE, data :: short-unsigned-integer-length(32)>>) do
    data
  end

  def parse(<<0xFF, data :: unsigned-native-integer-size(64)>>) do
    data
  end

  def parse(<<data :: unsigned-integer-size(8)>>) do
    data
  end

  def parse_stream(<<0xFD, data :: short-unsigned-integer-length(16), remaining :: binary>>) do
    [data, remaining]
  end

  def parse_stream(<<0xFE, data :: short-unsigned-integer-length(32), remaining :: binary>>) do
    [data, remaining]
  end

  def parse_stream(<<0xFF, data :: unsigned-native-integer-size(64), remaining :: binary>>) do
    [data, remaining]
  end

  def parse_stream(<<data :: unsigned-integer-size(8), remaining :: binary>>) do
    [data, remaining]
  end

end