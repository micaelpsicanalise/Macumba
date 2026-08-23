-- ============================================================
-- Povos indígenas do Brasil, LOTE 25 de N.
--
-- Continuação dos lotes 1 a 24, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre
-- Sergipe (Xokó) e o sudeste do Pará (Gavião Parkatêjê).
--
-- Notas:
-- 1) Xokó e Kariri-Xocó (já cadastrado no lote 5) têm origem
--    parcialmente comum: parte dos Xokó se fundiu com os Kariri
--    há cerca de cem anos, formando o Kariri-Xocó em Alagoas. Não
--    criei linhagem entre os dois porque é uma cisão/fusão entre
--    ramos, não uma relação de ancestralidade direta, mesmo
--    critério já usado com Tembé/Guajajara no lote 13.
-- 2) Gavião Parkatêjê NÃO é o mesmo povo do Gavião Ikolen
--    (lote 19, tronco tupi-mondé, Rondônia). "Gavião" foi apelido
--    genérico dado por colonizadores a vários povos não
--    relacionados entre si, considerados belicosos.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Xokó (Ilha de São Pedro)',
    'xoko-ilha-sao-pedro',
    'Ilha de São Pedro e Caiçara, município de Porto da Folha, Sergipe',
    'Parte dos Xokó se fundiu, há cerca de cem anos, com os Kariri de Porto Real do Colégio, dando origem ao povo Kariri-Xocó, em Alagoas. Os Xokó que permaneceram em Sergipe reconquistaram a Ilha de São Pedro em 1979, após décadas de disputa de terra, e celebram a data todo ano com o Toré, o Ouricuri e pintura corporal de jenipapo. Ao longo da convivência histórica com pessoas negras escravizadas na região, incorporaram também a folia afro, sobretudo o samba de coco, às próprias festas.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 75 from culturas)
  ),
  (
    'Gavião Parkatêjê',
    'gaviao-parkateje',
    'Terra Indígena Mãe Maria, município de Bom Jesus do Tocantins, sudeste do Pará',
    'Povo Timbira; "Gavião" foi apelido genérico dado por colonizadores a vários povos Timbira considerados belicosos. Guerras internas e doenças quase os extinguiram; restavam 15 pessoas quando, em 1966, aceitaram um acordo de realocação do Serviço de Proteção ao Índio para a Terra Mãe Maria. Entre 1960 e 1983, deixaram de praticar seus ritos originais depois do contato mais intenso com não indígenas; desde então, vêm recriando essas cerimônias, hoje chamadas por eles mesmos de "brincadeiras".',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 76 from culturas)
  )
on conflict (slug) do nothing;
