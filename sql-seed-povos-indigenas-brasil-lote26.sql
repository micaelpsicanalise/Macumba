-- ============================================================
-- Povos indígenas do Brasil, LOTE 26 de N.
--
-- Continuação dos lotes 1 a 25, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre a
-- bacia do Tocantins entre Goiás e Tocantins (Avá-Canoeiro) e o
-- Alto Vale do Itajaí, Santa Catarina (Xokleng/Laklãnõ).
--
-- Nota sobre Avá-Canoeiro: um dos casos mais extremos de redução
-- populacional já registrados neste compêndio (poucas dezenas de
-- pessoas ao todo, dois grupos que nem se reconhecem mais como o
-- mesmo povo). Registrado sem amenizar.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Avá-Canoeiro',
    'ava-canoeiro',
    'Bacia do Tocantins, entre Goiás e a Ilha do Bananal, Tocantins',
    'Autodenominam-se Ãwa. Um dos povos mais reduzidos do Brasil: restam poucas dezenas de pessoas, divididas em dois grupos que se separaram há mais de 160 anos e hoje têm trajetórias, línguas e culturas distintas entre si, um em Goiás e outro na bacia do Araguaia, Tocantins. Habilidosos na confecção de canoas, flautas, flechas e cachimbos rituais em madeira, tiveram sua última aldeia massacrada por volta de 1969. Décadas de "proteção" através do isolamento forçado, sob convênio entre a Funai e a empresa Furnas, acabaram por infantilizar e isolar ainda mais os sobreviventes do grupo do Tocantins.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 77 from culturas)
  ),
  (
    'Xokleng (Laklãnõ)',
    'xokleng-laklano',
    'Alto Vale do Itajaí, Terra Indígena Xokleng Ibirama Laklãnõ, Santa Catarina',
    'Autodenominam-se Laklãnõ, "gente do sol". O kujá, pessoa que mantém contato com entidades sobrenaturais, interpreta sinais da natureza, trovões, o rugido do bugio, nuvens carregadas, como avisos de morte próxima de parentes ou conhecidos. Mesmo com a maioria hoje praticando a religião evangélica, herança da catequização promovida pelo Serviço de Proteção ao Índio desde o contato de 1914, essas leituras tradicionais da natureza continuam vivas entre o povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 78 from culturas)
  )
on conflict (slug) do nothing;
