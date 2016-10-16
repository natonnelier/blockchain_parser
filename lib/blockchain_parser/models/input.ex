defmodule BlockchainParser.Models.Input do

  defstruct hsh: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32], Transactions computed hash
  			prev_transaction: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32], Hash from a prev transactions
            index: <<0xFFFFFFFF>>, # uint32_t, The output from prev transaction from wich money will be spent
            script_length: 0, # integer, Length for script
            script: <<>> # Used by miners for validation

end