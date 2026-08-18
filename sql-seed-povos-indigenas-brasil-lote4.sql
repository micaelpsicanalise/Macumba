-- ============================================================
-- Povos indígenas do Brasil, LOTE 4 de N.
--
-- Continuação dos lotes 1, 2 e 3, mesmo método: cada povo
-- pesquisado individualmente antes de escrever o resumo. Este
-- lote cobre a Ilha do Bananal (Karajá), o nordeste do Tocantins
-- (Krahô, povo Timbira) e Roraima (Wapichana).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Karajá (Iny)',
    'karaja-iny',
    'Ilha do Bananal e rio Araguaia, Tocantins, Goiás, Mato Grosso e Pará',
    'Autodenominam-se Iny. Conhecidos pelas bonecas de cerâmica ritxòkò, feitas por mulheres, que retratam o corpo humano com pinturas, adornos e marcas de vida como gravidez, transmitindo conhecimento sobre a cultura Karajá às novas gerações. O ritual do Aruanã celebra espíritos que vivem no fundo do rio, representados por máscaras usadas em cerimônias de iniciação e cura.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 13 from culturas)
  ),
  (
    'Krahô',
    'kraho',
    'Bacia do rio Tocantins, nordeste do estado do Tocantins',
    'Povo Timbira (tronco Macro-Jê) que alega descendência de dois povos, Krahô e Kanela, originários de uma região do Maranhão chamada Bons Pastos. Têm como símbolo sagrado uma machadinha de pedra chamada Khoyré, à qual atribuem a harmonia da comunidade. A corrida de toras de buriti, disputada em volta do pátio central da aldeia, marca festas como a Festa do Milho (pônhê) e os ritos de passagem chamados Amji kin.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 14 from culturas)
  ),
  (
    'Wapichana',
    'wapichana',
    'Interflúvio dos rios Branco e Rupununi, Roraima, também Guiana',
    'Maior população falante de língua aruak do norte amazônico e segundo maior povo indígena de Roraima. Sua cosmologia inclui o canaimé, ser temido, meio humano meio animal, que pune quem causa mal à natureza ou à comunidade. A liderança Joênia Wapichana, primeira mulher indígena eleita deputada federal no Brasil, pertence a este povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 15 from culturas)
  )
on conflict (slug) do nothing;
