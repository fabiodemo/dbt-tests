{{ config(materialized="table") }}
select
    id_veiculos as veiculo_id,
    nome as nome_veiculo,
    tipo,
    valor as valor_sugerido,
    data_atualizacao,
    data_inclusao
from {{ ref("stg_veiculos") }}
