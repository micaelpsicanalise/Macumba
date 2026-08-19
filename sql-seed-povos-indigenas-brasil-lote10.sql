-- ============================================================
-- Povos indígenas do Brasil, LOTE 10 de N.
--
-- Continuação dos lotes 1 a 9, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Acre (Katukina), o norte do Amapá (Palikur) e o Maranhão
-- (Canela/Ramkokamekrá).
--
-- Nota sobre o Palikur: diferente da maioria dos verbetes deste
-- compêndio, aqui o resumo registra também a conversão histórica
-- ao protestantismo e o abandono de boa parte dos rituais
-- tradicionais. Omitir isso seria romantizar um estado que não
-- existe mais, o oposto do que o manifesto do projeto defende.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Katukina (Pano)',
    'katukina-pano',
    'Rios Gregório e Campinas, município de Cruzeiro do Sul, Acre',
    'Praticam o kampô (ou kambô), aplicação da secreção de uma rã arborícola (Phyllomedusa bicolor) na pele, feita através de pequenas queimaduras de cipó. Segundo eles, o kampô elimina a panema, estado de azar, preguiça e fraqueza que compromete a caça e o cotidiano, sendo aplicado nos braços e no peito dos homens e nas pernas das mulheres, conforme suas tarefas.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 32 from culturas)
  ),
  (
    'Palikur (Pa''ikwené)',
    'palikur-paikwene',
    'Bacia do rio Uaçá, município de Oiapoque, norte do Amapá, também Guiana Francesa',
    'Povo de tronco linguístico aruak presente na região desde antes de 1513. O ritual do Turé oferecia dança, canto e caxiri (bebida fermentada) aos karuanãs, espíritos auxiliares dos pajés; durante a cerimônia, o pajé sentava sobre um banquinho esculpido em madeira com formas de aves, feito conforme visões sonhadas, para viajar até o mundo espiritual. Desde os anos 1940, a maioria dos Palikur se converteu ao protestantismo, e boa parte desses rituais deixou de ser praticada.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 33 from culturas)
  ),
  (
    'Canela (Ramkokamekrá)',
    'canela-ramkokamekra',
    'Aldeia Escalvado, região de Barra do Corda, Maranhão',
    'Nação Timbira (tronco macro-jê) organizada em duas metades exogâmicas ligadas ao poente e ao nascente. O ritual de iniciação masculina Pepyê reúne os jovens cantando no pátio central com talos de buriti; a corrida com tora, disputada entre as metades da aldeia, é a expressão física e coletiva mais conhecida de sua vida cerimonial.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 34 from culturas)
  )
on conflict (slug) do nothing;
