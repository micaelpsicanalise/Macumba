-- ============================================================
-- Povos indígenas do Brasil, LOTE 8 de N.
--
-- Continuação dos lotes 1 a 7, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Acre (Huni Kuin), o agreste de Pernambuco (Xukuru do Ororubá) e
-- o norte de Minas Gerais (Xakriabá).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Huni Kuin (Kaxinawá)',
    'huni-kuin-kaxinawa',
    'Vale do rio Jordão e outros afluentes, estado do Acre, também Peru',
    'Autodenominam-se Huni Kuin, "gente verdadeira", em hantxa kuin, sua língua da família pano. O nixi pae ("cipó forte"), conhecido fora da aldeia como ayahuasca, é preparo sagrado usado em cerimônia xamânica, acompanhado dos cantos huni meka que guiam a experiência. O mito de origem do nixi pae narra o encontro de um caçador com um povo-jiboia que vive no fundo de um lago.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 26 from culturas)
  ),
  (
    'Xukuru do Ororubá',
    'xukuru-ororuba',
    'Serra do Ororubá, município de Pesqueira, agreste de Pernambuco',
    'A Pedra do Rei do Ororubá é o principal símbolo sagrado do povo, local de consagração do cacique e de rituais como a Festa de Reis. É também onde está enterrado o cacique Xicão, assassinado em 1998 por latifundiários durante a luta pela demarcação de terras, hoje reverenciado como herói do povo. A devoção católica é reelaborada como "Nossa Mãe Tamain", entidade cabocla que apoia as mobilizações Xukuru.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 27 from culturas)
  ),
  (
    'Xakriabá',
    'xakriaba',
    'São João das Missões, norte de Minas Gerais',
    'Um dos poucos povos indígenas de Minas Gerais. Sua cosmologia central inclui Yayá, a onça-cabocla, espírito protetor que se transforma em onça durante a noite para guardar o território. No ritual do Toré, indivíduos são escolhidos para se tornarem oráculo de Yayá. O catolicismo em torno de São João dos Índios convive lado a lado com essas tradições próprias.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 28 from culturas)
  )
on conflict (slug) do nothing;
