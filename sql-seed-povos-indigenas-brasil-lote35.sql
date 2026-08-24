-- ============================================================
-- Povos indígenas do Brasil, LOTE 35 de N.
--
-- Continuação dos lotes 1 a 34, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote traz o
-- Yaminawá, Acre.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Yaminawá',
    'yaminawa',
    'Alto rio Acre e afluentes do Purus e Juruá, Acre, também Peru e Bolívia',
    '"Yaminawá" significa "gente do machado" e foi nome dado por outros povos, principalmente os vizinhos Kaxinawá (Huni Kuin) e Shipibo, que temiam suas incursões; internamente, se identificam por autodenominações ligadas a animais totêmicos, como Bashonawá ("gente do gambá") ou Marinawá ("gente da cutia"). Como os Huni Kuin, creem que tudo o que existe tem espírito, o yoshi. Décadas de deslocamentos forçados e conflitos internos dispersaram o povo entre aldeias na floresta e periferias urbanas de Rio Branco, onde muitas vezes são vistos, de forma contraditória, tanto como "selvagens" quanto como "índios sem cultura", quando na verdade mantêm identidade e organização social próprias.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 94 from culturas)
  )
on conflict (slug) do nothing;
