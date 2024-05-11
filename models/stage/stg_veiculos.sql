{{ config(materialized="view") }}
with
    source as (
        select
            id_veiculos,
            nome,
            tipo,
            valor::decimal(10, 2) as valor,
            coalesce(data_atualizacao, current_timestamp()) as data_atualizacao,
            data_inclusao
        from {{ source("sources", "veiculos") }}
    )

select id_veiculos, nome, tipo, valor, data_atualizacao, data_inclusao
from source
