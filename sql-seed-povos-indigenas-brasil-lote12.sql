-- ============================================================
-- Povos indígenas do Brasil, LOTE 12 de N.
--
-- Continuação dos lotes 1 a 11, mesmo método: cada povo pesquisado
-- individualmente antes de escrever o resumo. Este lote cobre o
-- Acre (Yawanawá), o sul do Mato Grosso do Sul (Guarani Kaiowá) e
-- o sudeste do Pará (Parakanã).
--
-- Nota: Kaiowá e Parakanã envolvem violência recente e em curso
-- (casas de reza incendiadas, lideranças assassinadas, contato
-- forçado que reduziu a população pela metade). Registrado sem
-- amenizar, no mesmo espírito do que já foi feito com Xukuru,
-- Selk'nam e Charrúa em lotes anteriores.
-- ============================================================

insert into culturas (nome, slug, regiao_origem, resumo, marcos, continente, raiz_africana, ativo, ordem)
values
  (
    'Yawanawá',
    'yawanawa',
    'Alto rio Gregório, município de Tarauacá, Acre',
    'Quase perderam sua cultura entre 1970 e 1980, quando missionários evangélicos suprimiram rituais e o uso do uni (ayahuasca). A partir da liderança do cacique Nixiwaka e do pajé Yawa, retomaram suas tradições: em 2009, depois de 27 anos, o uni e o Mariri voltaram a ser celebrados na aldeia sagrada. Hoje o Festival Mariri reúne milhares de pessoas em torno de cânticos, pintura corporal com jenipapo e urucum, e rituais de cura conduzidos pela primeira mulher pajé do povo, Putany.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 38 from culturas)
  ),
  (
    'Guarani Kaiowá',
    'guarani-kaiowa',
    'Sul do Mato Grosso do Sul, região de Dourados e Amambai',
    'Sua religião gira em torno de Ñande Ramõi, "Nosso grande avô eterno", cujo espírito age através dos rezadores (nhanderu e nhandesy) para curar e orientar a comunidade, com o chocalho mbaraka usado nos rituais. A relação com o tekoha, a terra tradicional entendida como território físico e espiritual indissociável, é central e segue sob ataque: casas de reza foram incendiadas nos últimos anos, e lideranças como o cacique Nísio Gomes foram assassinadas na luta pela demarcação de terras.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 39 from culturas)
  ),
  (
    'Parakanã (Awaeté)',
    'parakana-awaete',
    'Interflúvio dos rios Pacajá e Tocantins, sudeste do Pará',
    'Autodenominam-se Awaeté. Em sua cosmologia, o tempo mítico se confunde com o presente: seres como Owerá não pertencem a um passado encerrado, mas seguem presentes no cotidiano, na mata. A Festa do Cigarro, celebrada com o opetymo, um grande cigarro ritual enrolado em entrecasca de tauari, dura de três a quatro dias. O contato forçado, feito entre 1971 e 1984, reduziu a população a menos da metade, e a hidrelétrica de Tucuruí inundou parte de seu território.',
    '[]'::jsonb, 'america-sul', false, true,
    (select coalesce(max(ordem), 0) + 40 from culturas)
  )
on conflict (slug) do nothing;
