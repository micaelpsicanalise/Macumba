-- ============================================================
-- Povos indígenas do Brasil, LOTE 29 de N.
--
-- Continuação dos lotes 1 a 28, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre a
-- bacia do rio Purus (Deni) e as bacias dos rios Juruá/Itaquaí/
-- Javari (Kanamari), ambos no Amazonas.
--
-- Nota: existe também um povo "Katukina do Rio Biá" (família
-- linguística Katukina, distinto do Katukina de família Pano já
-- cadastrado no lote 10, que pratica o kambô no Acre). Não
-- cadastrei essa entrada agora porque a distinção entre os dois
-- "Katukina" merece pesquisa própria, não uma linha apressada.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Deni',
    'deni',
    'Bacia do rio Cuniuá, afluente do Purus, sul do Amazonas',
    'Os xamãs (zupinehé) começam a se preparar para o cargo desde os três anos de idade. Segundo a tradição, o que os diferencia dos demais homens é a presença de uma substância chamada katuhe no corpo, cera densa extraída de colmeias, mastigada antes de entrar em transe para se comunicar com os espíritos (tukurime); depois de cerca de duas semanas mastigando, vomitando e dormindo bastante, o xamã afirma voar até o céu para ouvi-los. Hoje o xamanismo é cada vez mais raro entre o povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 83 from culturas)
  ),
  (
    'Kanamari',
    'kanamari',
    'Bacias dos rios Juruá, Itaquaí e Javari, Amazonas',
    'Segundo a cosmologia do povo, o mundo atual nasceu da queda do Céu Antigo (Kodoh Kidak), derrubado por uma flecha disparada pelo sapo Piyoyom; os destroços formaram a floresta e o chão que pisamos, e por trás dele surgiu o Céu Novo (Kodoh Aboawa), onde vivem hoje as divindades Kohana. O Kohana-pa, ritual em que os Kanamari recebem a visita dos mortos, é celebrado com mais frequência na época de fartura de pupunha, podendo reunir várias aldeias quando se trata do funeral de um líder ou xamã importante.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 84 from culturas)
  )
on conflict (slug) do nothing;
