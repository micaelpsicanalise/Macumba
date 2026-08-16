# Handoff Jogo de Búzios (Terreiro Digital / Macumba)

Contexto pra quem está entrando no meio: o Micael pediu um jogo de búzios pra
colocar no repo `micaelpsicanalise/Macumba` (renomeado de `Umbanda` em
agosto/2026 — o projeto virou um compêndio mais amplo de hierofania, não só
Umbanda; ver seção **Rebranding e fusão com "raízes"** no fim deste
documento). Este documento resume o que foi feito, como as peças se
conectam, e o que ainda falta — pra você (outra instância do Claude) não
duplicar trabalho nem quebrar o que já existe.

## Arquivos entregues

| Arquivo | O que é | Status |
|---|---|---|
| `jogo-buzios.html` | Página pública do jogo (lançar búzios + histórico) | Funcional |
| `admin-umbanda.html` | Admin existente do Micael (Guias/Conteúdos), com uma 3ª aba **Búzios** adicionada | Funcional — precisa substituir o arquivo que já está publicado em `admin/index/` |
| `supabase-buzios-schema.sql` | Cria a tabela `buzios_leituras` + RLS | **Ainda não rodado** no Supabase |
| `index.html` | Landing page, com nova seção `#buzios` de destaque + link no menu | Funcional |

Não mexi em nenhuma outra parte do admin (Guias/Conteúdos, upload de áudio
via Worker) além de acrescentar a aba nova — tudo que já existia continua
igual. (`app-umbanda.html`, um protótipo órfão sem link no site, foi
removido do repo em agosto/2026 — ver seção final.)

## Como funciona, de ponta a ponta

1. **`jogo-buzios.html`** — o visitante escolhe sistema (16 ou 18 búzios),
   clica em lançar, e os búzios caem espalhados dentro de um círculo (posição
   aleatória por área + rotação, sem grade). O app calcula quantos abriram e
   busca a leitura correspondente na tabela `buzios_leituras` do Supabase
   (`select` público, sem login). Se não achar leitura cadastrada pra aquele
   número, mostra uma **leitura genérica algorítmica** (baseada só na
   proporção aberto/fechado — não inventei nomes de Odù de nenhuma tradição
   específica, isso fica por conta do Micael/terreiro). O histórico pessoal de
   jogadas fica salvo em `localStorage` (`buzios_historico_v1`), local ao
   navegador de quem está jogando — não vai pro banco.

2. **`admin-umbanda.html` → aba Búzios** — o Micael loga com a conta Google
   dele (mesmo fluxo que já existia pras outras abas, checado contra
   `ADMIN_UUID`), escolhe sistema 16/18, seleciona quantos búzios abertos, e
   preenche título + texto da leitura. Salva com `upsert` na tabela
   `buzios_leituras` (chave única `sistema + abertos`). A tabela abaixo do
   formulário lista o que já está cadastrado pra aquele sistema.

3. **`index.html`** — seção nova `#buzios` só de marketing/apresentação, com
   um visual decorativo estático (búzios flutuando dentro de um círculo, CSS
   puro) e um botão que linka pra `jogo-buzios.html`.

## Config já preenchida

`jogo-buzios.html` e `admin-umbanda.html` já usam as credenciais reais do
projeto Supabase do Micael (a mesma `publishable/anon key` que já estava no
admin original — é uma chave pública por design, sem problema estar no
client):

```
SUPABASE_URL = https://aewcxqzpbipwcdpsjfht.supabase.co
SUPABASE_ANON_KEY = sb_publishable_mINpOQLVbi0pilHc9bEtBA_l1a0o6c6
ADMIN_UUID = af619e44-1049-4ebd-86b4-4b4fa3bce94b
```

## Modelo de dados (Supabase)

Tabela nova, criada pelo `supabase-buzios-schema.sql` (**ainda precisa ser
rodado** no SQL Editor do projeto):

```
buzios_leituras
  id          uuid (pk)
  sistema     smallint  -- 16 ou 18
  abertos     smallint  -- 0..sistema
  titulo      text
  texto       text
  updated_at  timestamptz
  unique (sistema, abertos)
```

