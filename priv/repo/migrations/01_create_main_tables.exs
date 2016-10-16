defmodule Ectoo.Repo.Migrations.CreateMainTables do
  use Ecto.Migration

  def change do
    create table(:blocks) do
      add :hsh, :text, null: false
      add :length, :bigint
      add :height, :bigint
      add :prev_block, :text, null: false
      add :mrkl_root, :text
      add :time, :timestamp, null: false
      add :bits, :bigint
      add :nonce, :bigint
      add :transactions_count, :integer
    end


    create table(:transactions) do
      add :block_id, :integer
      add :hsh, :text, null: false
      add :version, :bigint
      add :inputs_count, :integer
      add :outputs_count, :integer

      timestamps
    end

    create table(:inputs) do
      add :transaction_id, :integer
      add :hsh, :text, null: false
      add :index, :bigint, null: false
      add :script, :bytea, null: false
      add :position, :integer

      timestamps
    end

    create table(:outputs) do
      add :transaction_id, :integer
      add :hsh, :text, null: false
      add :amount, :bigint, null: false
      add :script, :bytea, null: false

      timestamps
    end

    create index :blocks, [:hsh]
    create index :transactions, [:hsh]
    create index :inputs, [:hsh]
    create index :outputs, [:hsh]

    #create unique_index(:translations, [:translatable_id, :translatable_type, :locale, :field])

  end
end