-- ============================================================
-- Povos indígenas do Brasil, LOTE 23 de N.
--
-- Continuação dos lotes 1 a 22, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre a
-- Volta Grande do Xingu, Pará (Arara do Pará e Yudjá), ambos
-- diretamente afetados pela Usina Hidrelétrica de Belo Monte.
--
-- Nota: "Arara" é nome genérico dado por não indígenas a VÁRIOS
-- povos brasileiros não relacionados entre si (o do Pará, de
-- língua karib, é diferente do Arara Karo de Rondônia, de tronco
-- tupi-ramarama). Esta entrada é especificamente sobre o Arara
-- do Pará/Volta Grande do Xingu.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Arara do Pará',
    'arara-do-para',
    'Margem esquerda do rio Iriri e Volta Grande do Xingu, Pará',
    'Falantes de língua karib, distintos de outros povos batizados com o mesmo nome genérico "Arara" em outras regiões do Brasil. A tradição oral situa a origem do povo e a formação do mundo atual na margem direita do Xingu. Com a redução de vazão provocada pela Usina Hidrelétrica de Belo Monte na região da Volta Grande, o povo teme que os encantados, espíritos que habitam o rio, sejam forçados a abandonar o território.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 71 from culturas)
  ),
  (
    'Yudjá (Juruna)',
    'yudja-juruna',
    'Rio Xingu, entre o Parque Indígena do Xingu (Mato Grosso) e a Volta Grande do Xingu (Pará)',
    'Autodenominam-se Yudjá, "donos do rio Xingu"; "Juruna" é apelido colonial que significa "boca preta", numa alusão a uma tatuagem tradicional ao redor da boca. Sua cosmologia organiza o mundo em pares opostos habitados: o céu espelha a terra, o rio se opõe à floresta, e no leito do Xingu vivem os ãwã, contrapartes dos vivos que habitam a superfície. Os Yudjá da Volta Grande, afetados pela hidrelétrica de Belo Monte, mantêm o costume de pedir permissão às entidades do rio antes de pescar, e prestar contas a elas depois.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 72 from culturas)
  )
on conflict (slug) do nothing;
