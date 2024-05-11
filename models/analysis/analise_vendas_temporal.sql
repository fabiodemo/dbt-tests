{{ config(materialized="table") }}
select
    date_trunc('month', v.data_venda) as mes_venda,
    count(v.venda_id) as numero_vendas,
    sum(v.valor_venda) as total_vendas,
    avg(v.valor_venda) as valor_medio_venda
from {{ ref("fct_vendas") }} v
group by date_trunc('month', v.data_venda)
order by mes_venda
