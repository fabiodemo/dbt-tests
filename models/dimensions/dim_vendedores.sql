{{ config(materialized="table") }}
select
    id_vendedores as vendedor_id,
    nome_vendedor,
    id_concessionarias as concessionaria_id,
    data_inclusao,
    data_atualizacao
from {{ ref("stg_vendedores") }}
