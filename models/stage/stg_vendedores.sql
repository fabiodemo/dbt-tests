{{ config(materialized="view") }}
with
    source as (
        select
            id_vendedores,
            initcap(nome) as nome_vendedor,
            id_concessionarias,
            data_inclusao,
            coalesce(data_atualizacao, data_inclusao) as data_atualizacao
        from {{ source("sources", "vendedores") }}
    )

select id_vendedores, nome_vendedor, id_concessionarias, data_inclusao, data_atualizacao
from source
