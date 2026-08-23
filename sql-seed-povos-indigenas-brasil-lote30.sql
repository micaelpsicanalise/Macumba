-- ============================================================
-- Povos indígenas do Brasil, LOTE 30 de N.
--
-- Continuação dos lotes 1 a 29, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- rio Biá, afluente do Jutaí (Katukina do Rio Biá) e o Vale do
-- Javari, rio Ituí (Matis), ambos no Amazonas.
--
-- Nota: "Katukina do Rio Biá" é povo distinto do Katukina do Acre
-- (família Pano, kambô, já cadastrado no lote 10), apesar do nome
-- idêntico. Também não deve ser confundido, por semelhança de
-- nome, com o Tikúna (Magüta) do lote 1. São três povos
-- diferentes.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Katukina do Rio Biá (Tükuna)',
    'katukina-rio-bia',
    'Terra Indígena Rio Biá, afluente do rio Jutaí, sudoeste do Amazonas',
    'Autodenominam-se Tükuna, "gente". Não são o mesmo povo que o Katukina do Acre, de família linguística Pano; "Katukina" foi termo genérico dado por colonizadores a povos do rio Juruá considerados "dóceis", hoje mantido por escolha própria por grupos distintos. Praticam um xamanismo dito "de pedra": o dyohko, agente patogênico com aparência de pedra, provoca doenças, e o xamã (baohi) precisa extraí-lo do corpo do paciente para curar, além de capturar e controlar espíritos auxiliares a partir de partes de animais como pelos de onça.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 85 from culturas)
  ),
  (
    'Matis',
    'matis',
    'Terra Indígena Vale do Javari, rio Ituí, oeste do Amazonas',
    'Reconhecem-se como mushabo, "gente tatuada", ou wanibo, "gente da pupunha", por causa das tatuagens faciais feitas com espinho de pupunha que marcam pertencimento ao grupo. Os mariwin, ancestrais genéricos representados por adultos mascarados e armados de varas, visitam as aldeias para disciplinar as crianças, batendo nelas ritualmente para torná-las mais fortes e ativas. O primeiro contato, em 1975, dizimou boa parte do povo por doenças importadas, interrompendo por anos a prática religiosa tradicional; desde o fim dos anos 1970, o povo vem se recuperando e retomando suas cerimônias.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 86 from culturas)
  )
on conflict (slug) do nothing;
