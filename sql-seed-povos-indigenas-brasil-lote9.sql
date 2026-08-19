-- ============================================================
-- Povos indígenas do Brasil, LOTE 9 de N.
--
-- Continuação dos lotes 1 a 8, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Vale do Javari (Marubo), o Alto Xingu (Waurá) e o noroeste de
-- Roraima (Ye'kwana).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Marubo',
    'marubo',
    'Vale do Javari, Amazonas',
    'Povo de língua pano cujo xamanismo se expressa através dos kene, grafismos rituais inscritos no corpo, e dos saiti, "cantos-mito" que narram sua cosmologia. Em 2023, aldeias marubo passaram a ter acesso à internet via satélite Starlink, o que abriu um debate próprio, entre eles mesmos, sobre a relação entre tradição e tecnologia.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 29 from culturas)
  ),
  (
    'Waurá (Wauja)',
    'waura-wauja',
    'Alto e Médio Xingu, Mato Grosso',
    'Únicos ceramistas entre os povos do Alto Xingu, atribuem esse saber a Kamalu-hái, entidade semelhante a uma serpente, considerada "dona do barro". O xamanismo waurá funciona como negociação com seres extra-humanos chamados apapaatai: quando alguém adoece, o xamã busca resgatar a alma roubada por um deles, oferecendo comida e festa em troca da cura.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 30 from culturas)
  ),
  (
    'Ye''kwana',
    'yekwana',
    'Noroeste de Roraima, também Amazonas e Venezuela',
    'Autodenominam-se So''to. Sua cosmologia está registrada na Watunna, epopeia cosmogônica que narra a criação do mundo pelo demiurgo Wanadi. A cestaria, sobretudo o cesto ritual wöwa, é conhecimento sagrado transmitido entre gerações, essencial tanto ao cotidiano quanto às cerimônias do povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 31 from culturas)
  )
on conflict (slug) do nothing;
