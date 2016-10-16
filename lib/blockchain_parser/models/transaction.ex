defmodule BlockchainParser.Models.Transaction do

  defstruct hsh: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32] Transactions computed hash 
            version: 1, # integer, Expected 1
            inputs_count: 0, # integer, Number of inputs for this transaction
            outputs_count: 0 # integer, Number of outputs for this transaction

end