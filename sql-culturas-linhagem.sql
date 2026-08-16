-- ============================================================
-- Linhagem entre culturas — substitui a lógica de classificação
-- "afro-diaspórica" baseada em rótulo manual (raiz_africana) por
-- uma cadeia de origem rastreável, cultura a cultura.
--
-- Por quê: `continente` é geografia (onde a tradição existe hoje),
-- não ancestralidade. Candomblé, Umbanda, Vodum e Santería nasceram
-- nas Américas mas têm raiz africana — e um boolean sim/não não
-- diz DE ONDE, exatamente, cada uma vem. O manifesto do projeto
-- (seção V) é explícito sobre isso: "nomear, quando se sabe, a
-- linhagem exata" é o oposto de generalizar com um rótulo único.
-- ============================================================

-- 1) Tabela de linhagem: liga uma cultura (ex.: "Candomblé Ketu")
--    à(s) cultura(s) de origem (ex.: "Iorubá"), com uma rota textual
--    livre pra descrever a transmissão. Muitos-pra-muitos: uma
--    tradição pode ter mais de uma raiz.
create table if not exists culturas_linhagem (
  id uuid primary key default gen_random_uuid(),
  cultura_id uuid not null references culturas(id) on delete cascade,
  origem_id uuid not null references culturas(id) on delete cascade,
  rota text,                    -- ex.: "trazida via tráfico negreiro, séc. XVIII"
  ordem int not null default 0,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  constraint culturas_linhagem_sem_autorreferencia check (cultura_id <> origem_id),
  constraint culturas_linhagem_unica unique (cultura_id, origem_id)
);

create index if not exists culturas_linhagem_cultura_idx on culturas_linhagem(cultura_id);
create index if not exists culturas_linhagem_origem_idx on culturas_linhagem(origem_id);

-- 2) RLS: eu não sei que política vocês usam hoje em `culturas` (não
--    tenho acesso ao banco daqui). Se `culturas` tem RLS habilitado,
--    espelhe a MESMA policy aqui, trocando só o nome da tabela —
--    não inventei uma regra nova porque isso é fácil de deixar a
--    tabela mais aberta ou mais fechada do que o resto do catálogo
--    por engano. Exemplo de como checar o que já existe:
-- select * from pg_policies where tablename = 'culturas';

-- 3) O campo `raiz_africana` em `culturas` NÃO foi removido.
--    Ele passa a servir como fallback manual: uma cultura conta
--    como afro-diaspórica se (a) continente = 'africa', OU (b) tem
--    um ancestral em `culturas_linhagem` que está na África, OU
--    (c) `raiz_africana = true` como marcação manual provisória,
--    pra quando a linhagem exata ainda não foi cadastrada.
--    Com o tempo, o ideal é que (c) vá sendo substituído por (b) —
--    linhagem real em vez de rótulo.

-- 4) Exemplo de uso, depois de rodar isto (ajuste os slugs pro que
--    você já tem cadastrado):
-- insert into culturas_linhagem (cultura_id, origem_id, rota)
-- select c.id, o.id, 'trazida via tráfico negreiro, séc. XVIII, reconfigurada na Bahia'
-- from culturas c, culturas o
-- where c.slug = 'candomble-ketu' and o.slug = 'iorubá';
