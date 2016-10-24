defmodule BlockchainParser.Parsers.Transaction do

  defstruct hsh: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32] Transactions computed hash 
            version: 1, # integer, Expected 1
            inputs: [], # array of inputs
            outputs: [], # array of outputs
            lock_time: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32] Currently always 0


  def parse(data)
	
	<<version :: unsigned-little-integer-size(32), payload :: binary>> = data

	transactions_count = Transactions.count

	[tx_in_count, payload] = Integer.parse_stream(payload)

    [transaction_inputs, payload] = Enum.reduce(1..tx_in_count, [[], payload], fn (_, [collection, payload]) ->
      [element, payload] = TransactionInput.parse_stream(payload)
      [collection ++ [element], payload]
    end)

    [tx_out_count, payload] = Integer.parse_stream(payload)

    [transaction_outputs, payload] = Enum.reduce(1..tx_out_count, [[], payload], fn (_, [collection, payload]) ->
      [element, payload] = TransactionOutput.parse_stream(payload)
      [collection ++ [element], payload]
    end)

    <<lock_time::unsigned-little-integer-size(32)>> = payload

    %BlockchainParser.Parsers.Transaction{
      version: version,
      inputs: transaction_inputs,
      outputs: transaction_outputs,
      lock_time: lock_time
	}

  end

end