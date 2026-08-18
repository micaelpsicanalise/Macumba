-- ============================================================
-- Povos indígenas do Brasil, LOTE 2 de N.
--
-- Continuação do sql-seed-povos-indigenas-brasil-lote1.sql, mesmo
-- método: cada povo pesquisado individualmente antes de escrever
-- o resumo, não compilado de memória. Este lote cobre Amazonas
-- (Kokama), Roraima (Makuxí), Pantanal (Terena) e Maranhão
-- (Guajajara/Tenetehara). Kokama e Makuxí estão entre os povos
-- mais populosos do Brasil no Censo 2022.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Kokama',
    'kokama',
    'Alto Solimões e outros rios da Amazônia, também Peru e Colômbia',
    'Segundo povo indígena mais populoso do Brasil (Censo 2022). Sob forte influência de missões jesuíticas desde o século XVII, hoje lidera um movimento de revitalização da língua kokama, quase extinta, tratando o idioma como pilar central da identidade étnica. Entre 1970 e 1980, um movimento religioso profético motivou famílias kokama a migrarem do Peru para comunidades brasileiras às margens do rio Javari.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 6 from culturas)
  ),
  (
    'Makuxí',
    'makuxi',
    'Roraima, região do Monte Roraima, também Guiana e Venezuela',
    'Terceiro povo indígena mais populoso do Brasil (Censo 2022). Consideram o Monte Roraima a morada de Makunaima, entidade sagrada guardiã da montanha, e acreditam que o espírito de um pajé, ao morrer, penetra na rocha e se transforma em cristal. Os mitos makuxí coletados pelo etnólogo Koch-Grünberg no início do século XX inspiraram o clássico modernista "Macunaíma", de Mário de Andrade.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 7 from culturas)
  ),
  (
    'Terena',
    'terena',
    'Mato Grosso do Sul, região do Pantanal',
    'Um dos povos indígenas mais numerosos do país. O Kohixoti-Kipáe, também chamado Dança da Ema ou bate-pau, é celebração central de memória e identidade, apresentada em eventos internacionais como símbolo do povo. Práticas xamânicas de cura e proteção convivem, em muitas aldeias, com devoção sincrética a São Sebastião, adotado como santo protetor da comunidade.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 8 from culturas)
  ),
  (
    'Guajajara (Tenetehara)',
    'guajajara-tenetehara',
    'Maranhão, margem oriental da Amazônia',
    'Autodenominam-se Tenetehara, "o homem verdadeiro". A pajelança, conduzida por pajés homens, cura doenças e celebra a Festa do Milho (ou Festa do Pajé), rito que busca proteger a colheita invocando o herói mítico Maíra. O rito do Moqueado, parte da mesma festa, marca a passagem dos adolescentes para a vida adulta.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 9 from culturas)
  )
on conflict (slug) do nothing;