RLS: leitura liberada pra todo mundo (`select` público, é o que o jogo usa
sem login); escrita só permitida se `auth.uid()` bater com o `ADMIN_UUID`
acima — não usei `auth.role() = 'authenticated'` sozinho porque o login é via
Google OAuth aberto, então qualquer conta Google conseguiria logar (o filtro
de admin no JS do painel não protege o banco por si só).

## Pendências / próximos passos

- **Rodar o `supabase-buzios-schema.sql`** no projeto — sem isso a tabela não
  existe e tanto o jogo quanto o admin vão falhar silenciosamente ao
  buscar/salvar leituras (o jogo cai pro genérico, o admin mostra erro).
- **Nenhuma leitura real cadastrada ainda** — hoje todo resultado usa a
  leitura genérica algorítmica até o Micael preencher via admin.
- **Imagens reais dos búzios/base** — o Micael disse que vai fazer arte
  realista da base e dos búzios abertos/fechados. Deixei os pontos de troca
  comentados no CSS de `jogo-buzios.html`:
  ```css
  .buzios-circle{ background-image: url('assets/base-buzios.png'); }
  .buzio.aberto{ background-image: url('assets/buzio-aberto.png'); }
  .buzio.fechado{ background-image: url('assets/buzio-fechado.png'); }
  ```
  **Atenção**: o visual decorativo da seção `#buzios` em `index.html` usa
  classes parecidas mas *separadas* (`.shell.aberto` / `.shell.fechado`,
  não `.buzio`) — são elementos diferentes, hardcoded na landing pra
  ilustração estática. Se for trocar por imagens reais, provavelmente vale
  atualizar os dois lugares.
- **Caminho do link "Jogar os búzios"** em `index.html` aponta pra
  `jogo-buzios.html` relativo à raiz — ajustar se o arquivo for hospedado em
  outra pasta.
- **Nome/local do arquivo admin** — o Micael mencionou que o admin real fica
  em `admin/index/` no repo (provavelmente `admin/index/index.html` ou
  similar — não confirmei o nome exato do arquivo publicado). Entreguei como
  `admin-umbanda.html`; é esse conteúdo que deve substituir o que já está lá,
  só ajustar o nome/caminho na hora de subir.
- **Aba "Guias & Pontos"** dentro do admin não foi tocada — já existia
  funcional (guias + conteúdos + upload de áudio via Cloudflare Worker), só
  a aba Búzios foi adicionada do lado.

## Coisas que optei por NÃO fazer (e por quê)

- Não escrevi significados reais de Odù/tradição de jogo de búzios (nem
  Ifá/Nagô nem Angola) — isso varia entre casas e terreiros, então deixei a
  leitura genérica + admin editável em vez de inventar conteúdo doutrinário
  que poderia estar errado pra tradição do Micael.

## Rebranding e fusão com "raízes" (agosto/2026)

O projeto deixou de ser só sobre Umbanda: o Micael entende "hierofania"
(manifestação do sagrado através da matéria) como o eixo real do projeto,
cobrindo tanto tradições afro-diaspóricas quanto outras raízes que fazem
algo parecido (ex.: mongóis, ainu, aborígenes australianos). A partir disso:

- **Repo renomeado** de `micaelpsicanalise/Umbanda` para
  `micaelpsicanalise/Macumba` (o GitHub redireciona a URL antiga
  automaticamente). Descrição do repo também atualizada.
- **Branding trocado** de "Umbanda" pra "Macumba" em `index.html`,
  `app/index.html` e `admin/index.html` (títulos, meta tags, marca no nav) —
  mas **"Umbanda" continua existindo como uma das tradições dentro do
  compêndio** (ver `TRADICAO_NOME` em `app/index.html`), não foi apagada de
  lugar nenhum como conteúdo.
- **Página História fundida com o protótipo "raízes"**: existia um outro
  repo/protótipo chamado `raizes`, com um mapa mundi em SVG (culturas por
  continente + rotas de migração entre elas) e um campo `continente` na
  tabela `culturas` que o app do Macumba ainda não usava. Trouxe essa peça
  pra `app/index.html`:
  - `loadCatalogo()` agora também busca `culturas_migracoes`.
  - A view História tem toggle **Lista / Mapa** e filtro por continente.
  - No modo Lista, as culturas aparecem em dois blocos: **Culturas
    afro-diaspóricas** (`continente = 'africa'`) e **Outras raízes** (tudo
    o resto). Não criei coluna nova pra isso — reaproveitei o `continente`
    que a tabela `culturas` já tinha (populado quando o raízes foi criado).
  - O repo `raizes` em si **ficou intocado** por decisão explícita do
    Micael — ele ainda existe separado, só a peça de UI/lógica foi copiada
    pro Macumba, não removida de lá.
