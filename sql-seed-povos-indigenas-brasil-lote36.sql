-- ============================================================
-- Povos indígenas do Brasil, LOTE 36 de N.
--
-- Continuação dos lotes 1 a 35, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- médio rio Solimões (Miranha) e o Alto Rio Negro (Bará), ambos
-- no Amazonas.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Miranha',
    'miranha',
    'Médio rio Solimões e rio Japurá, região de Tefé, Amazonas, também Colômbia e Peru',
    'Povo da família linguística Witoto (aparentada ao Bora), parte de um complexo cultural mais amplo cuja maior população vive na Colômbia e no Peru. Historicamente descritos por cronistas coloniais como "bárbaros" e acusados de vender prisioneiros de guerra como escravos, um retrato que ajudou a justificar violência contra o povo. Usam ritualmente tabaco e coca, e tradicionalmente se comunicavam à distância através de um grande tambor entalhado num único tronco de madeira.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 95 from culturas)
  ),
  (
    'Bará',
    'bara',
    'Alto rio Tiquié, Alto Rio Negro, noroeste do Amazonas',
    'Um dos povos do complexo multiétnico do Uaupés, que também inclui Tukano, Desana, Tuyuka e outros, unidos por exogamia linguística e um corpus mitológico comum. Compartilham um mito de origem em que uma Anaconda ancestral entrou no mundo por uma "porta da água" a leste e subiu os rios Negro e Uaupés carregando dentro do próprio corpo os ancestrais de toda a humanidade, que foram nascendo ao longo do caminho, em diferentes pontos do rio, dando origem aos diferentes povos da região.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 96 from culturas)
  )
on conflict (slug) do nothing;
