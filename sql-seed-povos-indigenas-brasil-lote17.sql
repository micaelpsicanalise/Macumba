-- ============================================================
-- Povos indígenas do Brasil, LOTE 17 de N.
--
-- Continuação dos lotes 1 a 16, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- sudeste da Bahia (Pataxó Hã-Hã-Hãe), Alagoas (Kariri-Xocó) e o
-- sertão de Pernambuco (Atikum).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Pataxó Hã-Hã-Hãe',
    'pataxo-ha-ha-hae',
    'Terras Indígenas Caramuru-Paraguaçu e Fazenda Baiana, sudeste da Bahia',
    'Povo formado da união entre antigos grupos Kamakã, Kariri-Sapuyá, Baenã, Mongoió e remanescentes de outras etnias que se refugiaram nas mesmas serras fugindo da violência colonial. Praticam o toré (Tohé), dança ritual acompanhada de maracás artesanais. Em 1997, a liderança Galdino Jesus dos Santos foi assassinado, queimado vivo em Brasília por jovens de classe média que alegaram tê-lo confundido com morador de rua; o caso se tornou símbolo nacional de violência contra povos indígenas.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 55 from culturas)
  ),
  (
    'Kariri-Xocó',
    'kariri-xoco',
    'Porto Real do Colégio, baixo rio São Francisco, Alagoas',
    'Formados pela fusão, no século XIX, entre os Kariri de Alagoas e parte dos Xocó, expulsos de uma ilha fluvial em Sergipe. O Ouricuri, cerimônia secreta realizada numa aldeia própria construída só para esse fim, é o núcleo da vida religiosa: reúne cânticos, danças e o consumo ritual da jurema, bebida que conduz à comunhão com ancestrais e divindades. O Toré, dançado com maracá no ritmo dos batimentos cardíacos, é sua expressão pública mais conhecida.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 56 from culturas)
  ),
  (
    'Atikum',
    'atikum',
    'Serra do Umã, município de Carnaubeira da Penha, sertão de Pernambuco',
    'Reconstruíram sua identidade étnica a partir da década de 1940, quando "caboclos da Serra do Umã" buscaram o Serviço de Proteção ao Índio para reverter a grilagem de suas terras. Não conheciam mais o Toré nem o preparo da jurema sagrada; aprenderam as duas práticas com o povo vizinho Tuxá, incorporando-as como fundamento de sua religiosidade recuperada. A Pedra do Gentio é considerada sítio sagrado do povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 57 from culturas)
  )
on conflict (slug) do nothing;
