-- ============================================================
-- Povos indígenas do Brasil, LOTE 34 de N.
--
-- Continuação dos lotes 1 a 33, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote traz o
-- Kulina (Madiha), bacias dos rios Juruá e Purus.
--
-- Nota: NÃO é o mesmo povo que o Kulina Pano (lote 33). Família
-- linguística diferente (Arawá, não Pano), população bem maior
-- (2 a 6 mil pessoas contra pouco mais de 30 falantes). O nome
-- parecido gerou até confusão entre fontes especializadas, mas
-- são povos distintos, mesmo padrão de cuidado já aplicado a
-- Katukina, Arara e Gavião em lotes anteriores.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Kulina (Madiha)',
    'kulina-madiha',
    'Bacias dos rios Juruá e Purus, sul do Amazonas e Acre, também Peru',
    'Autodenominam-se madija, "os que são gente"; tratam os não indígenas genericamente por cariás. Segundo sua cosmologia, ao morrer, o espírito de uma pessoa (tokorimé) vai para nami budi, terra dos mortos, ou se metamorfoseia em animal de caça, sobretudo o queixada. O xamã, auxiliado pelo próprio tokorimé, viaja até nami budi para trazer esses espíritos de volta à aldeia como caça, que depois é consumida pelos vivos: um tipo de endocanibalismo ritual que reincorpora o morto ao ciclo de reciprocidade da comunidade.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 93 from culturas)
  )
on conflict (slug) do nothing;
