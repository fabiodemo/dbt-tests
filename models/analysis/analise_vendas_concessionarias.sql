{{ config(materialized="table") }}
select
    con.concessionaria_id as id,
    con.nome_concessionaria as concessionaria,
    cid.nome_cidade as cidade,
    est.nome_estado as estado,
    count(v.venda_id) as quantidade,
    sum(v.valor_venda) as total,
    avg(v.valor_venda) as valor_medio
from {{ ref("fct_vendas") }} v
join {{ ref("dim_concessionarias") }} con on v.concessionaria_id = con.concessionaria_id
join {{ ref("dim_cidades") }} cid on con.cidade_id = cid.cidade_id
join {{ ref("dim_estados") }} est on cid.estado_id = est.estado_id
group by
    con.concessionaria_id, con.nome_concessionaria, cid.nome_cidade, est.nome_estado
order by total desc
