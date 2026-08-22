-- ============================================================
-- Povos indígenas do Brasil, LOTE 20 de N.
--
-- Continuação dos lotes 1 a 19, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Alto Rio Negro (Tukano), o sul da Bahia (Tupinambá de Olivença)
-- e o litoral do Espírito Santo (Tupiniquim).
--
-- Nota: Tupiniquim é outro caso, como Palikur e Kambeba antes,
-- de conversão religiosa histórica amplamente documentada
-- (maioria se declara católica hoje) registrada sem amenizar.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Tukano (Yepá-mahsã)',
    'tukano-yepa-mahsa',
    'Alto rio Negro, calha dos rios Uaupés e Tiquié, noroeste do Amazonas, também Colômbia',
    'Autodenominam-se Yepá-mahsã, "gente da terra". Núcleo de um sistema regional de cerca de 16 povos que praticam exogamia linguística, casando sempre fora do próprio grupo de idioma, o que tece uma rede densa de alianças com etnias vizinhas como Desana, Wanano e Tuyuka. O Dabucuri, grande festa de troca ritual de alimentos entre clãs, reforça essas alianças; ao lado do complexo do Yuruparí, flautas sagradas proibidas ao olhar feminino, estrutura boa parte da vida cerimonial da região.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 64 from culturas)
  ),
  (
    'Tupinambá de Olivença',
    'tupinamba-olivenca',
    'Sul da Bahia, ao redor da vila de Olivença, município de Ilhéus',
    'Descendem do aldeamento jesuíta fundado em 1680 na região, onde permanecem desde então. Segundo a tradição oral, preparavam a giroba, bebida fermentada consumida em festas, e incorporaram um santo mártir católico à devoção local durante a catequese colonial. Depois de gerações sendo tratados oficialmente como "caboclos" ou "índios civilizados", vivem desde os anos 2000 um movimento de ressurgimento étnico, reivindicando cocar, pintura corporal e a identidade Tupinambá em meio a uma disputa de terras ainda em aberto.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 65 from culturas)
  ),
  (
    'Tupiniquim (Tupinikim)',
    'tupiniquim-tupinikim',
    'Município de Aracruz, litoral norte do Espírito Santo',
    'Um dos primeiros povos a ter contato com os colonizadores portugueses em 1500, o que custou boa parte de sua língua e costumes ao longo dos séculos seguintes. A Dança do Tambor, hoje praticada só na aldeia de Caieiras Velhas, era liderada pelo Capitão do Tambor, também reconhecido como curandeiro (rezador) pelo povo; a maioria se declara católica atualmente. Enfrentam desde a década de 1970 disputa de terras contra a empresa Aracruz Celulose, que ocupou dezenas de aldeamentos tupiniquins historicamente documentados na região.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 66 from culturas)
  )
on conflict (slug) do nothing;
