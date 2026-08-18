-- ============================================================
-- Seed: povos americanos ainda não cadastrados em `culturas`,
-- com foco em quem tem prática documentada de manifestar o
-- sagrado através de matéria (o critério do próprio projeto).
-- Evita duplicar o que já existe (Haudenosaunee, Quéchua e Aimará,
-- Guarani, Diné, Inuit, Povos indígenas do Brasil/linha de Caboclo).
--
-- Cobertura: América do Norte, América Central/Caribe, América do
-- Sul. `raiz_africana` fica false em todos (não são afro-diaspóricos).
-- `regiao_origem` e `resumo` seguem o estilo do resto da tabela.
--
-- Revise antes de considerar definitivo: são resumos curtos,
-- compilados de conhecimento histórico/antropológico geral, não
-- substituem checagem por quem tem mais proximidade com cada povo,
-- principalmente Selk'nam e Charrúa, cuja história recente envolve
-- genocídio colonial direto, tema que merece cuidado no texto final.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Anishinaabe (Ojibwe)',
    'anishinaabe',
    'Região dos Grandes Lagos, atuais EUA e Canadá',
    'Povo da Sociedade da Grande Medicina (Midewiwin), que usa objetos e cerimônias de cura como manifestação direta do sagrado. A roda-medicinal e o cachimbo sagrado (pipe) são centrais nas práticas.',
    '[]'::jsonb, 'america-norte', false, true,
    (select coalesce(max(ordem), 0) + 1 from culturas)
  ),
  (
    'Lakota (Sioux)',
    'lakota-sioux',
    'Grandes Planícies da América do Norte, atuais Dakotas, Nebraska e Montana',
    'Povo das Grandes Planícies, conhecido pela Dança do Sol (Sun Dance) e pelo uso do cachimbo sagrado (chanupa) como objeto ritual. A busca de visão através de jejum solitário (hanblecheyapi) é outra prática central.',
    '[]'::jsonb, 'america-norte', false, true,
    (select coalesce(max(ordem), 0) + 2 from culturas)
  ),
  (
    'Hopi',
    'hopi',
    'Sudoeste dos EUA, atual Arizona',
    'Povo Pueblo conhecido pelas bonecas kachina, esculturas de madeira que manifestam materialmente os espíritos, entregues às crianças como parte da transmissão religiosa. As cerimônias de dança com máscara marcam o calendário agrícola sagrado.',
    '[]'::jsonb, 'america-norte', false, true,
    (select coalesce(max(ordem), 0) + 3 from culturas)
  ),
  (
    'Maya',
    'maya',
    'Mesoamérica, atuais México, Guatemala, Belize e Honduras',
    'Civilização com calendário sagrado próprio (Tzolk''in) e cenotes tratados como portais para o mundo espiritual. Templos-pirâmide eram palco de rituais que ligavam tempo, astronomia e o sagrado.',
    '[]'::jsonb, 'america-central-caribe', false, true,
    (select coalesce(max(ordem), 0) + 4 from culturas)
  ),
  (
    'Mexica (Astecas)',
    'mexica-astecas',
    'Vale do México, atual Cidade do México',
    'Povo do Templo Mayor, onde ofertas materiais marcavam o culto a divindades como Quetzalcoatl e Huitzilopochtli. O calendário ritual xiuhpohualli organizava as cerimônias ao longo do ano.',
    '[]'::jsonb, 'america-central-caribe', false, true,
    (select coalesce(max(ordem), 0) + 5 from culturas)
  ),
  (
    'Taíno',
    'taino',
    'Grandes Antilhas, atuais Cuba, Haiti, República Dominicana e Porto Rico',
    'Povo originário do Caribe, conhecido pelos cemís, esculturas em pedra, madeira ou osso que guardavam espíritos ancestrais. Sua cultura material influenciou sincretismos religiosos posteriores na região.',
    '[]'::jsonb, 'america-central-caribe', false, true,
    (select coalesce(max(ordem), 0) + 6 from culturas)
  ),
  (
    'Mapuche',
    'mapuche',
    'Sul do Chile e da Argentina',
    'Povo em que a machi (líder espiritual) conduz cerimônias junto ao rewe, um poste ritual escalado como eixo entre os mundos. O Ngillatun é a principal cerimônia coletiva de pedido e agradecimento.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 7 from culturas)
  ),
  (
    'Yanomami',
    'yanomami',
    'Amazônia, atuais Brasil e Venezuela',
    'Povo cuja cosmologia inclui os xapiri, espíritos auxiliares acessados por xamãs através do yãkoana, um rapé sagrado inalado em cerimônia. A floresta é tratada como tecido vivo do sagrado.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 8 from culturas)
  ),
  (
    'Wayuu',
    'wayuu',
    'Península da Guajira, atuais Colômbia e Venezuela',
    'Povo em que os sonhos são lidos como comunicação direta com espíritos ancestrais. A tecelagem, sobretudo a mochila wayuu, carrega valor ritual, não é vista como artesanato decorativo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 9 from culturas)
  ),
  (
    'Muísca',
    'muisca',
    'Altiplano Cundiboyacense, atual Colômbia',
    'Povo conhecido pela cerimônia da balsa dourada, oferendas de ouro lançadas em lagoas sagradas como a de Guatavita, prática que deu origem à lenda de El Dorado.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 10 from culturas)
  ),
  (
    'Selk''nam',
    'selknam',
    'Terra do Fogo, atuais Argentina e Chile',
    'Povo da cerimônia Hain, ritual de iniciação masculina marcado por pintura corporal como manifestação visível do sagrado. Foi alvo de genocídio colonial no final do século XIX e início do XX; descendentes hoje trabalham pela revitalização cultural.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 11 from culturas)
  ),
  (
    'Charrúa',
    'charrua',
    'Atual Uruguai e sul do Brasil',
    'Povo cuja cultura material e religiosa foi amplamente apagada por genocídio colonial. Comunidades descendentes hoje trabalham pela recuperação de práticas e memória ancestral.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 12 from culturas)
  )
on conflict (slug) do nothing;
