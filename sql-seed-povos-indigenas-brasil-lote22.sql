-- ============================================================
-- Povos indígenas do Brasil, LOTE 22 de N.
--
-- Continuação dos lotes 1 a 21, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- rio Madeira (Parintintin/Kagwahiva) e o rio Paru de Leste, Pará
-- (Apalaí).
--
-- Nota: Apalaí é outro caso, como Palikur, Kambeba e Tupiniquim
-- antes, de conversão evangélica documentada substituindo boa
-- parte da liderança religiosa tradicional, registrado sem
-- amenizar.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Parintintin (Kagwahiva)',
    'parintintin-kagwahiva',
    'Entre os rios Madeira e Marmelos, município de Humaitá, sudeste do Amazonas',
    'Autodenominam-se Kagwahiva, "nós, a gente", nome que abrange também os Tenharim, Diahói, Amondawa e Uru-eu-wau-wau, grupos de mesma origem e organização social. "Parintintin" é apelido dado pelos rivais Munduruku, e significa "inimigo" na língua deles. A sociedade se organiza em metades exogâmicas batizadas com nomes de pássaros. A tradição oral do povo narra uma longa migração desde uma "terra sem água", subindo um rio tão largo que não se enxergavam as margens, o que sugere origem costeira antes de chegarem ao Madeira.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 69 from culturas)
  ),
  (
    'Apalaí (Aparai)',
    'apalai-aparai',
    'Rio Paru de Leste, norte do Pará, fronteira com Suriname e Guiana Francesa',
    'Convivem há cerca de cem anos com o povo Wayana nas mesmas aldeias, casando-se entre si, mas mantêm identidades distintas e rejeitam o termo "Wayana-Aparai", às vezes usado de fora para tratá-los como um só povo. A partir de 1962, missionários da Sociedade Internacional de Linguística traduziram o Novo Testamento para a língua apalaí e formaram pastores indígenas, que hoje conduzem os cultos evangélicos nas aldeias, ao lado do que restou da liderança religiosa tradicional.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 70 from culturas)
  )
on conflict (slug) do nothing;
