-- Creacion de cursor
/*Cursor haga que el asesor con codigo #3 que está trabajando visualice cuantos contratos ha vendido, 
  cuantos personas se han retirado y cuantas personas todavia quedan*/

DO $$
DECLARE
	NUM1 INT = 0;
	TABLA_DATO RECORD;
	NUM INT;
	NUM2 INT = 0;
	NUM3 INT = 0;
	CODIGO_AGENTE INT = 3;
	
 	cursor1 CURSOR IS 
	SELECT * FROM REGISTRO
		INNER JOIN AGENTE_VENDEDOR ON REGISTRO.ID_AGENT = AGENTE_VENDEDOR.ID_AGENT
	WHERE REGISTRO.ID_AGENT = CODIGO_AGENTE;
	
	cursor2 CURSOR IS 
	SELECT * FROM REGISTRO
		INNER JOIN ESTADO ON REGISTRO.ID_EST = ESTADO.ID_EST
	WHERE ESTADO.ESTADO_EST = 'RETIRO' AND REGISTRO.ID_AGENT = CODIGO_AGENTE;
	
	cursor3 CURSOR IS
	SELECT * FROM REGISTRO
		INNER JOIN ESTADO ON REGISTRO.ID_EST = ESTADO.ID_EST
	WHERE ESTADO.ESTADO_EST = 'ACTIVO' AND REGISTRO.ID_AGENT = CODIGO_AGENTE;
BEGIN

  FOR NUM IN cursor1 LOOP
	NUM1 = NUM1 + COUNT(NUM.ID_AGENT);
  END LOOP;
  
  FOR NUM IN cursor2 LOOP
	NUM2 = NUM2 + COUNT(NUM.ID_EST);
  END LOOP;
  
  FOR NUM IN cursor3 LOOP
	NUM3 = NUM3 + COUNT(NUM.ID_EST);
  END LOOP;
  
OPEN cursor1;
FETCH cursor1 INTO TABLA_DATO;

RAISE NOTICE 'Nombre: %, Vendidos: %, Retirados: %, Quedan: %', 
			TABLA_DATO.NOM_AGENT, NUM1, NUM2, NUM3;
END $$
LANGUAGE 'plpgsql'
