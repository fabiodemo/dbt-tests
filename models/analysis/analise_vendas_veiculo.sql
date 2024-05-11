{{ config(materialized="table") }}
select
    vei.veiculo_id as id,
    vei.nome_veiculo as veiculo,
    vei.tipo as tipo,
    vei.valor_sugerido as valor_sugerido,
    count(v.venda_id) as quantidade,
    sum(v.valor_venda) as total,
    avg(v.valor_venda) as valor_medio
from {{ ref("fct_vendas") }} v
join {{ ref("dim_veiculos") }} vei on v.veiculo_id = vei.veiculo_id
group by vei.veiculo_id, vei.nome_veiculo, vei.tipo, vei.valor_sugerido
order by quantidade desc
