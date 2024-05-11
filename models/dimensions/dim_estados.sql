{{ config(materialized="table") }}
select
    id_estados as estado_id,
    estado as nome_estado,
    sigla,
    data_inclusao,
    data_atualizacao
from {{ ref("stg_estados") }}
