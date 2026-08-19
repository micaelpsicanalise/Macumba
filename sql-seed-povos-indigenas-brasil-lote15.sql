-- ============================================================
-- Povos indígenas do Brasil, LOTE 15 de N.
--
-- Continuação dos lotes 1 a 14, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- norte do Pará (Wayana), o Amapá (Wajãpi) e o Xingu (Asuriní).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Wayana',
    'wayana',
    'Norte do Pará, Parque Indígena do Tumucumaque, fronteira com Suriname e Guiana Francesa',
    'Povo de língua karib cuja concepção de pessoa se divide em três partes: o corpo (punu), o princípio vital (uzenu) e a sombra (omore), projeção material do uzenu que pode se soltar em estado gasoso. O uzenu pode se separar do corpo por ataque de um espírito chamado jorokó durante o sono, por feitiço de pajé, por um susto ou no momento da morte, o que torna a pessoa vulnerável.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 47 from culturas)
  ),
  (
    'Wajãpi',
    'wajapi',
    'Entre os rios Oiapoque, Jari e Araguari, Amapá',
    'A vida cerimonial gira em torno de grandes ciclos rituais, como a festa do milho, a festa do mel e as danças dos peixes, quase sempre regadas a caxiri, bebida fermentada de mandioca. O marari, chocalho xamânico que se ilumina e abriga um espírito, é tão perigoso que só pode ser manuseado pelo pajé que o possui; fora de uso, fica guardado no topo da casa. O grafismo corporal e gráfico wajãpi é reconhecido pela Unesco como Patrimônio Cultural Imaterial da Humanidade.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 48 from culturas)
  ),
  (
    'Asuriní do Xingu',
    'asurini-do-xingu',
    'Entre os rios Xingu e Bacajá, Terra Indígena Koatinemo, Pará',
    'Quase extintos após o contato forçado na década de 1970, reduzidos a menos de 50 pessoas, hoje somam mais de 180. A cerâmica pintada com grafismos geométricos e acabada com resina de jatobá é sua marca mais reconhecida, ao lado da pintura corporal com jenipapo. Os desenhos derivam do padrão tayngava, ligado ao princípio vital compartilhado por espíritos e humanos e manipulado pelos xamãs (pa''zé) nos rituais; segundo o mito, foi o ser Anhynga kwasiat quem deu esses desenhos aos homens.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 49 from culturas)
  )
on conflict (slug) do nothing;
