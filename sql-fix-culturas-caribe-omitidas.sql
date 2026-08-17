-- ============================================================
-- Corrige culturas afro-diaspóricas do Caribe/Américas que
-- ficaram classificadas em "Outras raízes" por falta de linhagem
-- cadastrada (Orisha/Trinidad, Palo Monte/Cuba, Kumina/Jamaica,
-- Lumbalú/Colômbia e possivelmente outras).
-- ============================================================

-- PARTE A — linhagem real (o fix "de verdade": nomeia a origem
-- exata, como o manifesto pede, em vez de só marcar um boolean).
-- Ajusta o `nome ilike` se algum desses títulos estiver escrito
-- diferente no seu banco.

insert into culturas_linhagem (cultura_id, origem_id, rota)
select c.id, o.id, 'trazida via tráfico negreiro, reconfigurada em Trinidad e Tobago'
from culturas c, culturas o
where c.nome ilike '%Orisha%Trinidad%' and o.nome ilike '%Nag%Iorub%'
on conflict (cultura_id, origem_id) do nothing;

insert into culturas_linhagem (cultura_id, origem_id, rota)
select c.id, o.id, 'trazida via tráfico negreiro, reconfigurada em Cuba'
from culturas c, culturas o
where c.nome ilike '%Palo Monte%' and o.nome ilike '%Banto%'
on conflict (cultura_id, origem_id) do nothing;

insert into culturas_linhagem (cultura_id, origem_id, rota)
select c.id, o.id, 'trazida via tráfico negreiro, reconfigurada na Jamaica'
from culturas c, culturas o
where c.nome ilike '%Kumina%' and o.nome ilike '%Banto%'
on conflict (cultura_id, origem_id) do nothing;

insert into culturas_linhagem (cultura_id, origem_id, rota)
select c.id, o.id, 'trazida via tráfico negreiro, reconfigurada no Palenque de San Basilio'
from culturas c, culturas o
where c.nome ilike '%Lumbal%' and o.nome ilike '%Banto%'
on conflict (cultura_id, origem_id) do nothing;

-- PARTE B — rede de segurança: qualquer OUTRA cultura cujo texto
-- já documenta origem africana forçada (bakongo, congo, iorubá,
-- jeje/fon, ashanti, escravizados) mas ainda não tem linhagem NEM
-- o fallback manual marcado. Isso não substitui a Parte A, é só
-- pra pegar o que não apareceu no seu print.

update culturas set raiz_africana = true
where raiz_africana is not true
  and not exists (
    select 1 from culturas_linhagem cl where cl.cultura_id = culturas.id
  )
  and (
    resumo ilike '%bakongo%' or resumo ilike '%iorub%' or resumo ilike '%jeje%'
    or resumo ilike '%fon %' or resumo ilike '%ashanti%' or resumo ilike '%escravizad%'
    or regiao_origem ilike '%bakongo%' or regiao_origem ilike '%iorub%'
    or regiao_origem ilike '%escravizad%'
  );

-- PARTE C — conferir o resultado (rode manualmente e olhe a lista;
-- qualquer coisa que passou batido, corrige na mão pelo admin).
-- select nome, continente, raiz_africana,
--   (select count(*) from culturas_linhagem cl where cl.cultura_id = culturas.id) as qtd_linhagens
-- from culturas
-- order by raiz_africana desc, nome;
