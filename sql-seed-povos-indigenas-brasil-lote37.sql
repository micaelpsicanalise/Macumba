-- ============================================================
-- Povos indígenas do Brasil, LOTE 37 de N.
--
-- Continuação dos lotes 1 a 36, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre dois
-- povos do complexo do baixo Oiapoque, Amapá (Galibi Marworno e
-- Karipuna), região onde também vivem Palikur (já cadastrado) e
-- Galibi Kali'na (ainda não cadastrado).
--
-- Nota: Galibi Marworno é outro caso, como Palikur, Kambeba e
-- Tupiniquim antes, de descontinuidade ritual documentada (o Turé
-- não é mais praticado, a aldeia não tem pajé ativo), registrado
-- sem amenizar.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Galibi Marworno',
    'galibi-marworno',
    'Terra Indígena Uaçá, rio Uaçá, município de Oiapoque, norte do Amapá',
    'O Turé, ritual tradicional realizado na época da seca e voltado aos espíritos karuanãs, era considerado "coisa muito séria e perigosa" pelo próprio povo, exigindo regras rígidas para não trazer desgraça em vez de alegria. Não é mais praticado atualmente: a aldeia não tem pajé ativo, já que os últimos se converteram ao evangelismo ou deixaram de frequentar a comunidade. O catolicismo popular, somado a uma vertente engajada de influência progressista, é hoje a religiosidade predominante entre o povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 97 from culturas)
  ),
  (
    'Karipuna do Amapá',
    'karipuna-amapa',
    'Rio Curipi, Terra Indígena Uaçá, norte do Amapá',
    'Falam o kheuol, língua crioula de base francesa também usada por outros povos da região. Praticam um catolicismo popular que convive com rituais xamânicos, diferente da vertente mais próxima do catolicismo romano seguida pelos vizinhos Galibi do Oiapoque. Desde os anos 1980, missões evangélicas promovidas por Palikur convertidos vêm disputando fiéis com essas tradições, e cada conversão é vivida pelas famílias como uma linha divisória clara entre "antes" e "depois" de Cristo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 98 from culturas)
  )
on conflict (slug) do nothing;
