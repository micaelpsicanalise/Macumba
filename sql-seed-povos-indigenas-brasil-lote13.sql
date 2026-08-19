-- ============================================================
-- Povos indígenas do Brasil, LOTE 13 de N.
--
-- Continuação dos lotes 1 a 12, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Rio Grande do Sul (Guarani Mbya), o noroeste do Mato Grosso
-- (Paresí/Haliti) e o rio Gurupi, entre Pará e Maranhão (Tembé).
--
-- Nota: Tembé compartilha com o Guajajara, já cadastrado no
-- lote 2, o mesmo tronco Tenetehara e o mesmo herói mítico Maíra.
-- Não criei linhagem entre os dois porque não é uma relação de
-- ancestralidade, e sim de parentesco entre ramos paralelos do
-- mesmo povo, o que a tabela culturas_linhagem não modela bem.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Guarani Mbya',
    'guarani-mbya',
    'Litoral e planalto do Rio Grande do Sul, também Santa Catarina, Paraná e São Paulo',
    'Um dos três subgrupos guarani no Brasil, ao lado do Kaiowá e do Ñandeva. A Opy, casa de reza, é o centro espiritual e pedagógico da aldeia (tekoá): é lá que se aprende o nhandereko, o "modo de ser" guarani, guiado pelas lideranças espirituais karaí e kunhã karaí, que se comunicam com Nhanderu através de sonhos e sinais na natureza. Sem Opy, dizem, não existe tekoá de verdade.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 41 from culturas)
  ),
  (
    'Paresí (Haliti)',
    'paresi-haliti',
    'Noroeste do Mato Grosso, também Rondônia',
    'Autodenominam-se Haliti, "gente". No mito de origem, o herói Wazáre e seus irmãos escaparam de dentro de uma rocha por uma fenda aberta por Enorê, deus do raio, dando origem ao povo Paresí. A Ponte de Pedra, formação natural sobre o rio Sacuriú-iná, é tida como o local exato onde isso aconteceu, tornando o mito visível na paisagem até hoje.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 42 from culturas)
  ),
  (
    'Tembé (Tenetehara)',
    'tembe-tenetehara',
    'Rio Gurupi, divisa entre Pará e Maranhão',
    'Compartilham com o Guajajara o mesmo tronco Tenetehara e o mesmo herói mítico Maíra. O maracá, feito do fruto da cuieira, é o único instrumento que acompanha os cantos tradicionais nas festas: homens cantam primeiro, acompanhados pelo som do maracá, e depois entram as vozes agudas das mulheres. Incorporaram datas do calendário católico, como batizados e dias de santo, sem adotar o cristianismo como sistema religioso central.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 43 from culturas)
  )
on conflict (slug) do nothing;
