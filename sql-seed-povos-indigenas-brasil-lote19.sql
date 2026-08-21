-- ============================================================
-- Povos indígenas do Brasil, LOTE 19 de N.
--
-- Continuação dos lotes 1 a 18, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- leste de Rondônia (Gavião Ikolen), o noroeste de Roraima
-- (Sanöma, subgrupo Yanomami) e o Alto Solimões, Amazonas
-- (Kambeba/Omágua).
--
-- Nota: no Kambeba, registrei que a religiosidade predominante nas
-- aldeias hoje é o catolicismo (com presença pentecostal crescente),
-- mesma lógica de honestidade já usada com o Palikur no lote 10 e
-- o Guarani Kaiowá, não amenizar o que já não é mais praticado.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Gavião Ikolen',
    'gaviao-ikolen',
    'Bacia do igarapé Lourdes, afluente do rio Ji-Paraná, leste de Rondônia',
    'Autodenominam-se Ikolen, palavra que significa "gavião" em sua língua, da família tupi-mondé. Os mitos Goihanei e Dzerebãi cumprem função pedagógica na cultura do povo, transmitindo regras e visão de mundo às novas gerações. A população, estimada em 600 pessoas em 1930, caiu para cerca de 100 em 1966 após o contato, período que coincidiu com a chegada de missões evangélicas à região, gerando tensão entre a evangelização e a manutenção das práticas religiosas tradicionais.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 61 from culturas)
  ),
  (
    'Sanöma (Sanumá)',
    'sanoma-sanuma',
    'Serra Parima, região do rio Auaris, noroeste de Roraima, também Venezuela',
    'Subgrupo do povo Yanomami com língua própria, o sanumá, dentro da família linguística yanomami. Compartilham com os demais Yanomami a estrutura xamânica de cura e comunicação espiritual, mas apresentam diferenças culturais atribuídas ao contato histórico com povos vizinhos de língua karib, como os Ye''kwana, com quem dividem território na região do rio Auaris, mantendo redes econômicas e sociais entre os dois povos.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 62 from culturas)
  ),
  (
    'Kambeba (Omágua)',
    'kambeba-omagua',
    'Alto rio Solimões, região de São Paulo de Olivença, Amazonas',
    'Autodenominam-se Omágua. Cronistas espanhóis do século XVI já descreviam esse povo, historicamente conhecido pela deformação craniana intencional e por uma organização social densa ao longo de 700 quilômetros de várzea amazônica. Perseguidos, muitos negaram sua identidade étnica até o fim do século XX; hoje vivem um movimento de retomada cultural através de escolas bilíngues, enquanto a religiosidade predominante nas aldeias é o catolicismo, com devoção ao Divino Espírito Santo, e presença crescente de igrejas pentecostais.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 63 from culturas)
  )
on conflict (slug) do nothing;