- **`app-umbanda.html`** (protótipo antigo na raiz do repo, sem link em
  nenhuma página do site — o site usa `app/index.html`) foi **deletado**.
- **Pendente, não resolvido ainda**: `AUDIO_WORKER_URL` em `admin/index.html`
  ainda aponta pro Cloudflare Worker `umbanda-audio-upload.micaelpsicanalise.workers.dev`.
  Renomear um Worker não é possível diretamente — é preciso criar um Worker
  novo (`macumba-audio-upload`, por exemplo), publicar o mesmo código nele,
  atualizar essa constante pra apontar pro novo endpoint, testar, e só depois
  apagar o Worker antigo.

## Camada "história" + aba "Comidas" (agosto/2026)

A pedido do Micael, a partir de um texto de referência sobre Ogum que ele
enviou, dois pedaços novos entraram no modelo de conteúdo:

- **Coluna `historia` em `guias`** — biografia longa do guia (origem,
  arquétipo, características), separada dos Itans avulsos. Renderiza como um
  card expansível ("Ler mais/menos") no topo do detalhe do guia, em
  `app/index.html`, antes da lista de conteúdos. Editável no admin, no
  formulário de guia, embaixo da Descrição curta.
- **`conteudos.tipo = 'receita'`** — novo tipo de conteúdo, pra comidas
  ritualísticas/oferendas (ex.: "Inhame com dendê e mel"). Vira uma aba nova
  na Biblioteca do app (**Comidas**, ao lado de Itans), com ícone 🍲 e abre
  no mesmo player de texto que já existia pra Itans (sem áudio obrigatório).
  Cadastrado no admin pelo mesmo formulário de Conteúdos, só trocando o Tipo.

Arquivos SQL:
- `sql-historia-comidas.sql` — migration (coluna `historia` em `guias`; nota
  sobre `conteudos.tipo` não ter constraint identificada neste repo, então
  `'receita'` já funciona sem alteração de schema — só rode a parte de
  constraint se o seu banco tiver um `check` que eu não vi aqui).
- `sql-seed-ogum-historia-comidas.sql` — exemplo populado pra Ogum
  (história + 2 Itans + 2 receitas), **texto reescrito com base no material
  que o Micael mandou**, não copiado literalmente. Serve de referência de
  tom/tamanho pra cadastrar os outros guias — não é conteúdo final revisado.

Não criei nada pra "história" nem "comidas" na página **História** (a dos
mapas/culturas) — são conceitos diferentes: aquela página é sobre culturas e
migrações; essa camada nova é sobre o guia individual, dentro da Biblioteca.

## Seção "Sobre o nome" na landing (agosto/2026)

Nova seção `#sobre-o-nome` em `index.html`, entre o hero e o mapa mundial
(`#mapa`), com link novo no menu. Ela existe pra deixar explícito, pra quem
chega no site, o porquê do nome do projeto — algo que até então só estava
documentado aqui no README (seção "Rebranding e fusão com raízes" acima),
não explicado pro visitante:

- Contextualiza que "macumba" foi historicamente usado de forma pejorativa/
  colonial, generalizando práticas afro-brasileiras distintas sob um único
  rótulo depreciativo.
- Define o uso do termo aqui como retomada intencional: **Macumba como
  sinônimo de Hierofania** — manifestação do sagrado através da matéria
  (ponto riscado, búzio, tambor, erva, oferenda).
- Deixa explícito que é esse princípio — não geografia nem uma tradição
  específica — que organiza o site, conectando com a lógica do mapa mundial
  logo abaixo (tradições afro-diaspóricas e outras raízes lado a lado, sem
  hierarquia entre si).

Texto escrito à mão pra essa entrega, baseado no conceito que o Micael já
tinha descrito (ver seção de Rebranding); não é cópia de nenhuma fonte
externa. Vale o Micael revisar o tom antes de publicar — é um texto sensível
(fala de racismo religioso/colonialismo), então merece o olhar dele, não só
o meu.

