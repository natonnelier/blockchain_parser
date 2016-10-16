defmodule BlockchainParser.Models.Output do

  defstruct hsh: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32], Transactions computed hash
            prev_transaction: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32], Hash from a prev transactions
            value: 0, # uint32_t, Transactions value in satoshis
            script_length: 0, # integer, Length for script
            script: <<>> # Used by miners for validation

end