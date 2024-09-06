{{
  config(
    tags = ['prod_exclude'],
    schema = 'aave_v3_scroll',
    alias = 'base_supply',
    materialized = 'incremental',
    file_format = 'delta',
    incremental_strategy = 'merge',
    unique_key = ['transaction_type', 'token_address', 'tx_hash', 'evt_index'],
    incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
  )
}}

{{
  lending_aave_v3_compatible_supply(
    blockchain = 'scroll',
    project = 'aave',
    version = '3',
    decoded_contract_name = 'L2Pool'
  )
}}
