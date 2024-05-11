{{ config(materialized="view") }}
with
    source as (
        select
            id_vendas,
            id_veiculos,
            id_concessionarias,
            id_vendedores,
            id_clientes,
            valor_pago::decimal(10, 2) as valor_venda,
            data_venda,
            data_inclusao,
            coalesce(data_atualizacao, data_venda) as data_atualizacao
        from {{ source("sources", "vendas") }}
    )

select
    id_vendas,
    id_veiculos,
    id_concessionarias,
    id_vendedores,
    id_clientes,
    valor_venda,
    data_venda,
    data_inclusao,
    data_atualizacao
from source
