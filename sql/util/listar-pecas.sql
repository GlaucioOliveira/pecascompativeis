select att.nome as tipo_automovel, ama.nome as marca, am.nome as modelo, ap.nome as peca, ap.* From automovel_peca ap
inner join automovel_modelo am on am.id_automovel_modelo=ap.fk_id_automovel_modelo
inner join automovel_marca ama on ama.id_automovel_marca=am.fk_id_automovel_marca
inner join automovel_tipo att on att.id_automovel_tipo = am.fk_id_automovel_tipo;