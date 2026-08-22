-- ============================================================
-- Povos indígenas do Brasil, LOTE 21 de N.
--
-- Continuação dos lotes 1 a 20, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- rio Madeira (Mura) e a fronteira Amazonas/Roraima (Waimiri
-- Atroari). Só 2 povos desta vez: material historicamente denso
-- (guerra colonial, repressão da ditadura), preferi não apressar
-- um terceiro sem verificar direito.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Mura',
    'mura',
    'Bacias dos rios Madeira, Purus e Autazes, Amazonas',
    'Povo canoeiro, historicamente descrito desde o século XVIII como navegantes com domínio completo dos igarapés, lagos e furos da Amazônia, vivendo embarcados nas cheias e acampados em palhoças temporárias no verão. Cronistas coloniais os classificavam como povo "sem religião, sem lei, sem agricultura e sem cultura material", rótulo hoje reconhecido como projeção colonial de ausência, não descrição real. Ficaram conhecidos pela resistência armada contra jesuítas e portugueses ao longo do século XVIII, a ponto de a Coroa propor, em 1714, guerra justa (autorização formal de extermínio) contra o povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 67 from culturas)
  ),
  (
    'Waimiri Atroari',
    'waimiri-atroari',
    'Entre o norte do Amazonas e o sul de Roraima, bacias dos rios Alalaú, Camanaú e Jauaperi',
    'Autodenominam-se kinja, "gente verdadeira", em oposição a quem não é indígena. Sua cosmologia povoa a mata, considerada território perigoso fora da segurança da maloca (mydy taha), com seres como os irikwa (mortos-vivos), os iamai (criaturas semelhantes a morcegos) e a ianana. Entre 1972 e 1975, durante a ditadura militar, sofreram uma campanha de repressão armada ligada à construção da rodovia BR-174, e em 1986 parte de seu território foi inundada pela represa de Balbina.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 68 from culturas)
  )
on conflict (slug) do nothing;
