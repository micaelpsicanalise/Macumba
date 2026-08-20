-- ============================================================
-- Povos indígenas do Brasil, LOTE 16 de N.
--
-- Continuação dos lotes 1 a 15, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Circum-Roraima (Taurepang/Pemon, Ingarikó), o noroeste do Pará
-- (Zo'é) e Rondônia (Akuntsu, Kanoê).
--
-- Nota sobre Akuntsu e Kanoê: são povos distintos, não a mesma
-- etnia, mas vivem no mesmo pequeno território depois de ambos
-- serem reduzidos a poucos sobreviventes pela mesma onda de
-- violência de fazendeiros/madeireiros em Rondônia nos anos 1980.
-- Registrado sem amenizar, como já feito com outros casos de
-- genocídio em lotes anteriores.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Taurepang (Pemon)',
    'taurepang-pemon',
    'Norte de Roraima, Terra Indígena São Marcos e Raposa Serra do Sol, fronteira com Venezuela e Guiana',
    'Autodenominam-se Pemon, "gente", nome que também é usado pelos Arekuna e Kamarakoto, formando junto com os Makuxi o grande complexo cultural Pemon do Circum-Roraima. Sua mitologia gira em torno do herói cultural Makunaíma. Compartilham com Makuxi, Ingarikó e Wapichana a crença no Kanaimé, figura vingadora que provoca definhamento e morte em quem comete atos reprováveis, através de xamanismo que envolve rezas e o cultivo de plantas de poder.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 50 from culturas)
  ),
  (
    'Zo''é',
    'zoe',
    'Bacia do rio Cuminapanema, noroeste do Pará',
    'Um dos últimos povos considerados "intactos" da Amazônia até seu primeiro contato registrado, em 1982. São identificados pelo poturu (ou embe''po), adorno labial de madeira inserido no lábio inferior durante ritual de iniciação adolescente, usado tanto por homens quanto por mulheres e mantido a vida toda. Praticam caça, coleta e agricultura itinerante, vivendo em grandes casas coletivas de palha, abertas nas laterais.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 51 from culturas)
  ),
  (
    'Akuntsu',
    'akuntsu',
    'Terra Indígena Rio Omerê, sudeste de Rondônia',
    'Um dos povos mais reduzidos do Brasil, hoje com pouquíssimos sobreviventes, remanescentes de um genocídio cometido por fazendeiros e madeireiros entre as décadas de 1980 e 1990. Konibu, xamã e último líder do povo, fazia rapé de tabaco para se comunicar com o mundo espiritual e soprava sobre a família e visitantes para afastar maus espíritos, até morrer em 2015. "Akuntsu" não é autodenominação: é como os vizinhos Kanoê os chamavam.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 52 from culturas)
  ),
  (
    'Kanoê (do Omerê)',
    'kanoe-omere',
    'Terra Indígena Rio Omerê, sudeste de Rondônia',
    'Povo linguística e culturalmente distinto dos vizinhos Akuntsu, com quem divide o mesmo pequeno território desde que os dois grupos, já reduzidos a poucos sobreviventes, foram empurrados um para perto do outro pela mesma violência de fazendeiros na década de 1980. Foram contatados pela Funai em 1995 e ajudaram a localizar o pequeno grupo Akuntsu que vivia próximo, até então desconhecido.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 53 from culturas)
  ),
  (
    'Ingarikó',
    'ingariko',
    'Nordeste de Roraima, Terra Indígena Raposa Serra do Sol, fronteira com Venezuela e Guiana',
    'Conhecidos fora do Brasil pelo etnônimo Akawaio, integram, junto com os Patamona, o grande grupo Kapon, "povo do alto, povo do céu", vizinho do complexo Pemon (Makuxi, Taurepang, Arekuna). Compartilham com esses vizinhos a mitologia de Makunaíma e a crença no Kanaimé, e têm no Monte Roraima, tepuy sagrado na tríplice fronteira, uma referência cosmológica comum a todos os povos da região.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 54 from culturas)
  )
on conflict (slug) do nothing;
