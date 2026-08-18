-- ============================================================
-- Povos indígenas do Brasil, LOTE 3 de N.
--
-- Continuação dos lotes 1 e 2, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Tapajós (Munduruku), o Agreste de Pernambuco (Fulni-ô) e o Alto
-- Rio Negro (Baniwa).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Munduruku',
    'munduruku',
    'Médio e alto rio Tapajós, Pará e Amazonas',
    'Povo de tradição guerreira que dominou cultural e militarmente o Vale do Tapajós desde o fim do século XVIII, região historicamente chamada Mundurukânia. Praticavam a mumificação de cabeças de inimigos, às quais atribuíam poderes mágicos, ritual abandonado há muito tempo. Lugares como a cachoeira Daje Kapap Eipi, ligada ao mito do herói Karosakaybu, são território sagrado onde vivem os espíritos dos ancestrais.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 10 from culturas)
  ),
  (
    'Fulni-ô',
    'fulni-o',
    'Águas Belas, Agreste de Pernambuco',
    'Único povo indígena do Nordeste, fora o Maranhão, que preservou a língua materna, o Yaathe, falada durante o ritual sagrado e secreto do Ouricuri. Todos os anos, de setembro a novembro, a comunidade se recolhe numa aldeia própria erguida só para essa cerimônia, vedada a quem não é Fulni-ô. O Toré, dança e oração comunitária, é outro pilar de sua identidade.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 11 from culturas)
  ),
  (
    'Baniwa',
    'baniwa',
    'Rio Içana e afluentes, Alto Rio Negro, Amazonas, também Colômbia e Venezuela',
    'Povo de língua aruak cuja cosmologia tem Kuwai, filho do herói ancestral Nhiãperikuli, como figura central: dele nascem os ritos de passagem e o xamanismo. O ritual do Jurupari envolve flautas sagradas cuja visão é proibida às mulheres. Xamãs chamados marirri usam maracá e paricá para induzir o transe de cura.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 12 from culturas)
  )
on conflict (slug) do nothing;
