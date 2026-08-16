-- ============================================================
-- Campo raiz_africana — classificação de LINHAGEM/ANCESTRALIDADE,
-- separada do campo `continente` (que é geográfico/atual).
--
-- Por quê: "afro-diaspórica" é uma categoria de origem ancestral,
-- não de onde a tradição existe hoje. Candomblé, Umbanda, Vodum e
-- Santería nasceram nas Américas mas têm raiz africana — se a
-- gente filtrasse só por continente = 'africa', essas tradições
-- ficariam fora do bloco "afro-diaspóricas" da página História.
-- ============================================================

-- 1) Coluna nova, default false (nunca apaga nada, só adiciona)
alter table culturas
  add column if not exists raiz_africana boolean not null default false;

-- 2) (Segurança) garante que a coluna continente existe, caso algum
--    ambiente ainda não tenha rodado a migration do protótipo raízes.
--    Se já existir, este comando não faz nada.
alter table culturas
  add column if not exists continente text;

-- 3) Classificação inicial automática — cobre os casos óbvios.
--    Isso é só um PONTO DE PARTIDA: revise a tabela "Culturas
--    cadastradas" no admin depois de rodar, porque nomes/variações
--    que eu não previ aqui vão continuar como false.

-- 3a) Tudo que já está marcado como continente = 'africa'
update culturas set raiz_africana = true
where continente = 'africa';

-- 3b) Tradições afro-diaspóricas formadas nas Américas — pega pelo
--     nome, com variações comuns de acentuação/grafia
update culturas set raiz_africana = true
where nome ilike any (array[
  '%candombl%', '%umbanda%', '%vodum%', '%vodou%', '%vudu%',
  '%santer%', '%jurema%', '%quimbanda%', '%macumba%',
  '%iorub%', '%nag%', '%bantu%', '%banto%', '%jeje%',
  '%congo%', '%angola%', '%preto-velho%', '%pretos-velhos%',
  '%kongo%', '%ewe%', '%fon%'
]);

-- 3c) Idem, mas pela região de origem (cobre entradas onde o nome
--     não denuncia a origem africana diretamente)
update culturas set raiz_africana = true
where regiao_origem ilike '%áfrica%' or regiao_origem ilike '%africa%';

-- 4) Conferir o resultado antes de fechar (rode manualmente e
--    olhe a lista — qualquer coisa fora do esperado, corrige na mão
--    pelo admin, aba Culturas)
-- select nome, continente, regiao_origem, raiz_africana
-- from culturas
-- order by raiz_africana desc, nome;
