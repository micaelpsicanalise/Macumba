-- ============================================================
-- Seed de exemplo pra Ogum — camada "história" + comidas
-- ritualísticas. Texto reescrito com base no material que você
-- enviou (não é cópia literal); revise e ajuste o tom antes de
-- publicar de verdade.
--
-- Assume que já existe um guia com slug = 'ogum'. Se o slug for
-- outro no seu banco, troque abaixo.
-- ============================================================

-- 1) Biografia longa (camada "história")
update guias set historia = $$Ogum é o orixá guerreiro, ligado ao ferro e à abertura de caminhos. Na Umbanda é sincretizado com São Jorge, e reúne em si a força de quem enfrenta de frente, sem rodeios.

É filho de Iemanjá, irmão de Exu e de Oxóssi — a quem, segundo a tradição, ensinou a caçar. Seu domínio é amplo: preside o ferro e por extensão tudo o que se faz com ferramentas — ferreiros, soldados, e hoje também motoristas e mecânicos. É o orixá que abre trilha na mata, assim como abre caminho para o novo: uma estrada, uma fábrica, uma tecnologia.

O temperamento de Ogum é passional antes de ser calculado: generoso e leal com quem ama, implacável com quem trai sua confiança. Não se acomoda — conquista e segue adiante, sem se deter no que já venceu.

Quem tem Ogum como guia costuma herdar esse mesmo impulso: coragem, franqueza (às vezes áspera demais), dificuldade de ficar parado, e uma lealdade que não perdoa traição fácil. São pessoas de ação, que preferem decidir logo a esperar — o que exige deles aprender a conter o primeiro impulso antes de agir.$$
where slug = 'ogum';

-- 2) Itans (contos) — usando o mesmo guia_id de Ogum
--    Reescrito e resumido a partir das lendas que você enviou.
with g as (select id from guias where slug = 'ogum')
insert into conteudos (guia_id, tipo, titulo, letra, ordem, ativo)
select g.id, 'conto', 'Como Ogum se tornou orixá',
$$Ogum guerreava sem parar, sempre trazendo a seu pai Odudua o que conquistava nas batalhas. Tomou o reino de Irê e ali colocou seu próprio filho no trono, seguindo depois em nova campanha.

Ao voltar, anos depois, encontrou a cidade em silêncio ritual — e, sem saber o motivo, interpretou aquilo como desfeita. Tomado de fúria, feriu quem encontrou pela frente com sua espada. Só quando seu filho lhe ofereceu comida e bebida em sinal de acolhida, Ogum se acalmou, reconheceu o exagero de sua reação e decidiu que já havia guerreado o bastante. Cravou a espada no chão e desceu para a terra — e assim se tornou definitivamente um orixá.$$,
1, true
from g;

with g as (select id from guias where slug = 'ogum')
insert into conteudos (guia_id, tipo, titulo, letra, ordem, ativo)
select g.id, 'conto', 'Ogum ensina o segredo do ferro',
$$Num tempo em que orixás e humanos viviam lado a lado, a terra precisava de mais espaço pra plantar, mas as ferramentas de pedra e madeira eram fracas demais pra limpar o mato. Um a um, os orixás tentaram e fracassaram — até Ogum, que guardava o segredo do ferro, pegar seu facão afiado e abrir a clareira sozinho.

Diante disso, os outros orixás lhe ofereceram o próprio reinado em troca de aprender aquele segredo. Ogum aceitou e ensinou a todos — orixás e humanos — como forjar o metal. Foi assim que caçadores e guerreiros passaram a ter lanças de ferro, e Ogum ficou conhecido, desde então, como o senhor da forja.$$,
2, true
from g;

-- 3) Comidas ritualísticas / oferendas (nova camada "receita")
with g as (select id from guias where slug = 'ogum')
insert into conteudos (guia_id, tipo, titulo, letra, ordem, ativo)
select g.id, 'receita', 'Inhame com dendê e mel',
$$Lave um inhame várias vezes em água corrente. Corte-o ao meio, no sentido do comprimento. Numa metade, passe azeite de dendê; na outra, mel — os dois lados representando as duas faces de Ogum.$$,
1, true
from g;

with g as (select id from guias where slug = 'ogum')
insert into conteudos (guia_id, tipo, titulo, letra, ordem, ativo)
select g.id, 'receita', 'Feijão mulatinho de Ogum',
$$Cozinhe feijão mulatinho (ou feijão-cavalo) até ficar macio. Refogue cebola no azeite de dendê e misture ao feijão já cozido. Sirva coberto com camarões fritos no dendê.$$,
2, true
from g;
