-- ============================================================
-- Camada "história" (biografia longa do guia) + tipo "receita"
-- (comida ritualística/oferenda) pra tabela conteudos.
--
-- Por quê separado dos Itans: Itans são contos avulsos (já
-- existiam via conteudos.tipo = 'conto'). "história" aqui é o
-- texto único e mais longo de apresentação do guia — origem,
-- arquétipo, características — que fica fixado no topo do
-- detalhe do guia, antes da lista de conteúdos.
-- ============================================================

-- 1) Nova coluna em guias, pra biografia longa. Default null,
--    não quebra nada que já existe.
alter table guias
  add column if not exists historia text;

-- 2) conteudos.tipo é texto livre (sem enum/check constraint
--    identificado neste repo) — 'receita' já funciona sem
--    migration adicional. Se o seu ambiente tiver um check
--    constraint em conteudos.tipo, rode algo como:
--
--    alter table conteudos drop constraint conteudos_tipo_check;
--    alter table conteudos add constraint conteudos_tipo_check
--      check (tipo in ('ponto','oracao','conto','receita'));
--
--    (ajuste o nome da constraint pro que existir no seu banco)
