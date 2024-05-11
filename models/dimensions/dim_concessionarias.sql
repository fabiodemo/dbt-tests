{{ config(materialized="table") }}
select
    id_concessionarias as concessionaria_id,
    nome_concessionaria,
    id_cidades as cidade_id,
    data_inclusao,
    data_atualizacao
from {{ ref("stg_concessionarias") }}
