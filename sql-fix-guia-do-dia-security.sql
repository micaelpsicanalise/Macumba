-- ============================================================
-- Corrige o alerta de seguranca "Security Definer View" pra
-- public.guia_do_dia_hoje.
--
-- O que estava acontecendo: por padrao, uma view no Postgres roda
-- com os privilegios de quem CRIOU a view (o "definer"), nao de
-- quem esta consultando. Isso e irrelevante enquanto o dono da view
-- e quem consulta tem o mesmo acesso. Mas essa view provavelmente
-- foi criada por um papel com acesso amplo (postgres/service_role),
-- que ignora RLS. Entao, tecnicamente, ela podia contornar qualquer
-- RLS que exista em guias ou guia_do_dia.
--
-- Como essa view nao filtra por usuario (e o mesmo guia do dia pra
-- todo mundo, calculado so pelo dia da semana), o problema aqui era
-- teorico, nao um vazamento real identificado. Mesmo assim vale
-- corrigir: security_invoker faz a view rodar com o privilegio de
-- quem consulta, entao RLS volta a valer de verdade.
--
-- Ja conferido: guias e guia_do_dia tem policy de "leitura publica"
-- pra select, entao essa troca nao deve quebrar o "guia do dia" na
-- Home. Ainda assim, teste depois de rodar.
-- ============================================================

create or replace view public.guia_do_dia_hoje
with (security_invoker = true)
as
select
  g.id,
  g.slug,
  g.nome,
  g.categoria,
  g.linha,
  g.descricao,
  g.cor_tema,
  g.ordem,
  g.ativo,
  g.created_at
from guia_do_dia gd
join guias g on g.id = gd.guia_id
where gd.dia_semana = extract(dow from now())::integer;
