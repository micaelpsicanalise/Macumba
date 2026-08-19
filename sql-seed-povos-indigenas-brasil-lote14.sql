-- ============================================================
-- Povos indígenas do Brasil, LOTE 14 de N.
--
-- Continuação dos lotes 1 a 13, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- noroeste do Maranhão (Awá-Guajá), o cerrado/pantanal do Mato
-- Grosso (Bororo) e a fronteira Maranhão/Pará (Ka'apor).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Awá-Guajá',
    'awa-guaja',
    'Noroeste do Maranhão, terras indígenas Awá, Caru, Alto Turiaçu e Araribóia, também sudeste do Pará',
    'Autodenominam-se Awá, "gente". Um dos últimos povos nômades caçadores-coletores do planeta que não dependem de agricultura; ainda há grupos vivendo em isolamento voluntário na floresta. No ritual karawara, celebrado na estação seca, homens usam adornos de plumas e dançam ao redor de uma tacai, estrutura ritual, até serem possuídos pelos deuses celestes, que descem à terra em busca de caça e mel e, em troca, curam doenças através deles.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 44 from culturas)
  ),
  (
    'Bororo (Boe)',
    'bororo-boe',
    'Cerrado e pantanal do Mato Grosso, entre os rios Araguaia e das Mortes',
    'Autodenominam-se Boe. Sua cosmologia opõe duas forças: os bope, espíritos da natureza ligados a plantas e animais, e os aroe, espíritos aquáticos e almas dos mortos, cada um cuidado por um tipo diferente de xamã. O funeral bororo é um ciclo ritual longo, com meses de duração, em que o corpo, a alma e a comunidade passam por sucessivas transformações até os mortos se tornarem aroe maiwu, "almas novas", seres leves e luminosos.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 45 from culturas)
  ),
  (
    'Ka''apor',
    'kaapor',
    'Terras indígenas do Alto Turiaçu e Alto Rio Guamá, entre Maranhão e Pará',
    'Formaram-se como povo distinto há cerca de 300 anos, migrando do Pará ao Maranhão através do rio Gurupi após conflitos com colonizadores. A pintura corporal com jenipapo é central à identidade do povo: desenhos como jiboia e jabuti, inspirados na natureza, marcam ocasiões específicas como guerra, nascimento e luto, não sendo usados apenas por ornamento.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 46 from culturas)
  )
on conflict (slug) do nothing;
