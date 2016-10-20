defmodule BlockchainParser.Parsers.Block do

  import BlockchainParser.Utils.Integer

  defstruct magic_id: <<0xD9B4BEF9>>, # char[32], fix num of four bytes that marks start of a new block
            length: 0, # uint32_t, Blocks length
            version: 0, # uint32_t, Expected to be eq to 1, 2, 3 or 4
            prev_block: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32] Previous block hash
            mrkl_root: <<0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0>>, # char[32], Merkle tree for this block
            timestamp: 0, # uint32_t, When this block was created
            bits: 0, # uint32_t, The calculated difficulty target being used for this block
            nonce: 0, # uint32_t, Random number representing the proof of work for the mining of this block
            transactions_count: 0 # integer, Number of transaction entries in this block

  def parse(data)
	
	<<magic_id::"0xD9B4BEF9",
	  length::short-unsigned-integer-length(32),
	  version::short-unsigned-integer-length(32),
	  previous_block::size(32),
	  merkle_root::size(32),
	  timestamp::short-unsigned-integer-length(32),
	  bits::short-unsigned-integer-length(32),
	  nonce::short-unsigned-integer-length(32),
	  payload::binary>> = data

	transactions_count = Transactions.count

	%BlockchainParser.Parsers.Block {
      magic_id: magic_id,
      length: length,
      version: version,
      previous_block: previous_block,
      merkle_root: merkle_root,
      timestamp: timestamp,
      bits: bits,
      nonce: nonce,
      transaction_count: transaction_count
	}

  end


end