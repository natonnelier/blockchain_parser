defmodule BlockchainParser.Models.Block do

  defstruct hsh: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32] Computed SHA256 hash of the 80 bytes version 
            length: 0, # uint32_t, Blocks length
            height: 0, # uint32_t, Blocks place in the blockchain
            prev_block: <<>>, # char[32] Previous block hash
            mrkl_root: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32], Merkle tree for this block
            time: 0, # uint32_t, When this block was created
            bits: 0, # uint32_t, The calculated difficulty target being used for this block
            nonce: 0, # uint32_t, Random number representing the proof of work for the mining of this block
            transactions_count: 0 # integer, Number of transaction entries in this block

  def parse(data)
	
	<<version::unsigned-little-integer-size(32),
	  previous_block::bytes-size(32),
	  merkle_root::bytes-size(32),
	  timestamp::unsigned-little-integer-size(32),
	  bits::unsigned-little-integer-size(32),
	  nonce::unsigned-little-integer-size(32),
	  payload::binary>> = data

  end


end