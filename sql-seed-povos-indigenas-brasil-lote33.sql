-- ============================================================
-- Povos indígenas do Brasil, LOTE 33 de N.
--
-- Continuação dos lotes 1 a 32, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre um
-- caso diferente dos anteriores: o Warao, povo venezuelano que
-- migrou em massa para o Brasil a partir de 2014 e hoje é tratado
-- pela imprensa como "nova etnia indígena brasileira"; e o Kulina
-- Pano, do Vale do Javari, Amazonas.
--
-- Nota: Kulina Pano NÃO é o mesmo povo que o Kulina/Madiha (família
-- linguística Arawá, população bem maior, ainda não cadastrado
-- neste compêndio). Mesmo padrão de nomes parecidos cobrindo
-- povos diferentes já visto com Katukina, Arara e Gavião.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Warao',
    'warao',
    'Originalmente delta do rio Orinoco, Venezuela; refugiados desde 2014 principalmente em Roraima, Amazonas e Pará',
    '"Povo da canoa", historicamente ligado à pesca e à agricultura no delta do Orinoco. Diante da crise humanitária na Venezuela, migraram em massa para o Brasil a partir de 2014 pela fronteira de Pacaraima; a imprensa brasileira já vem descrevendo o grupo como uma "nova etnia indígena" do país. No exílio, muitos redescobrem e reafirmam a própria língua, chegando a rezar o terço católico em warao, um caso vivo de tradição sendo reconstruída fora do território original.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 91 from culturas)
  ),
  (
    'Kulina Pano',
    'kulina-pano',
    'Rio Curuçá, Terra Indígena Vale do Javari, e cidade de Tabatinga, Amazonas',
    'Resultado da união entre famílias de dois igarapés, São Salvador e Kapishtana; o nome "Kulina Pano" foi dado por não indígenas para diferenciá-los de outro povo do mesmo nome, o Kulina (ou Madiha), de família linguística diferente e bem maior em população. Sofreram ataques históricos do povo Matsés, que roubava mulheres kulina pano em incursões armadas. Restam hoje pouco mais de trinta falantes da língua; segundo pesquisadores, o povo provavelmente já não pratica mais sua religião tradicional, tendo assimilado boa parte da cultura regional envolvente.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 92 from culturas)
  )
on conflict (slug) do nothing;
