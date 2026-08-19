-- ============================================================
-- Povos indígenas do Brasil, LOTE 11 de N.
--
-- Continuação dos lotes 1 a 10, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre a
-- fronteira Amazonas/Pará (Sateré-Mawé), o noroeste do Mato Grosso
-- (Enawenê-Nawê) e o vale do rio Doce (Krenak).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Sateré-Mawé',
    'satere-mawe',
    'Território Indígena Andirá-Marau, fronteira entre Amazonas e Pará',
    'Conhecidos como "filhos do guaraná": segundo o mito, o fruto sagrado nasceu do olho da jovem Cereçaporanga, morta com o amado após um raio derrubar a árvore em que estavam. No ritual Waumat (da tucandeira), jovens vestem luvas trançadas cheias de formigas tucandeira e suportam suas ferroadas por pelo menos 15 minutos, provando força e coragem para serem reconhecidos como adultos e, futuramente, lideranças.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 35 from culturas)
  ),
  (
    'Enawenê-Nawê',
    'enawene-nawe',
    'Noroeste do Mato Grosso, bacia do rio Juruena',
    'Não comem carne vermelha. Realizam o Yaokwa (ou Yãkwa), ritual de sete meses reconhecido pela Unesco como Patrimônio Cultural Imaterial, em que constroem barragens de pesca sofisticadas para alimentar os Yakairiti, espíritos subterrâneos condenados a uma fome insaciável. Em troca do alimento oferecido, os espíritos mantêm a ordem cósmica e social entre os clãs do povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 36 from culturas)
  ),
  (
    'Krenak',
    'krenak',
    'Vale do rio Doce, divisa entre Minas Gerais e Espírito Santo',
    'Descendentes dos Botocudo (Borum), tratam o rio Doce, chamado Watu em sua língua, como entidade viva e ancestral, que fala, escuta, adoece e ensina. O rompimento da barragem de Fundão em Mariana, em 2015, é vivido pelo povo como a morte do próprio Watu. A liderança Ailton Krenak, escritor e filósofo, membro da Academia Brasileira de Letras, é uma das vozes indígenas mais conhecidas do Brasil.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 37 from culturas)
  )
on conflict (slug) do nothing;
