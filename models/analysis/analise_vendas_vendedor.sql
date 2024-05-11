{{ config(materialized="table") }}
select
    ven.vendedor_id as id,
    ven.nome_vendedor as vendedor,
    nome_concessionaria as concessionaria,
    count(v.venda_id) as quantidade,
    sum(v.valor_venda) as total,
    avg(v.valor_venda) as valor_medio
from {{ ref("fct_vendas") }} v
join {{ ref("dim_vendedores") }} ven on v.vendedor_id = ven.vendedor_id
join {{ ref("dim_concessionarias") }} c on c.concessionaria_id = ven.concessionaria_id
group by ven.vendedor_id, ven.nome_vendedor, c.nome_concessionaria
order by total desc
