-- ============================================================
-- Povos indígenas do Brasil, LOTE 5 de N.
--
-- Continuação dos lotes 1 a 4, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Tocantins (Xerente, Apinajé), o litoral da Paraíba (Potiguara)
-- e o Mato Grosso (Nambikwara).
--
-- Bônus: o Potiguara é ligado, via culturas_linhagem, à "Jurema
-- Sagrada / Catimbó" já cadastrada, já que os Potiguara estão
-- entre os povos indígenas de origem dessa tradição.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Xerente (Akwê)',
    'xerente-akwe',
    'Margem direita do rio Tocantins, próximo a Tocantínia, Tocantins',
    'Autodenominam-se Akwê. Povo Jê Central que mantém contato com não indígenas há cerca de 250 anos sem perder identidade étnica. A pintura corporal segue padrões que indicam clã e linhagem familiar. Celebram o Wakê (Festa de dar nomes), o Kuprê (homenagem aos mortos) e o Padi (Festa do Tamanduá Bandeira), além da corrida de toras de buriti.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 16 from culturas)
  ),
  (
    'Apinajé',
    'apinaje',
    'Município de Tocantinópolis, norte do Tocantins',
    'Povo Jê conhecido como grandes guerreiros desde os primeiros registros de contato, em 1774. O Pàrkapê (Tora Grande) marca o fim do luto: durante a cerimônia, os Mkarõ, espíritos ancestrais, se fazem presentes nas corridas de toras, que passam a representar os próprios mortos. O Mêkaprî é o ritual que busca fazer o espírito de um doente retornar ao corpo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 17 from culturas)
  ),
  (
    'Potiguara',
    'potiguara',
    'Litoral norte da Paraíba, região de Baía da Traição, Marcação e Rio Tinto',
    'Maior povo indígena do Nordeste brasileiro, com cerca de 17 mil pessoas. O Toré e o culto à Jurema Sagrada são suas marcas de espiritualidade, ligados aos encantados, entidades invisíveis, humanas e imortais que habitam a mata. Alhandra, na Paraíba, é considerada berço histórico do culto à jurema entre os povos do Nordeste.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 18 from culturas)
  ),
  (
    'Nambikwara',
    'nambikwara',
    'Noroeste do Mato Grosso e Rondônia, entre os rios Juruena e Guaporé',
    'Também chamados Anunsu, sua autodenominação. Tornaram-se referência na etnologia mundial após serem estudados pelo antropólogo Claude Lévi-Strauss, que dedicou parte de "Tristes Trópicos" a esse povo. O ofício de xamã é considerado necessário à comunidade mas perigoso a quem o exerce: quem não suporta as restrições exigidas para manter o poder xamânico corre risco de sofrer a vingança dos espíritos dos mortos.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 19 from culturas)
  )
on conflict (slug) do nothing;

-- Linhagem: Potiguara como um dos povos de origem da Jurema Sagrada
insert into culturas_linhagem (cultura_id, origem_id, rota)
select c.id, o.id, 'povo indígena de origem da Jurema Sagrada, litoral norte da Paraíba'
from culturas c, culturas o
where c.nome ilike '%Jurema%' and o.nome ilike '%Potiguara%'
on conflict (cultura_id, origem_id) do nothing;
