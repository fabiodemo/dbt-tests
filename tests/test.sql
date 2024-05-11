with
    vendas_comparacao_preco as (
        select
            f.venda_id,
            f.valor_venda,
            d.valor_sugerido,
            case
                when
                    f.valor_venda <= d.valor_sugerido
                    and f.valor_venda >= d.valor_sugerido * 0.95
                then true
                else false
            end as regra_respeitada
        from {{ ref("fct_vendas") }} f
        join {{ ref("dim_veiculos") }} d on f.veiculo_id = d.veiculo_id
    )

select venda_id, valor_venda, valor_sugerido
from vendas_comparacao_preco
where regra_respeitada = false
