-- ============================================================
-- Povos indígenas do Brasil, LOTE 18 de N.
--
-- Continuação dos lotes 1 a 17, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Alto Xingu (Kuikuro, Kalapalo) e o vale do rio Maici, entre
-- Amazonas e Rondônia (Pirahã).
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Kuikuro',
    'kuikuro',
    'Bacia dos rios Culuene, Buriti e Curisevo, Alto Xingu, Mato Grosso',
    'Hoje o povo mais numeroso do Alto Xingu, parte do subsistema linguístico karib alto-xinguano junto com Kalapalo, Matipu e Nahukuá. Produzem os colares e cintos de caramujo usados no Uluki, sistema tradicional de trocas entre aldeias que, segundo o mito, foi ensinado pelo herói Kahinguka a partir de uma escolha de objetos oferecida pelo deus-sol Taugi a cada povo do Alto Xingu.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 58 from culturas)
  ),
  (
    'Kalapalo',
    'kalapalo',
    'Bacia do rio Culuene, Alto Xingu, Mato Grosso',
    'Classificam seus rituais públicos em duas categorias: egitsu, que reúne convidados de outras aldeias, como o Kuarup (cerimônia funerária que celebra líderes hereditários mortos) e o Ipoñe (ritual masculino de perfuração labial); e undufe, de caráter mais interno à aldeia. O Yamurikumalu, festa conduzida pelas mulheres, e o Kagutu, sua contraparte masculina, também fazem parte do calendário ritual do povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 59 from culturas)
  ),
  (
    'Pirahã',
    'piraha',
    'Vale do rio Maici, entre Amazonas e Rondônia',
    'Autodenominam-se hiaitsiihi. Falantes do único idioma sobrevivente do tronco mura, sua língua não tem palavras para números exatos, apenas noções relativas de pouco e muito, e não possui mito de criação: acreditam que o céu e a terra sempre existiram. Ainda assim, têm cosmologia própria organizada em camadas de existência e creem em pequenos espíritos que se manifestam no ambiente através de experiência pessoal direta, não de narrativa transmitida entre gerações.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 60 from culturas)
  )
on conflict (slug) do nothing;
