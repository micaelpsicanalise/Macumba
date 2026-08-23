-- ============================================================
-- Povos indígenas do Brasil, LOTE 27 de N.
--
-- Continuação dos lotes 1 a 26, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Vale do Paraíba (Puri) e o Vale do Mucuri, Minas Gerais
-- (Maxakali/Tikmũ'ũn).
--
-- Nota sobre Maxakali: a tradição oral liga o ritual Putuxop a
-- ancestrais que conviveram com grupos Pataxó no sul da Bahia,
-- mas a fonte não especifica qual grupo Pataxó exatamente (este
-- compêndio já tem dois cadastrados: Pataxó e Pataxó Hã-Hã-Hãe).
-- Preferi registrar isso em prosa a criar uma linhagem imprecisa
-- apontando pro Pataxó errado.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Puri',
    'puri',
    'Historicamente Vale do Paraíba e bacia do rio Doce, hoje dispersos entre Rio de Janeiro, Minas Gerais, São Paulo e Espírito Santo',
    'Declarados extintos por documentos oficiais já no início do século XIX, apagamento que pesquisadores do próprio povo apontam como conveniente às elites da época, já que justificava a ocupação de suas terras. Sem território reconhecido, vivem hoje o Movimento de Ressurgência Puri, reconstruindo língua, cantos e identidade a partir de memória familiar e pesquisa acadêmica. Sem aldeia física, se autodescrevem como "povo das nuvens", organizados majoritariamente online.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 79 from culturas)
  ),
  (
    'Maxakali (Tikmũ''ũn)',
    'maxakali-tikmuun',
    'Vale do Mucuri, nordeste de Minas Gerais, historicamente também sul da Bahia',
    'Autodenominam-se Tikmũ''ũn, "povo do canto". Os yãmiyxop, espíritos-cantores organizados em cerca de dez grandes grupos com duzentos subgrupos, visitam as aldeias em rituais que duram horas, recebidos com comida e dança ao redor da casa de religião (kuxex). Um desses rituais, o Putuxop, veio, segundo a tradição oral, de ancestrais que viveram ao lado de grupos Pataxó no sul da Bahia. O mito de criação tem Topa como figura central, que enviou um dilúvio ao se aborrecer com os homens.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 80 from culturas)
  )
on conflict (slug) do nothing;
