-- ============================================================
-- Povos indígenas do Brasil, LOTE 31 de N.
--
-- Continuação dos lotes 1 a 30, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre mais
-- dois povos do Vale do Javari, Amazonas (Korubo e Matsés), que já
-- soma agora 4 povos cadastrados desta região (Matis e Marubo
-- vieram em lotes anteriores).
--
-- Nota sobre Korubo: pouca informação cosmológica/religiosa
-- específica está disponível publicamente, boa parte da
-- documentação existente é sobre contato e violência. Registrei
-- o que encontrei de forma honesta, sem inventar detalhes
-- rituais que não pude verificar.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Korubo',
    'korubo',
    'Terra Indígena Vale do Javari, entre os rios Ituí e Itaquaí, oeste do Amazonas',
    'Povo de família linguística Pano cuja autodenominação, se existe, ainda não é conhecida por pesquisadores; "Korubo" foi nome dado por outros. Parte do povo mantém contato com a sociedade brasileira desde os anos 1990, mas outros grupos seguem em isolamento voluntário ou contato mínimo, e um grupo de 21 pessoas isoladas só foi contatado em 2024, depois de serem abordadas por indígenas Matis. Sofreram décadas de violência de caçadores, madeireiros e garimpeiros nas áreas onde vivem; em 1989, três Korubo isolados foram mortos a tiros por caçadores não indígenas.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 87 from culturas)
  ),
  (
    'Matsés',
    'matses',
    'Terra Indígena Vale do Javari e alto rio Javari e afluentes, Amazonas, também Peru',
    'Povo de família linguística Pano, numericamente maior que a maioria dos povos vizinhos do Javari, o que pesquisadores associam à sua tradição guerreira ao longo do século passado. A maioria fala só a língua matsés, com crianças educadas exclusivamente no idioma indígena nas aldeias. Um subgrupo, os chamados Maya ou "arredios do Quixito", permanece hoje em isolamento voluntário, mesmo distante das demais aldeias matsés já em contato com a sociedade nacional.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 88 from culturas)
  )
on conflict (slug) do nothing;
