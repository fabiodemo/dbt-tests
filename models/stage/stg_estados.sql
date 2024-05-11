{{ config(materialized='view) }}
with
    source as (
        select
            id_estados,
            upper(estado) as estado,
            upper(sigla) as sigla,
            data_inclusao,
            data_atualizacao
        from {{ source("sources", "estados") }}
    )

select id_estados, estado, sigla, data_inclusao, data_atualizacao
from source
