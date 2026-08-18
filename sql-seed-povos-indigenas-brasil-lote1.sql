-- ============================================================
-- Povos indígenas do Brasil, LOTE 1 de N.
--
-- O Censo 2022 (IBGE) reconhece 391 povos indígenas no Brasil
-- (eram 305 em 2010). Não é possível, nem responsável, cadastrar
-- os 391 de uma vez, com verbetes rasos, compilados de memória: o
-- próprio manifesto do projeto (seção V) defende precisão de
-- origem contra generalização. Um resumo malfeito sobre um povo
-- específico é pior que não ter o verbete.
--
-- Este lote traz 5 povos, cada um pesquisado individualmente (não
-- compilado de memória), cobrindo regiões diferentes do país:
-- Amazônia (Tikúna, Kayapó/Mebêngôkre), Centro-Oeste (Xavante),
-- Nordeste (Pataxó) e Sul (Kaingang). Próximos lotes seguem o
-- mesmo padrão: pesquisa por povo, não volume por volume.
--
-- `regiao_origem` e `resumo` seguem o estilo do resto da tabela,
-- sem travessão (ponto/vírgula). `raiz_africana` fica false (não
-- são afro-diaspóricos). Revise antes de considerar definitivo,
-- principalmente porque alguns desses povos têm porta-vozes e
-- organizações próprias que valeria contatar/citar como fonte.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Tikúna (Magüta)',
    'tikuna',
    'Alto Rio Solimões, Amazonas, também Peru e Colômbia',
    'Maior povo indígena do Brasil em população. Autodenominam-se Magüta. Praticam a Festa da Moça Nova (Worecütchiga), ritual de iniciação feminina na primeira menstruação, com reclusão, cantos, máscaras e pintura corporal. A mitologia tem Yoi como herói fundador do povo.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 1 from culturas)
  ),
  (
    'Kayapó (Mebêngôkre)',
    'kayapo-mebengokre',
    'Sul do Pará e norte do Mato Grosso, Amazônia',
    'Autodenominam-se Mebêngôkre, "os homens do lugar d''água". A pintura corporal com jenipapo e urucum é central: marca identidade, protege espiritualmente e é parte obrigatória do ritual de nominação, que socializa a criança através da pintura, adornos e dança.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 2 from culturas)
  ),
  (
    'Xavante (A''uwe)',
    'xavante-auwe',
    'Mato Grosso, Brasil Central',
    'Autodenominam-se A''uwe, "gente/povo". A aldeia é construída em semicírculo, refletindo uma cosmologia de círculos concêntricos que emanam do centro político e social (warã). O ritual de iniciação masculina Wapté Mnhõnõ e a dança de máscaras Wamnhorõ marcam a passagem para a vida adulta.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 3 from culturas)
  ),
  (
    'Pataxó',
    'pataxo',
    'Extremo sul da Bahia, região do Monte Pascoal',
    'Povo do litoral onde a esquadra de Cabral aportou em 1500. Sobreviveram ao massacre de 1951 (o "Fogo de 51") e hoje revitalizam o Patxôhã, língua considerada extinta em 1980. O Awê, dança circular guiada pelo pajé ao som do maracá, é o ritual central: celebra a vida, a colheita e invoca os ancestrais.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 4 from culturas)
  ),
  (
    'Kaingang',
    'kaingang',
    'Sul e sudeste do Brasil',
    'Povo organizado em duas metades exogâmicas, Kamé e Kairu, presentes na pintura facial e em toda a estrutura ritual. O Kiki, ritual de culto aos mortos conduzido pelos kuiãs (xamãs), guia os espíritos dos falecidos ao numbê, o mundo dos mortos. Foi interrompido pela catequização forçada e retomado como resistência cultural nos anos 1970.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 5 from culturas)
  )
on conflict (slug) do nothing;
