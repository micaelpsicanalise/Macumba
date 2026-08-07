# Handoff Jogo de Búzios (Terreiro Digital / Umbanda)

Contexto pra quem está entrando no meio: o Micael pediu um jogo de búzios pra
colocar no repo `micaelpsicanalise/Umbanda`. Este documento resume o que foi
feito, como as peças se conectam, e o que ainda falta — pra você (outra
instância do Claude) não duplicar trabalho nem quebrar o que já existe.

## Arquivos entregues

| Arquivo | O que é | Status |
|---|---|---|
| `jogo-buzios.html` | Página pública do jogo (lançar búzios + histórico) | Funcional |
| `admin-umbanda.html` | Admin existente do Micael (Guias/Conteúdos), com uma 3ª aba **Búzios** adicionada | Funcional — precisa substituir o arquivo que já está publicado em `admin/index/` |
| `supabase-buzios-schema.sql` | Cria a tabela `buzios_leituras` + RLS | **Ainda não rodado** no Supabase |
| `index.html` | Landing page, com nova seção `#buzios` de destaque + link no menu | Funcional |

Não mexi em `app-umbanda.html` nem em nenhuma outra parte do admin
(Guias/Conteúdos, upload de áudio via Worker) além de acrescentar a aba nova —
tudo que já existia continua igual.

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
