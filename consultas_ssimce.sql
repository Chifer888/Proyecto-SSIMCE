-- =====================================================
-- SCRIPT COMPLETO CONSULTA DE TABLAS BD_SSIMCE 
-- =====================================================

select * from guia;
select * from bitacora;
select * from lineas_bitacora;
select * from entradas;
select * from envios_mrb;
select * from envios_ct;
select * from salidas;
select * from catalogo_productos;
select * from usuarios;
select * from irregularidades;
select * from v_irregularidades_recientes;
select * from v_stock_disponible_alt where sku='454054';
select * from v_entradas_recientes;
select * from v_stock_disponible;
select * from vista_bitacora_completa;