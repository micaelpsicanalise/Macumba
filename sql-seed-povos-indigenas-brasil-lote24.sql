-- ============================================================
-- Povos indígenas do Brasil, LOTE 24 de N.
--
-- Continuação dos lotes 1 a 23, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- nordeste da Bahia (Kiriri) e Rodelas, norte da Bahia (Tuxá).
--
-- Bônus: linhagem real entre os dois: os Kiriri aprenderam o
-- Toré numa visita aos Tuxá em 1974, documentada na literatura
-- antropológica. Mesmo padrão já usado com Potiguara/Tremembé e
-- a Jurema Sagrada nos lotes 5 e 7.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Kiriri',
    'kiriri',
    'Mirandela, município de Banzaê, e aldeia Sapé, nordeste da Bahia',
    'Em 1974, lideranças Kiriri organizaram uma caravana de cerca de cem pessoas até a Terra Indígena Tuxá, em Rodelas, oficialmente para um jogo de futebol, mas com o real objetivo de assistir ao Toré praticado por aquele povo e aprendê-lo. A jurema usada no ritual não é nativa da região, mais fria e alta que seu habitat original; sementes foram trazidas da Bahia e plantadas nas aldeias. A "dona da ciência", curandeira responsável por orientar o pajé sobre os elementos rituais, é figura central na condução do Toré Kiriri.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 73 from culturas)
  ),
  (
    'Tuxá',
    'tuxa',
    'Rodelas, norte da Bahia, às margens do rio São Francisco',
    'Autoidentificam-se como "tribo Tuxá, nação Prokámon, caboclos arco e flecha e maracá". Habitavam a Ilha da Viúva, no rio São Francisco, seu território agrícola e sagrado, submerso em 1988 pela Usina Hidrelétrica de Itaparica, o que forçou a transferência de todo o povo para outras áreas. Praticam o Toré e o Particular, cerimônia mais fechada restrita a adultos casados, com uso mais intenso de jurema e fumo, cânticos, cachimbos rituais e um apito de madeira que atrai as forças protetoras da aldeia.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 74 from culturas)
  )
on conflict (slug) do nothing;

-- Linhagem: Kiriri aprenderam o Toré com os Tuxá em 1974
insert into culturas_linhagem (cultura_id, origem_id, rota)
select c.id, o.id, 'aprendeu o Toré numa visita à Terra Indígena Tuxá em 1974'
from culturas c, culturas o
where c.nome ilike '%Kiriri%' and c.nome not ilike '%Xukuru%' and o.nome ilike '%Tuxá%'
on conflict (cultura_id, origem_id) do nothing;
