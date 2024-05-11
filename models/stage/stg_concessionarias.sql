{{ config(materialized="view") }}
with
    source as (
        select
            id_concessionarias,
            trim(concessionaria) as nome_concessionaria,
            id_cidades,
            data_inclusao,
            coalesce(data_atualizacao, data_inclusao) as data_atualizacao
        from {{ source("sources", "concessionarias") }}
    )

select
    id_concessionarias, nome_concessionaria, id_cidades, data_inclusao, data_atualizacao
from source
