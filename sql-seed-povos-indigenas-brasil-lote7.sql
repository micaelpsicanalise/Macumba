-- ============================================================
-- Povos indígenas do Brasil, LOTE 7 de N.
--
-- Continuação dos lotes 1 a 6, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre
-- Rondônia (Suruí Paiter), o Pantanal (Guató) e o litoral do
-- Ceará (Tremembé).
--
-- Bônus: Tremembé também é ligado, via culturas_linhagem, à
-- "Jurema Sagrada / Catimbó", mesmo padrão já usado com o
-- Potiguara no lote 5.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Suruí Paiter',
    'surui-paiter',
    'Terra Indígena Sete de Setembro, entre Rondônia e Mato Grosso',
    'Autodenominam-se Paiter, "gente verdadeira". A cerâmica carrega forte carga mitológica: contam a origem do barro através do mito do capacete de argila, que protegeria guerreiros de males espirituais, e da mulher de barro, que se transformava em pote. Acreditam em Palop, criador que aguarda os espíritos dos mortos numa terra fértil ao fim de uma longa jornada.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 23 from culturas)
  ),
  (
    'Guató',
    'guato',
    'Áreas alagáveis do Pantanal, Mato Grosso e Mato Grosso do Sul',
    'Últimos povos canoeiros das terras baixas do Pantanal, historicamente dados como extintos entre 1950 e 1976, até serem reencontrados por missionários na periferia de Corumbá. Construíram aterros, montículos de terra erguidos ao longo de séculos como base para moradia e agricultura em área sazonalmente inundada, hoje reconhecidos como o principal vestígio material de sua presença na região.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 24 from culturas)
  ),
  (
    'Tremembé',
    'tremembe',
    'Litoral norte do Ceará, municípios de Itarema, Acaraú e Itapipoca',
    'Praticam o Torém, dança circular de caráter sagrado descrita por suas próprias lideranças como "uma missa cantada e dançada", que liga o povo à natureza e afirma sua identidade étnica. Suas cantigas fazem referência direta à jurema e ao murici, plantas centrais da espiritualidade indígena do Nordeste.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 25 from culturas)
  )
on conflict (slug) do nothing;

-- Linhagem: Tremembé como um dos povos ligados à Jurema Sagrada
insert into culturas_linhagem (cultura_id, origem_id, rota)
select c.id, o.id, 'povo indígena ligado ao culto da Jurema Sagrada, litoral norte do Ceará'
from culturas c, culturas o
where c.nome ilike '%Jurema%' and o.nome ilike '%Tremembé%'
on conflict (cultura_id, origem_id) do nothing;
