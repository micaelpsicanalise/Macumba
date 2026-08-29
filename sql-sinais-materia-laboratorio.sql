-- Laboratório de Hierofania
-- Tabela genérica que cobre as 6 tradições de leitura da matéria
-- (búzios, runas, Dogon, tasseografia, I Ching, tarô), em vez de
-- uma tabela por tradição. O campo "configuracao" guarda o formato
-- específico de cada sistema em JSON.

create table if not exists sinais_materia (
  id uuid primary key default gen_random_uuid(),
  tradicao text not null check (tradicao in (
    'buzios', 'runas', 'dogon', 'tasseografia', 'iching', 'tarot'
  )),

  -- identificador legível do sinal dentro da tradição
  -- ex: "Odu Ogbe", "Fehu", "Rasto duplo à esquerda", "Folha em espiral",
  -- "Hexagrama 1, Qian", "O Enforcado"
  nome_sinal text not null,

  -- como a matéria se apresentou fisicamente, descrito de forma neutra
  -- ex: { "abertos": 8, "total": 16 } ou { "linhas": ["yang","yin","yang","yang","yin","yin"] }
  configuracao jsonb not null,

  -- mito ou história associada a este sinal (Itã, saga nórdica,
  -- narrativa Dogon, tradição oral do chá, texto do I Ching, arcano)
  mito_relacionado text,

  -- leitura simbólica descritiva, sem promessa de previsão
  leitura_simbolica text,

  -- provocação psicanalítica/terapêutica: pergunta ou reflexão
  -- para o usuário levar pra estudo, nunca uma resposta fechada
  provocacao_psicanalitica text,

  -- fonte ou referência cultural, pra dar crédito e rastreabilidade
  fonte_cultural text,

  ativo boolean not null default true,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create index if not exists idx_sinais_materia_tradicao on sinais_materia (tradicao);
create index if not exists idx_sinais_materia_ativo on sinais_materia (ativo);

alter table sinais_materia enable row level security;

drop policy if exists "sinais_materia_select_publico" on sinais_materia;
create policy "sinais_materia_select_publico"
  on sinais_materia for select
  using (ativo = true);

-- Escrita segue o mesmo padrão das outras tabelas do projeto:
-- liberada só via service role (painel admin), não pelo anon key.
