-- ============================================================
-- Povos indígenas do Brasil, LOTE 32 de N.
--
-- Continuação dos lotes 1 a 31, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre a
-- Ilha de Assunção, rio São Francisco (Truká) e o alto rio Jutaí,
-- Vale do Javari (Tsohom-Dyapa).
--
-- Nota sobre Tsohom-Dyapa: a fonte mais confiável disponível (ISA/
-- Povos Indígenas no Brasil) declara explicitamente "religião:
-- nada é conhecido sobre o assunto". Preferi registrar essa
-- ausência de forma honesta a inventar uma prática ritual que não
-- pude verificar, mesmo critério já seguido em todo este compêndio.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Truká',
    'truka',
    'Ilha de Assunção, rio São Francisco, município de Cabrobó, sertão de Pernambuco',
    'Ocupam a Ilha de Assunção desde cerca de 1722, sobrevivendo a enchentes, ordens de extinção da Coroa e disputas de terra, inclusive contra a própria Igreja Católica, que reivindicou a ilha nos anos 1920 alegando que os indígenas a haviam "doado a Nossa Senhora". A jurema e o Toré, ritual mantido em segredo absoluto e vedado a quem não é Truká, são o núcleo de sua religiosidade, realizados às margens do rio, considerado parte viva do ritual. Em 2021, o povo demoliu com marretas, entoando cânticos, a estrutura de um templo evangélico que estava sendo erguido em seu território sem autorização.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 89 from culturas)
  ),
  (
    'Tsohom-Dyapa',
    'tsohom-dyapa',
    'Alto rio Jutaí, entre os rios Jandiatuba e Curuena, noroeste do Vale do Javari, Amazonas',
    'Autodenominam-se "Povo Tucano" (Tsohom, "tucano", mais o sufixo dyapa, "gente"). Falam língua da família Katukina, aparentada à dos Kanamari, com quem hoje mantêm contato frequente, vivendo inclusive na mesma aldeia. Nos anos 1980, prospecções de empresas de geologia na região expulsaram o povo de suas áreas tradicionais de caça; num episódio de violência na mesma década, cerca de 120 indígenas identificados como "Tucanos" foram mortos por homens contratados por um patrão seringueiro. Práticas religiosas específicas do povo não são documentadas publicamente até hoje.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 90 from culturas)
  )
on conflict (slug) do nothing;
