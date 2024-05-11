{{ config(materialized="view") }}
with
    source as (
        select
            id_clientes,
            initcap(client) as cliente,
            trim(endereco) as endereco,
            id_concessionarias,
            data_inclusao,
            coalesce(data_atualizacao, data_inclusao) as data_atualizacao
        from {{ source("sources", "clientes") }}
    )

select
    id_clientes, cliente, endereco, id_concessionarias, data_inclusao, data_atualizacao
from source
