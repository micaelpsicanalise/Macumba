-- ============================================================
-- Povos indígenas do Brasil, LOTE 38 de N.
--
-- Continuação dos lotes 1 a 37, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- baixo Oiapoque, Amapá (Galibi Kali'na, completando os 4 povos
-- dessa região junto com Palikur, Galibi Marworno e Karipuna já
-- cadastrados) e o Parque Indígena do Tumucumaque, Pará (Tiriyó).
-- Com este lote, o compêndio chega a 100 povos indígenas
-- brasileiros cadastrados.
--
-- Nota sobre Tiriyó: outro caso, como Galibi Marworno e outros
-- antes, de descontinuidade ritual documentada (em 1982, nenhum
-- pajé seguia ativo), registrado sem amenizar.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Galibi Kali''na',
    'galibi-kalina',
    'Aldeia São José dos Galibi, margem direita do rio Oiapoque, norte do Amapá',
    'Vieram da região do rio Maná, na Guiana Francesa, migrando para o Brasil em 1950 sob liderança de Geraldo Lod, que atravessou o rio Oiapoque com a família em três canoas depois de desentendimentos na aldeia de origem. Apesar de, nas décadas seguintes, autoridades francesas terem tentado convencê-los a voltar, os Galibi Kali''na escolheram deliberadamente a nacionalidade brasileira e nunca deixaram as terras onde se instalaram. Seguem um catolicismo tradicional, distinto do catolicismo popular praticado pelos vizinhos Karipuna e Galibi Marworno.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 99 from culturas)
  ),
  (
    'Tiriyó (Wü Tarëno)',
    'tiriyo-wu-tareno',
    'Parque Indígena do Tumucumaque, norte do Pará, também Suriname',
    'Autodenominam-se Wü Tarëno, "eu sou daqui". O nome "Tiriyó" reúne, na verdade, vários grupos historicamente distintos, como Aramixó, Akuriyó e Pianokotó, que missionários franciscanos (no Brasil) e protestantes (no Suriname) passaram a tratar sob um único rótulo a partir dos anos 1960. Os próprios Tiriyó notaram, na época, que padres católicos toleravam festas e bebidas enquanto missionários protestantes as proibiam, e concluíram que nenhum dos dois grupos era "mestre completo" da religião. Em 1982, nenhum pajé seguia ativo entre eles, e as festas tradicionais haviam sido abandonadas.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 100 from culturas)
  )
on conflict (slug) do nothing;
