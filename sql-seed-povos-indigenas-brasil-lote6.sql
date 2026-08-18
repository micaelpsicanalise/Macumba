-- ============================================================
-- Povos indígenas do Brasil, LOTE 6 de N.
--
-- Continuação dos lotes 1 a 5, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- sertão de Pernambuco (Pankararu), o Pantanal sul-mato-grossense
-- (Kadiwéu) e o Alto Xingu (Kamayurá).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Pankararu',
    'pankararu',
    'Aldeia Brejo dos Padres, municípios de Petrolândia e Tacaratu, sertão de Pernambuco',
    'No ritual do Toré, o dançador veste o Praiá, máscara e saiote de palha de caroá que cobre todo o corpo, e passa a materializar um Encantado, entidade sagrada que habita a natureza. A confecção da máscara segue regras rituais rígidas; depois de usada, é guardada e enterrada sob a casa do zelador responsável por sua guarda.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 20 from culturas)
  ),
  (
    'Kadiwéu',
    'kadiweu',
    'Região a oeste do rio Miranda, Mato Grosso do Sul, fronteira com o Paraguai',
    'Descendentes dos guaicurus, "índios cavaleiros" que lutaram ao lado do Brasil na Guerra do Paraguai. Suas mulheres produzem cerâmicas e pinturas corporais com grafismos geométricos elaborados, feitos com tinta de jenipapo e urucum, que historicamente indicavam a posição social de cada pessoa. O antropólogo Claude Lévi-Strauss documentou esses grafismos no início do século 20.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 21 from culturas)
  ),
  (
    'Kamayurá',
    'kamayura',
    'Alto Xingu, Mato Grosso',
    'Um dos dez povos que compõem o complexo multiétnico do Alto Xingu. Realizam o Kuarup, ritual fúnebre em que troncos de madeira esculpidos e adornados representam materialmente as almas de mortos importantes. Depois de uma noite de cantos e choro, os troncos são lançados ao rio, libertando os espíritos e encerrando o período de luto.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 22 from culturas)
  )
on conflict (slug) do nothing;
