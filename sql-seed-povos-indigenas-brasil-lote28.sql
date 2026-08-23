-- ============================================================
-- Povos indígenas do Brasil, LOTE 28 de N.
--
-- Continuação dos lotes 1 a 27, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre a
-- Serra dos Dourados, noroeste do Paraná (Xetá) e a bacia do rio
-- Juruena, Mato Grosso (Rikbaktsa).
--
-- Nota: Xetá e Rikbaktsa foram, cada um em momento diferente,
-- declarados oficialmente "extintos" por autoridades ou
-- antropólogos brasileiros, e depois documentadamente
-- "ressurgiram" como povos vivos. Mesmo padrão de erro colonial
-- já visto com o Guató no lote 7.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Xetá',
    'xeta',
    'Serra dos Dourados, noroeste do Paraná',
    'Falantes de língua tupi-guarani, foram os últimos indígenas do Sul a ter contato com a sociedade nacional, entre as décadas de 1940 e 1950. De uma população estimada em cerca de 2 mil pessoas antes do contato, restam hoje poucas dezenas de descendentes, dispersos entre Paraná, Santa Catarina e São Paulo depois de serem forçosamente separados uns dos outros. O caso foi reconhecido como genocídio pela Comissão Nacional da Verdade; considerados oficialmente extintos nos anos 1980, os Xetá vêm, desde então, reconstruindo sua presença pública e, mais recentemente, retomando parte de seu território ancestral.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 81 from culturas)
  ),
  (
    'Rikbaktsa',
    'rikbaktsa',
    'Bacia do rio Juruena, noroeste do Mato Grosso',
    'Autodenominam-se Rikbaktsa, "os seres humanos". O Tutãra, colar sagrado feito com uma concha rara encontrada só no rio Arinos, carrega em seus desenhos a figura do cará, peixe considerado mãe mítica de origem do povo; sua confecção, feita só por mulheres, envolve semanas de trabalho artesanal com conchas, cinza e algodão. A mitologia rikbaktsa é marcada pela metamorfose entre seres humanos, animais e espíritos como princípio de continuidade da existência. Também declarados extintos, pelo antropólogo Darcy Ribeiro em 1957, os Rikbaktsa sofreram o extermínio de cerca de 75% de sua população nos anos 1960, por seringalistas, madeireiros e fazendeiros.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 82 from culturas)
  )
on conflict (slug) do nothing;
