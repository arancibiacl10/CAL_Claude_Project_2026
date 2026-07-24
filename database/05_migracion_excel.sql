SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO
USE ServitacoDB;
SET NOCOUNT ON;
GO

-- ================================================
-- CONDUCTORES
-- ================================================
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10003207-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10003207-4','LUIS ALEJANDRO CAROCA CELIS','VILLA LOS REGIDORES 802 SAN FERNANDOI','940158474',NULL,'2022-04-03','2024-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-10-20' FROM flota.Conductor c WHERE c.rut='10003207-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10103541-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10103541-7','System.Xml.XmlElement','OSCAR GAJARDO N° 146 SAN FERNANDO','993174851',NULL,'2021-10-06','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-11-24' FROM flota.Conductor c WHERE c.rut='10103541-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10241059-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10241059-9','PATRICIO RICARDO ARENAS CONTRERAS','POBL. INDEP.II PJE DOLORES PRAT 1456 SAN FERNANDO','920996939',NULL,'2025-09-23','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-11-15' FROM flota.Conductor c WHERE c.rut='10241059-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10297446-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10297446-8','RAUL ALLENDE GONZALEZ','AGUA BUENA CALLE J MATURANA S/N','991697598',NULL,'2025-04-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-10-10' FROM flota.Conductor c WHERE c.rut='10297446-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10303667-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10303667-4','JUAN CARLOS BRIONES GUAJARDO','POB. 18 SEPT. MATEO TORO ZAMBRANO 1422 SAN FERNANDO','984503298',NULL,'2023-03-20','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-07-09' FROM flota.Conductor c WHERE c.rut='10303667-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10340406-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10340406-1','PATRICIO FERNANDO CHAVEZ LILLO','VILLA LA FRUTA LAS FRAMBUEZAS 105 SAN FERNANDO','988495259',NULL,'2021-08-25','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-02-12' FROM flota.Conductor c WHERE c.rut='10340406-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10462215-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10462215-1','FERNANDO CRISTIAN BERRIOS GONZALEZ','V.DON DARIO PJE LOS MANZANOS 185 SAN FERNANDO','954041985',NULL,'2024-05-30','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-12-28' FROM flota.Conductor c WHERE c.rut='10462215-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10619950-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10619950-7','DANIEL AEDO PEREZ','V. CENTINELA MONSEÑOR LARRAIN 1531','954069456',NULL,'2025-06-03','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-03-04' FROM flota.Conductor c WHERE c.rut='10619950-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10697849-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10697849-2','MARIO REBOLLEDO WACEOLS','POBL.18 DE SEPTIEMBRE RIO RIGOLEMU 1713','949368325',NULL,'2025-05-29','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-08-16' FROM flota.Conductor c WHERE c.rut='10697849-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10726874-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10726874-k','JAVIER ERNESTO ARENAS MARAMBIO','LA TUNA S/N PLACILLA','962613506',NULL,'2019-06-05','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-12-12' FROM flota.Conductor c WHERE c.rut='10726874-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10863142-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10863142-k','JUAN ZAMORANO','VILLA GABRIELA MISTRAL PSJE VICUÑA 1097 SAN FERNANDO','982527488','JUANZAMORANOVASQUEZ@GMAIL.COM','2022-06-21','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-08-04' FROM flota.Conductor c WHERE c.rut='10863142-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10863146-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10863146-5','JUAN RIGOBERTO ZAMORANO VASQUEZ','V. GABRIELA MISTRAL VICUÑA 1097 SAN FERNANDO','982527488',NULL,'2022-06-21','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-04-08' FROM flota.Conductor c WHERE c.rut='10863146-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10914820-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10914820-2','System.Xml.XmlElement','V DOÑA ESTER II AVDA. CIRCULACION 743  SAN FERNANDO','996126858',NULL,'2021-06-14','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-12-20' FROM flota.Conductor c WHERE c.rut='10914820-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10916547-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10916547-6','System.Xml.XmlElement','POB. LOS HUERTOS CASA 64 SAN FERNANDO','944893375',NULL,'2022-07-07','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-02-19' FROM flota.Conductor c WHERE c.rut='10916547-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11111111-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11111111-1','COMODIN','COMODIN','987654321','COMODIN@GMAIL.COM','2024-12-17','2026-12-17');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-12-16' FROM flota.Conductor c WHERE c.rut='11111111-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11234192-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11234192-7','EUGENIO JESUS RAMIREZACUÑA','V. RUCATALCA ALC.PEDRO GONZALEZ 2852 SAN FERNANDO','941733535',NULL,'2024-04-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-01-04' FROM flota.Conductor c WHERE c.rut='11234192-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11279270-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11279270-8','DIEGO HERNAN DONOSO CORDOVA','VILLA DON DARIO EL PARRON 0145 SAN FERNANDO','952153233',NULL,'2024-04-10','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-06-17' FROM flota.Conductor c WHERE c.rut='11279270-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11279324-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11279324-1','CLAUDIO TOLEDO','CAMINO LAS QUEZADAS CASA 26 TINGUIRIRICA CHIMBARONGO','974520144',NULL,'2021-11-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-07-03' FROM flota.Conductor c WHERE c.rut='11279324-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11279329-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11279329-1','CLAUDIO ENRIQUE TOLEDO LALANNE','TINGUIRIRICA LAS QUEZADAS 26 SAN FERNANDO','974520144',NULL,'2021-11-24','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-07-03' FROM flota.Conductor c WHERE c.rut='11279329-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11279565-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11279565-0','LUCIA CASTRO BRAVO','P. CAM.REAL LAS CAMELIAS EL JAZMIN 151','984082383',NULL,'2025-01-06','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-10-04' FROM flota.Conductor c WHERE c.rut='11279565-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11367022-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11367022-3','FREDDY VERGARA RIVEROS','V. LAS TINAJAS II LOS TITIRITEROS 0302 SAN FERNANDO','990162606',NULL,'2025-01-21','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-01-05' FROM flota.Conductor c WHERE c.rut='11367022-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11433470-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11433470-7','MAURICIO CASTILLO DÍAZ','VILLA PAUL HARRIS 2 PJE PEDRO GINESTAR 27 SAN FERNANDO','961630714',NULL,'2025-04-10','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-15' FROM flota.Conductor c WHERE c.rut='11433470-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11530485-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11530485-2','REINALDO GOMEZ','V. DOÑA ESTER III PJE NUEVO HORIZONTE 1023','985563317',NULL,'2025-04-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-21' FROM flota.Conductor c WHERE c.rut='11530485-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11530635-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11530635-9','MANUEL FRANCISCO BECERRA IBARRA','V. SAN JUAN BLOCK 2 DPTO 36 SAN FERNANDO','986563399',NULL,'2021-08-05','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-07-18' FROM flota.Conductor c WHERE c.rut='11530635-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11530956-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11530956-0','RODRIGO ALIAGA ESCOBAR','POBL. SAN HERNAN BLOCK 99 DEPTO 23','940555179',NULL,'2025-04-30','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-11-28' FROM flota.Conductor c WHERE c.rut='11530956-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11596339-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11596339-2','OSCAR ELADIO LEAL MAYORGA','LOS ARREGLADORES 1756 SAN FERNANDO','958709024',NULL,'2024-09-13','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-10-02' FROM flota.Conductor c WHERE c.rut='11596339-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11743893-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11743893-7','RODRIGO ANDRES CAROCA CELIS','VILLA PAUL HARRIS 0145','984415570',NULL,'2022-02-06','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-02-07' FROM flota.Conductor c WHERE c.rut='11743893-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11952501-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11952501-2','ANDRES SEGUNDO SANHUEZA PADILLA','V.EL ALAMO PJE G.MARKMANN 543 SAN FERNANDO','961658380',NULL,'2022-07-07','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-16' FROM flota.Conductor c WHERE c.rut='11952501-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12378136-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12378136-8','RODRIGO ALEJANDRO POZO ARCE','System.Xml.XmlElement','937407725',NULL,'2024-07-01','2024-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-10-09' FROM flota.Conductor c WHERE c.rut='12378136-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12413397-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12413397-1','HECTOR ITALO SALAZAR SOTO','POBL. LAUTARO CALLE UNO CASA 427 SAN FERNANDO','962329580',NULL,'2021-06-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-05-05' FROM flota.Conductor c WHERE c.rut='12413397-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12414291-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12414291-1','JOSE MIGUEL MARIQUEO DIAZ','V. DON DARIO PJE.LOS NOGALES 081 SAN FERNANDO','959890573',NULL,'2021-06-14','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-12-07' FROM flota.Conductor c WHERE c.rut='12414291-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10472187-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10472187-7','EDUARDO CHAVEZ LLANTEN','POBLACION SANTA ELENA 44','989841167',NULL,'2025-10-15','2025-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-05-13' FROM flota.Conductor c WHERE c.rut='10472187-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12780319-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12780319-6','System.Xml.XmlElement','V.G. MISTRAL PJE TERNURA 983 SAN FERNANDO','974937927',NULL,'2025-08-06','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-07-28' FROM flota.Conductor c WHERE c.rut='12780319-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12780549-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12780549-0','MAURICIO GONZALEZ URRA','PJE LA CAPILLA ROMA S/N','978611224',NULL,'2025-01-17','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-09-12' FROM flota.Conductor c WHERE c.rut='12780549-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12780880-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12780880-5','ALEJANDRO ANTONIO MOLINA GONZALEZ','V. LOS REGIDORES MARIA LUISA BOUCHON 1041 SAN FERNANDO','941673944',NULL,'2022-01-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-04-10' FROM flota.Conductor c WHERE c.rut='12780880-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12780920-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12780920-8','CLAUDIO CONTRERAS','V. LAS ROSAS PJ JARDIN 221 PELEQUEN','938628476',NULL,'2025-04-25','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-10-11' FROM flota.Conductor c WHERE c.rut='12780920-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12780992-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12780992-5','MARIO FERNANDO DIAZ ORTIZ','VILLA LOS PARRONES CALLE 6 CASA 5','982796190',NULL,'2024-10-04','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-04-18' FROM flota.Conductor c WHERE c.rut='12780992-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12911376-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12911376-6','System.Xml.XmlElement','V. LOS REGIDORES PJE JORGE URRUTIA 0869 SAN FERNANDO','954650770',NULL,'2024-12-17','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-06-14' FROM flota.Conductor c WHERE c.rut='12911376-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12912166-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12912166-1','ERASMO MUÑOZ RAMIREZ','V. DOÑA ESTER III PJE EL ATARDECER 0434','938724957',NULL,'2026-02-16','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-02-28' FROM flota.Conductor c WHERE c.rut='12912166-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13003695-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13003695-3','JAIME ANDRES RIVERA ELIZONDO','LOS HUERTOS 42','999036468',NULL,'2021-06-16','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-06-10' FROM flota.Conductor c WHERE c.rut='13003695-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13003881-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13003881-6','PABLO CESAR FARIAS MELLA','21 DE MAYO 271 NANCAGUA','985123488',NULL,'2024-07-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-07-05' FROM flota.Conductor c WHERE c.rut='13003881-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13003897-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13003897-2','JAIME FRANCISCO VALENZUELA CATALAN','LO MOSCOSO S/N SAN FERNANDO','938774453',NULL,'2024-09-13','2024-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-07-15' FROM flota.Conductor c WHERE c.rut='13003897-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13101748-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13101748-0','ALEX MARCELO OLAVE CAASTRO','V.DOÑA ESTER II PJE BELGICA 0483','945484823',NULL,'2022-11-22','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2031-01-19' FROM flota.Conductor c WHERE c.rut='13101748-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13185042-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13185042-5','System.Xml.XmlElement','V. LOS CANTAROS PSJE EL SAUCE 6','975524382',NULL,'2025-07-17','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-08-08' FROM flota.Conductor c WHERE c.rut='13185042-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13200849-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13200849-3','SERGIO ALEJANDROSALINAS ROMERO','V.LA RAMADA JUAN GODOY 130 SAN FERNANDO','971118939',NULL,'2022-03-15','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-12-28' FROM flota.Conductor c WHERE c.rut='13200849-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13201396-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13201396-9','CHIESTER ALEJANDRO DIAZ ADASME','V.EL ALAMO PJE GMO MARKMAN 591 SAN FERNANDO','958015510',NULL,'2021-06-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-06-22' FROM flota.Conductor c WHERE c.rut='13201396-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13201862-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13201862-6','PEDRO EMILIO ABARCA PAVEZ','V. CENTINELA LUIS AMESTI 1428 SAN FERNANDO','963720439',NULL,'2024-06-18','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-09-23' FROM flota.Conductor c WHERE c.rut='13201862-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13304265-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13304265-2','ELSA ROMERO','ROMERAL S/N CHIMBARONGO','983889700',NULL,'2025-06-24','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-03-28' FROM flota.Conductor c WHERE c.rut='13304265-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13304298-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13304298-9','CLAUDIO SERGIO CACERES MONTERO','V VENECIA PJE JOAQUÍN PRIETO 397','963947251',NULL,'2024-06-17','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-05-20' FROM flota.Conductor c WHERE c.rut='13304298-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13346398-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13346398-4','ANGEL CUSTODIO BARRERA CABRERA','V.RUCATALCA PJE LOS CIRUELOS 0202 SAN FERNANDO','988652582',NULL,'2021-09-23','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-01-28' FROM flota.Conductor c WHERE c.rut='13346398-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10578055-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10578055-9','IVAN ÑANCULEF VALLEJOS','ALGARROBO 0226 LOS CASTAÑOS','975707224',NULL,'2026-03-10','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-01-04' FROM flota.Conductor c WHERE c.rut='10578055-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13347885-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13347885-k','CRISTIAN ALBERTO POZO VILLEGAS','POBL. SAN HERNAN BLOCK 27 DPTO 13 SAN FERNANDO','977307655',NULL,'2024-02-05','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-12-18' FROM flota.Conductor c WHERE c.rut='13347885-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13569607-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13569607-2','Raul Eduardo Arriagada Osorio','Tres montes 1466 villa sur san fernando','931085973','raulaosorio9@gmail.com','2025-02-20','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-01-03' FROM flota.Conductor c WHERE c.rut='13569607-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13569694-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13569694-3','System.Xml.XmlElement','V. BELLAVISTA BLOCK 8 DPTO 203 SAN FERNANDO','989705475',NULL,'2021-06-29','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-01-14' FROM flota.Conductor c WHERE c.rut='13569694-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13569906-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13569906-3','LUIS HUMBERTO MENESES RODRIGUEZ','VILLA SANTA BARBARA BLOCK 22 DPTO 103','996490334',NULL,'2021-07-02','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-27' FROM flota.Conductor c WHERE c.rut='13569906-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13569977-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13569977-2','JESSICA MOYA','V EDUARDO BARRIOS PJE EDWARDS BELLO 181 SAN FERNANDO','989279778',NULL,'2025-03-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-04-17' FROM flota.Conductor c WHERE c.rut='13569977-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13570288-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13570288-9','System.Xml.XmlElement','V.EL ROBLE PJE HERIBERTO SOTO 983 SAN FERNANDO','997884992',NULL,'2024-07-05','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-07-13' FROM flota.Conductor c WHERE c.rut='13570288-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13570516-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13570516-0','VICTOR VILLANUEVA JARAMILLO','MANTIALES S/N','963385285',NULL,'2025-02-03','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-09-13' FROM flota.Conductor c WHERE c.rut='13570516-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13779705-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13779705-4','FELIPE ALEJANDRO VALDERRAMA GONZALEZ','V. PARQUE PONIENTE AV. CIR. PONIENTE 648 SAN FERNANDO','962803880',NULL,'2021-06-17','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-12-27' FROM flota.Conductor c WHERE c.rut='13779705-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13781102-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13781102-2','System.Xml.XmlElement','VILLA DOÑA GEORGINA EL ENCINO 527 SAN FERNANDO','989611264',NULL,'2024-08-20','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-12-31' FROM flota.Conductor c WHERE c.rut='13781102-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13781126-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13781126-K','ANGEL PATRICIO GALARCE PINO','RINCONADA DE MANANTIALES S/N PLACILLA','934329700',NULL,'2021-09-06','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-05-14' FROM flota.Conductor c WHERE c.rut='13781126-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14012781-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14012781-7','NICOLÁS GUAJARDO MORAGA','PJE GUAULEMU 766 POBLACION VALENTIN LETELIER RENGO','921786243',NULL,'2025-03-03','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-07-25' FROM flota.Conductor c WHERE c.rut='14012781-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14048091-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14048091-6','JOEL MORALES ORELLANA','V. DOÑA ESTER IV NELSON VERGARA 0351','963076245',NULL,'2025-01-24','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-02-22' FROM flota.Conductor c WHERE c.rut='14048091-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14205650-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14205650-k','VICTOR GALAZ CORNEJO','PSJE LOS SEMBRADORES V. DOÑA MARTINA II 015','964079896',NULL,'2025-07-07','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-08-16' FROM flota.Conductor c WHERE c.rut='14205650-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14260593-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14260593-7','MANUEL JESUS VIDELA CHAVEZ','JARDINES DEL SUR ENRIQUE VOLPI NORTE  N° 0425','947480094','manuelvidela@gmail.com','2024-12-03','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-11-13' FROM flota.Conductor c WHERE c.rut='14260593-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14261217-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14261217-8','FERNANDO CACERES NAVARRETE','V. EL ALAMO G. MARKMAN BOSSEN 525 SAN FERNANDO','936850232',NULL,'2024-12-30','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-06-29' FROM flota.Conductor c WHERE c.rut='14261217-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14261886-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14261886-9','System.Xml.XmlElement','EL QUILO 148 SAN FERNANDO','995225802',NULL,'2022-08-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-11-21' FROM flota.Conductor c WHERE c.rut='14261886-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14352221-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14352221-0','ALBARDO DE JESUS PAVEZ CLAVIJO','V. EDUARDO BARRIOS PJE EDO ANGUITA 1761 SAN FERNANDO','977234892',NULL,'2021-09-06','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-02-08' FROM flota.Conductor c WHERE c.rut='14352221-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14619812-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14619812-0','FREDY ALEXANDER ABARCA GAETE','AGUA BUENA CALLE EL CARMEN S/N','967375613',NULL,'2025-05-05','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-07-19' FROM flota.Conductor c WHERE c.rut='14619812-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15116806-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15116806-K','RENAN LEONIDAS GONZALEZ ROJAS','ROMERAL ADENTRO S/N CHIMBARONGO','930382399',NULL,'2022-04-08','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-24' FROM flota.Conductor c WHERE c.rut='15116806-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15117045-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15117045-3','EDUARDO MENESES','VILLA SANTA BARBARA BLOCK 22 DPTO 104','958548377',NULL,'2024-04-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2025-02-27' FROM flota.Conductor c WHERE c.rut='15117045-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15117148-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15117148-6','ALEXI ANDRES COFRE VALENZUELA','V. LOS REGIDORES PJE HERNAN MARTINO 82 SAN FERNANDO','944914960',NULL,'2023-04-14','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-02-12' FROM flota.Conductor c WHERE c.rut='15117148-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15117507-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15117507-4','RICHARD ANDRES CARREÑO SILVA','NEGRETE 433 SAN FERNANDO','958024586',NULL,'2021-06-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-25' FROM flota.Conductor c WHERE c.rut='15117507-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15117551-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15117551-1','LUIS ANDRES MENESES POBLETE','LO CARREÑO VILLA EL LLANO CASA 6 SAN FERNANDO','983820869',NULL,'2024-04-08','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-04-04' FROM flota.Conductor c WHERE c.rut='15117551-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15117610-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15117610-0','JUAN LUIS MORALES PAVEZ','V. LOS REGIDORES CORONEL ERICK RIVEROS V 819 SN FDO','931469800',NULL,'2024-11-25','2024-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-04-19' FROM flota.Conductor c WHERE c.rut='15117610-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15117911-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15117911-8','System.Xml.XmlElement','V. EL RODEO LOS ESTRIBEROS 1749 SAN FERNANDO','947709975',NULL,'2021-06-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-06-23' FROM flota.Conductor c WHERE c.rut='15117911-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15118232-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15118232-1','CRISTIAN OVANDO CANALES MARAMBIO','V. M. VELASCO M. DE TORO ZAMBRANO 0131 SAN FERNANDO','997645511',NULL,'2021-06-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-06' FROM flota.Conductor c WHERE c.rut='15118232-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15119045-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15119045-6','EDUARDO MENESES RODRIGUEZ','VILLA SANTA BARBARA BLOCK 22 DPTO 104','958548377',NULL,'2025-02-24','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-02-27' FROM flota.Conductor c WHERE c.rut='15119045-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15119307-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15119307-2','JONATHAN FARFAN SOTO','POB. O´HIGGINS PJE 1 CASA 88','959442693',NULL,'2024-12-02','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2025-10-26' FROM flota.Conductor c WHERE c.rut='15119307-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15119406-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15119406-0','System.Xml.XmlElement','CORONEL ERIC RIVEROS VALDES 814 SAN FERNANDO','994467741',NULL,'2024-07-24','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-05-27' FROM flota.Conductor c WHERE c.rut='15119406-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15119924-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15119924-0','FRANCISCO ANDRÉS ALLENDE ALLENDE','POBL. PABLO NERUDA PJE ANGEL LIRA 195','999408285',NULL,'2023-10-04','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-05-23' FROM flota.Conductor c WHERE c.rut='15119924-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15121484-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15121484-3','System.Xml.XmlElement','VILLA LAS TINAJAS RO MARKMAN 541 SAN FERNANDO','993103500',NULL,'2024-10-21','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-09-29' FROM flota.Conductor c WHERE c.rut='15121484-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15123366-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15123366-K','CRISTIAN ARANCIBIA LABORDE','ACA','987654321','ACA@GMAIL.COM','2024-04-30','2030-04-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-04-30' FROM flota.Conductor c WHERE c.rut='15123366-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15527948-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15527948-6','JOSÉ HERNÁN CUEVAS VÁSQUEZ','SAN FERMIN LOTE B PARCELA N° 13 TINGUIRIRICA','944944249',NULL,'2025-03-25','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-04-16' FROM flota.Conductor c WHERE c.rut='15527948-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15698448-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15698448-5','CRISTIAN RAUL GUTIERREZ NUÑEZ','V. SAN MARCOS SAN PABLO 0142 SAN FERNANDO','982584052',NULL,'2021-06-22','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-01-19' FROM flota.Conductor c WHERE c.rut='15698448-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15915893-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15915893-4','GABRIEL AMBROSIO FUENTES VIEDMA','POBL.18 DE SEPT. CAMILO HENRIQUEZ 1480 SAN FERNANDO','972940365',NULL,'2024-11-14','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-07-12' FROM flota.Conductor c WHERE c.rut='15915893-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15915952-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15915952-3','JOSE RODRIGO CANTILLANA BURGOS','NILCUNLAUTA 216','992052298',NULL,'2021-08-03','2024-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-07-21' FROM flota.Conductor c WHERE c.rut='15915952-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16069333-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16069333-9','MARCO ANTONIO RUBIO SOLIS','PJE EL BRONCE 0782 VILLA ORIGEN SAN FERNANDO','934192281',NULL,'2025-09-24','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-05-26' FROM flota.Conductor c WHERE c.rut='16069333-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16164774-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16164774-8','SERGIO GONZALEZ JIMENEZ','PUQUILLAY ALTO S/N','926828054',NULL,'2024-11-30','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-05-21' FROM flota.Conductor c WHERE c.rut='16164774-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16165038-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16165038-2','VICTOR ANDRES MOSCOSO PAVEZ','V. LOS ARREGLADORES ANGEL GRUCHAGA 532 SAN FERNANDO','957557404',NULL,'2024-01-03','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-08-16' FROM flota.Conductor c WHERE c.rut='16165038-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16165441-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16165441-8','BRENDA DEL PILAR CAMPOS SANHUEZA','VILLA EL RODEO SUR 1 PJE GALOPE 1610 SAN FERNANDO','966550013',NULL,'2024-06-12','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-12-01' FROM flota.Conductor c WHERE c.rut='16165441-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16165498-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16165498-1','ANGHELO ANDRES RIQUELME VILLEGAS','VILLA EL RODEO SUR PASAJE GALOPE 1610 SAN FERNANDO','966550013',NULL,'2023-04-12','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-12-16' FROM flota.Conductor c WHERE c.rut='16165498-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16166195-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16166195-3','VICTOR MARTINEZ','CURALI 330 SAN FERNANDO','975615183',NULL,'2024-01-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2025-02-28' FROM flota.Conductor c WHERE c.rut='16166195-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16261720-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16261720-6','System.Xml.XmlElement','JARD.DEL SUR PJE.ZULEMA REYES SUR 0594 SAN FERNANDO','984369000',NULL,'2023-07-07','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-07-12' FROM flota.Conductor c WHERE c.rut='16261720-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16309819-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16309819-9','LUIS RODRIGO SILVA LLANCA','VILLA EL PEDREGAL CASA 07  SAN FERNANDO','962625244',NULL,'2022-08-16','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-07-09' FROM flota.Conductor c WHERE c.rut='16309819-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16310381-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16310381-8','JUAN PABLO REVECO CORNEJO','System.Xml.XmlElement','934390230',NULL,'2025-07-07','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-02-25' FROM flota.Conductor c WHERE c.rut='16310381-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='10148692-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('10148692-3','JOSE ASTORGA MUÑOZ','V. CENTINELA FCO FUENTES 1156','984436051',NULL,'2025-08-21','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-01-01' FROM flota.Conductor c WHERE c.rut='10148692-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16528977-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16528977-3','VICTOR VARGAS CARMONA','System.Xml.XmlElement','957223920',NULL,'2025-06-11','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-04-27' FROM flota.Conductor c WHERE c.rut='16528977-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16860590-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16860590-0','ARIEL SALAZAR ROMERO','LONGITUDINAL SUR KM 125 CHIMBARONGO','968359483',NULL,'2025-08-06','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-01-02' FROM flota.Conductor c WHERE c.rut='16860590-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16899216-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16899216-5','SERGIO GUSTAVO GOMEZ ROSEL','POB.11 DE SEPT. ARTURO PEREZ CANTO 815 SAN FERNANDO','977397927',NULL,'2026-03-30','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-09-11' FROM flota.Conductor c WHERE c.rut='16899216-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16973070-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16973070-9','FRANCISCO JAVIER OLGUIN SILVA','PROF.ABRAHAMSILVA TRIVIÑO V. GALILEA 019 SAN FERNANDO','930824204',NULL,'2022-08-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-05-06' FROM flota.Conductor c WHERE c.rut='16973070-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16973413-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16973413-5','VICTOR MENESES','V. SANTA BARBARA BLOCK 22 DEPTO 104','937480203',NULL,'2025-01-13','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-10-06' FROM flota.Conductor c WHERE c.rut='16973413-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16973686-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16973686-3','Celso Valenzuela Banda','V. Doña Consuelo Etapa1 Block G1 Dpto 102','952191963',NULL,'2025-06-17','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-05-30' FROM flota.Conductor c WHERE c.rut='16973686-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17058993-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17058993-9','JAVIER ALEJANDRO OJEDA BASTIAS','GUADALUPE 1358','977258988',NULL,'2023-05-04','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-10-26' FROM flota.Conductor c WHERE c.rut='17058993-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17059232-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17059232-8','SEBASTIAN ROMAN RAMIREZ','V. EDUARDO BARRIOS PJE ROSITA RENARD 0283','968328238',NULL,'2025-01-27','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-12-20' FROM flota.Conductor c WHERE c.rut='17059232-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17133992-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17133992-8','GONZALO ZUÑIGA ACEVEDO','VILLA GABRIELA MISTRAL PJE PETRONILA LACAYGA CASA 1025','939627376',NULL,'2024-01-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-11-21' FROM flota.Conductor c WHERE c.rut='17133992-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17136373-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17136373-k','MARIO ANDRES REVECO CORNEJO','V. EL RODEO SUR PJE EL CHAMPION 0274','989743662',NULL,'2025-05-07','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-30' FROM flota.Conductor c WHERE c.rut='17136373-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17258620-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17258620-1','MARCO ANTONIO LIPPIANS VALDERRAMA','VILLA GABRIELA MISTRAL PJE SABIDURIA 1019','985834867',NULL,'2024-06-10','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-04-25' FROM flota.Conductor c WHERE c.rut='17258620-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17259223-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17259223-6','RONIT ARIEL GUZMAN TORRES','MIRAFLORES POLONIA SITIO 44 B','966946625',NULL,'2025-08-12','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2025-10-05' FROM flota.Conductor c WHERE c.rut='17259223-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17470890-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17470890-8','NICOLAS ANTONIO OGAZ JIMENEZ','POBL. INDEP.FRANCISCO DE LA LASTRA 1441','938819408',NULL,'2024-10-21','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2025-12-20' FROM flota.Conductor c WHERE c.rut='17470890-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17470952-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17470952-1','DIEGO ALEXIS CARREÑO RODRIGUEZ','V. DOÑA ESTER III PJE VALLE NEVADO 0486 SAN FERNANDO','968526557',NULL,'2025-10-27','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-01-16' FROM flota.Conductor c WHERE c.rut='17470952-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17506202-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17506202-5','System.Xml.XmlElement','V.PRINCIPAL JUAN JOSE DE MORALES 1336 SAN FERNANDO','978879433',NULL,'2025-01-13','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-08-12' FROM flota.Conductor c WHERE c.rut='17506202-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17506884-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17506884-8','CARLOS COFRÉ GUERRERO','System.Xml.XmlElement','979611639',NULL,'2025-03-03','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-30' FROM flota.Conductor c WHERE c.rut='17506884-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18228886-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18228886-1','GUSTAVO LOPEZ','CALLE DOC. MARIA AMPARO ARCAYA 58 V. MANSO DE VELASCO III','975913553',NULL,'2025-02-03','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-02-28' FROM flota.Conductor c WHERE c.rut='18228886-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18335099-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18335099-4','FRANCO ESTEBAN OSORIO LOPEZ','ROMA VILLA EL PEDREGAL S/N','932361605',NULL,'2022-08-31','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-01-28' FROM flota.Conductor c WHERE c.rut='18335099-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18388557-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18388557-K','ALEXIX ALFREDO CASTRO MIRANDA','RUCATALCA CALLE INTERIOR 0141 SAN FERNANDO','990760726',NULL,'2024-12-16','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-08-10' FROM flota.Conductor c WHERE c.rut='18388557-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18558878-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18558878-5','ANGEL ANDRES ALVEAR ROJAS','AGUA BUENA S/N SAN FERNANDO','976562733',NULL,'2022-06-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-05-15' FROM flota.Conductor c WHERE c.rut='18558878-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18988795-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18988795-7','JAHIR ANDRES SERCE GALVEZ','V.HORIZONTE ROMA PJE.LAUREL 7 SAN FERNANDO','945845297',NULL,'2023-11-20','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-04-26' FROM flota.Conductor c WHERE c.rut='18988795-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18989062-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18989062-1','NICOLAS OSORIO DONOSO','V. SAN JUAN BLOCK 13 DPTO 33','993753719',NULL,'2025-01-15','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-06-15' FROM flota.Conductor c WHERE c.rut='18989062-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18989824-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18989824-K','CAMILO DEL CARMEN LOPEZ MENESES','V. MANSO DE VELASCO AMBROSIO O´HIGGINS 0144','934183947',NULL,'2021-06-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-11-17' FROM flota.Conductor c WHERE c.rut='18989824-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='19237899-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('19237899-0','ISAIAS VERA GONZALEZ','LAS ACACIAS S/N PUEBLO DE INDIOS','965534112',NULL,'2025-05-05','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-09-22' FROM flota.Conductor c WHERE c.rut='19237899-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='19423483-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('19423483-k','ALEXANDER QUEZADA ARIAS','VILLA PRINCIPAL PASAJE CARLOS BRITO 0385','958912317',NULL,'2025-01-28','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-05-09' FROM flota.Conductor c WHERE c.rut='19423483-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='19781246-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('19781246-K','RAUL ANDRES CACERES MONTERO','V.RUCATALCA A. PEDRO GONZALEZ 2785 SAN FERNANDO','964986261',NULL,'2022-10-28','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-03-25' FROM flota.Conductor c WHERE c.rut='19781246-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='19875331-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('19875331-9','FABIAN ALEXIS LEIVA LEIVA','LA TROYA 1043 SAN FERNANDO','936958068',NULL,'2025-04-04','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-06-16' FROM flota.Conductor c WHERE c.rut='19875331-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='19875399-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('19875399-8','RAFAEL ORTIZ GUEVARA','NINCUNLAUTA S/N','942150435',NULL,'2025-06-09','2031-06-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-06-26' FROM flota.Conductor c WHERE c.rut='19875399-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='20921482-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('20921482-2','MIGUEL ALEJANDRO BRAVO MADARIAGA','BARREALES S/N','950056644','miguelbravo@gmail.com','2025-04-04','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-07-12' FROM flota.Conductor c WHERE c.rut='20921482-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12780159-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12780159-2','System.Xml.XmlElement','System.Xml.XmlElement','993912186',NULL,'2025-10-14','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-01-29' FROM flota.Conductor c WHERE c.rut='12780159-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='5467133-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('5467133-4','GUILLERMO ALFONSO GUAJARDO GONZALEZ','LOS PALACIOS 1 BLOCK 5 DPTO 13 SAN FERNANDO','992296683',NULL,'2021-11-29','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-06-25' FROM flota.Conductor c WHERE c.rut='5467133-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='5566868-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('5566868-K','JUAN BAUTISTA RAMIREZ GUTIERREZ','V. RUCATALCA LOS CIRUELOS 0184 SAN FERNANDO','999509927',NULL,'2024-10-03','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-01-01' FROM flota.Conductor c WHERE c.rut='5566868-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6213685-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6213685-5','LUIS ALBERTO ALFARO ARAYA','POBL.SANTA ELENA STA AMELIA 1 SAN FERNANDO','971563955',NULL,'2021-06-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-06-07' FROM flota.Conductor c WHERE c.rut='6213685-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6350598-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6350598-6','RAUL ARRIAGADA MATURANA','VILLA SUR TRES MONTES 1466','997066456',NULL,'2025-04-22','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-05-08' FROM flota.Conductor c WHERE c.rut='6350598-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6377504-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6377504-5','System.Xml.XmlElement','LOS PALACIOS BLOCK 12 DEPTO 32','999546505',NULL,'2021-06-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-12-26' FROM flota.Conductor c WHERE c.rut='6377504-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15916292-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15916292-3','CARLA LARA MARTINEZ','V. PARQUE LAUCA BLOCK 1151-C  D 201','985261898',NULL,'2025-12-29','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-10-26' FROM flota.Conductor c WHERE c.rut='15916292-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6629204-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6629204-5','ANGENOR ANTONIO  TOBAR CATALAN','NILCUNLAUTA CASA 43 SAN FERNANDO','991969783',NULL,'2021-11-06','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-03-31' FROM flota.Conductor c WHERE c.rut='6629204-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6644003-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6644003-6','HECTOR BENEDICTO MENESES LOBOS','FUNDO LAS ROSAS SITIO 2','972954597',NULL,'2023-02-08','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-04-26' FROM flota.Conductor c WHERE c.rut='6644003-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6646356-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6646356-7','LUIS EDUARDO SILVA SILVA','POB. SAN HERNAN BLOCK 75 DPTO 33','995814314',NULL,'2022-08-16','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-10-11' FROM flota.Conductor c WHERE c.rut='6646356-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6686710-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6686710-2','NELSON ORLANDO  BOZO BECERRA','POB. LAUTARO PASAJE 2 CASA 1331 SAN FERNANDO','999579931',NULL,'2022-01-24','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-12-05' FROM flota.Conductor c WHERE c.rut='6686710-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6744579-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6744579-1','LUIS ARTURO MARTINEZ DIAZ','CURALI 330 SAN FERNANDO','975615183',NULL,'2021-06-14','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-09-27' FROM flota.Conductor c WHERE c.rut='6744579-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6759634-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6759634-K','RUBEN OCTAVIO JARA LOBOS','POBL. SANTA ELENA RIVERA DEL RIO 38 SAN FERNANDO','995059577',NULL,'2023-04-27','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-04-22' FROM flota.Conductor c WHERE c.rut='6759634-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6940525-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6940525-8','JUAN ANTONIO CORTEZ ORELLANA','VILLA SUR PJE CENTRAL 1454','998938218','juancortez@gmail.com','2022-02-16','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-11-14' FROM flota.Conductor c WHERE c.rut='6940525-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='7100138-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('7100138-5','ATILIO GREGORIO URBINA ARENAS','PTE NEGRO PJE MARTIN DE PORRES ST 38','968423039','atiliogregorio@gmail.com','2024-09-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2024-11-27' FROM flota.Conductor c WHERE c.rut='7100138-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='7146476-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('7146476-8','JAVIER BENITO CORREA CANTILLANA','ARAUCON 020 SAN FERNANDO','974883709',NULL,'2021-06-10','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-11-09' FROM flota.Conductor c WHERE c.rut='7146476-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='7551162-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('7551162-0','HERNAN ISIDORO ROMAN MOSCOSO','V. LAS FRUTAS LAS FRAMBUESAS 240 SAN FERNANDO','968328238',NULL,'2024-05-06','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-08-08' FROM flota.Conductor c WHERE c.rut='7551162-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='7554940-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('7554940-7','JOEL SEGUNDO MORALES VASQUEZ','NILCUNLAUTA 36 C SAN FERNANDO','992878278',NULL,'2021-06-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-03-02' FROM flota.Conductor c WHERE c.rut='7554940-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='7700947-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('7700947-7','JUAN PINTO CORNEJO','VILLA SAN JUAN BLOCK 5 DEPTO 32','994237746',NULL,'2025-03-21','2030-03-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-08-12' FROM flota.Conductor c WHERE c.rut='7700947-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='7859770-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('7859770-4','LUIS CÁDIZ BECERRA','TINGUIRIRICA MANUEL RODRIGUEZ 92','938840962',NULL,'2025-01-27','2025-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2025-12-12' FROM flota.Conductor c WHERE c.rut='7859770-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='7935922-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('7935922-k','RAMON LIZAMA PEREZ','EL LLANO ALTO PARCELA SAN JUAN S/N PUENTE NEGRO','997134758',NULL,'2025-10-10','2025-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-04-20' FROM flota.Conductor c WHERE c.rut='7935922-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8045345-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8045345-0','JOSE RICHARD ALARCON MATUS','V. GABRIELA MISTRAL PJE VICUÑA 1050 SAN FERNANDO','932692449',NULL,'2021-06-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-07-10' FROM flota.Conductor c WHERE c.rut='8045345-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8063610-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8063610-5','NELSON MANUEL CASTILLO MOLINA','V. DON DARIO PJE LOS NISPEROS 0136 SAN FERNANDO','963868794',NULL,'2021-08-17','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-07-20' FROM flota.Conductor c WHERE c.rut='8063610-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8159142-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8159142-3','PATRICIO SEGUNDO IBARRA ARAYA','V. CENTINELA ALCIDES ROLDAN 1290 SAN FERNANDO','958395252',NULL,'2021-06-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-11-25' FROM flota.Conductor c WHERE c.rut='8159142-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8159144-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8159144-3','PATRICIO IBARRA ARAYA','V. CENTINELA ALCIDES ROLDAN 1290','958395252',NULL,'2021-06-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-11-25' FROM flota.Conductor c WHERE c.rut='8159144-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8225407-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8225407-2','FRANCISCO EUGENIO DIAZ NORAMBUENA','PEDRO GISBERT 0118 SAN FERNANDO','989103308',NULL,'2024-10-23','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-10-04' FROM flota.Conductor c WHERE c.rut='8225407-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8256778-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8256778-K','JORGE ALBERTO KOLLER LÓPEZ','FIDEL MARIA PALLERES 366 SAN FERNANDO','935441545',NULL,'2023-09-15','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-01-27' FROM flota.Conductor c WHERE c.rut='8256778-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8259372-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8259372-1','LUIS MANUEL PALMA MOYA','LAS TINAJAS MANUEL RODRIGUEZ PONIENTE 0761','920217634','luispalma@gmail.com','2021-11-08','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-07-15' FROM flota.Conductor c WHERE c.rut='8259372-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8579144-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8579144-3','JOSE MIGUEL SANCHEZ URZUA','LOS HUERTOS CASA 41 SAN FERNANDO','983302213',NULL,'2021-06-15','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-10-25' FROM flota.Conductor c WHERE c.rut='8579144-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8744114-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8744114-8','RICARDO JESUS ESCOBAR BARRERA','AVENIDA CHILE 165 SAN FERNANDO','976970007',NULL,'2023-09-25','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-12-28' FROM flota.Conductor c WHERE c.rut='8744114-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8815067-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8815067-8','System.Xml.XmlElement','MIRAFLORES  1480','974898084','carlospavez@gmail.com','2021-09-23','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-01-31' FROM flota.Conductor c WHERE c.rut='8815067-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8874151-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8874151-K','MIGUEL ANGEL ESPINA GAETE','PJE GALVARINO 153 NANCAGUA','990194559',NULL,'2024-12-13','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-05-21' FROM flota.Conductor c WHERE c.rut='8874151-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8886477-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8886477-8','LUIS TORRES BRIONES','V. INDEPENDENCIA JOSE GANA 0291','945650224',NULL,'2025-06-02','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-12-18' FROM flota.Conductor c WHERE c.rut='8886477-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8972000-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8972000-1','System.Xml.XmlElement','NILCUNLAUTA 181 SAN FERNANDO','991999032',NULL,'2024-11-07','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-02-20' FROM flota.Conductor c WHERE c.rut='8972000-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8981855-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8981855-9','LUIS TRUJILLO SANTIBAÑEZ','PORVENIR NORTE SANTA BERNARDITA 33','999201581','luistrujillo@gmai.com','2024-02-05','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-24' FROM flota.Conductor c WHERE c.rut='8981855-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8982188-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8982188-6','System.Xml.XmlElement','System.Xml.XmlElement','958912317',NULL,'2022-08-26','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-04-10' FROM flota.Conductor c WHERE c.rut='8982188-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9040174-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9040174-2','LUIS ESPINOZA DIAZ','VILLA PRINCIPAL PSJE SA JOSE MORALES 1337','997572632','LESPINOZA@GMAIL.COM','2022-03-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-08-18' FROM flota.Conductor c WHERE c.rut='9040174-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9057615-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9057615-1','HUGO ENRIQUE MUÑOZ SALINAS','VILLA DON DARIO PJE LOS PERALES 025','945144313','hugomuñoz@gmail.com','2022-08-03','2024-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-04-19' FROM flota.Conductor c WHERE c.rut='9057615-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9057615-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9057615-7','HUGO MUÑOZ','V.DON DARIO PJE LOS PERALES 025 SAN FERNANDO','945144313',NULL,'2022-03-08','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-04-19' FROM flota.Conductor c WHERE c.rut='9057615-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9131344-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9131344-8','System.Xml.XmlElement','EL ROBLE 161 SAN FERNANDO','981646526',NULL,'2023-02-28','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-10-26' FROM flota.Conductor c WHERE c.rut='9131344-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9136775-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9136775-0','System.Xml.XmlElement','POB. SAN HERNAN BLOCK 59 DPTO. 12+','992324152',NULL,'2022-01-12','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-12-18' FROM flota.Conductor c WHERE c.rut='9136775-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9145768-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9145768-7','System.Xml.XmlElement','POB. INDEP. J IGNACIO ZENTENO 1539 SAN FERNANDO','984144909',NULL,'2024-03-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-05-19' FROM flota.Conductor c WHERE c.rut='9145768-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9178926-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9178926-4','BENJAMIN VIEDMA SILVA','V.SAN MARCOS SAN PABLO 0152 SAN FERNANDO','978714883',NULL,'2025-01-02','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2025-08-13' FROM flota.Conductor c WHERE c.rut='9178926-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9271681-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9271681-3','AMBROSIO DEL CARMEN FUENTES CORNEJO','POB. 18 SEPT. PJE.JOSE IBIETA 425 SAN FERNANDO','995115810',NULL,'2021-06-14','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-01' FROM flota.Conductor c WHERE c.rut='9271681-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9503594-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9503594-9','JUAN CARLOS SIGISFREDO JOVE SILVA','POBL. 18 DE SEPT. IGNACIO LA CARRERA 386 SAN FERNANDO','958037150',NULL,'2023-11-23','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-12-20' FROM flota.Conductor c WHERE c.rut='9503594-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9527671-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9527671-7','FERNANDO RODRIGO RIVERA ELIZONDO','LAS HARAS HACIENDA NORTA 0117  SAN FERNANDO','983197274',NULL,'2021-06-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-10-27' FROM flota.Conductor c WHERE c.rut='9527671-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9529119-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9529119-8','CARLOS GERMAN PARRAGUEZ VALENZUELA','V. LOMAS DE NINCUNLAUTA PJE VALLADOLID 159','940081228',NULL,'2021-06-22','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-10-27' FROM flota.Conductor c WHERE c.rut='9529119-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9756585-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9756585-6','MAXIMILIANO MANUEL GONZALEZ VARAS','V.DOÑA ESTER II AV. CIRCUNVALACION 751 SAN FERNANDO','941192665',NULL,'2021-06-11','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-01-10' FROM flota.Conductor c WHERE c.rut='9756585-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='9931613-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('9931613-6','JOSE LUIS CASTILLO PEÑALOZA','POBL.SANTA ELENA GABRIELA 17 SAN FERNANDO','976362546',NULL,'2021-06-09','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-10-09' FROM flota.Conductor c WHERE c.rut='9931613-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11530199-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11530199-3','MARIO ALBERTO ZUÑIGA GONZALEZ','ALCAYAGA 1025 V. GABRIELA MISTRAL SAN FERNANDO','985378365',NULL,'2025-08-01','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-12-30' FROM flota.Conductor c WHERE c.rut='11530199-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16310614-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16310614-0','Daniel Muñoz Vargas','Lomas de Nincunlauta pje la Mancha 1845','991327499',NULL,'2025-08-05','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-05-14' FROM flota.Conductor c WHERE c.rut='16310614-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='21521925-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('21521925-9','JOSE ZAMORANO PINO','SANTA ISABEL POLONIA S/N°','968405774',NULL,'2025-09-08','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-18' FROM flota.Conductor c WHERE c.rut='21521925-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='12530996-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('12530996-8','SEBASTIAN ANDRADES CONTRERAS','VILLA DOÑA ESTER III EL ROBLE 0416','988861546',NULL,'2025-07-14','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-01-20' FROM flota.Conductor c WHERE c.rut='12530996-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13100488-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13100488-5','JUAN FARIAS MIRANDA','CUESTA LO GONZALEZ C. SAN LUIS C 5','923794821',NULL,'2025-09-26','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-03-31' FROM flota.Conductor c WHERE c.rut='13100488-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15916709-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15916709-7','System.Xml.XmlElement','LAS TINAJAS 2 P.TITIRITEROS J. FERRARI SAN FERNANDO','953900430',NULL,'2025-09-30','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-02-01' FROM flota.Conductor c WHERE c.rut='15916709-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16928883-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16928883-6','FERNANDO PAVEZ PAVEZ','VILLA PARQUE LAUCA PJE HUMAPARKANORTE BLOC1151 DPTO 102','975534844',NULL,'2025-10-14','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-03' FROM flota.Conductor c WHERE c.rut='16928883-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18229193-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18229193-5','HARVEY MALDONADO LLANTÉN','CALLE SAN JAVIER S/N','936349222',NULL,'2025-10-08','2025-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-05-19' FROM flota.Conductor c WHERE c.rut='18229193-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='27197442-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('27197442-6','Osmar Jesus Morillo Aguirre','Poblacion Independencia V Psje Alcides Roldan 1673','986099507',NULL,'2025-06-13','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-09-13' FROM flota.Conductor c WHERE c.rut='27197442-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13338220-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13338220-8','MARCELO MUÑOZ ESPINA','ARAUCARIAS DE NILCUNLAUTA PJE NILAHUE 3242','957358877',NULL,'2025-11-03','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-07-23' FROM flota.Conductor c WHERE c.rut='13338220-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15528046-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15528046-8','ANDRÉS JORQUERA MORENO','SANTA ISABEL S/N CHIMBARONGO','986100865','NS','2025-10-20','2025-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-06' FROM flota.Conductor c WHERE c.rut='15528046-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13713716-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13713716-K','System.Xml.XmlElement','SAN JOSE DE LOS LINGUES S/N SAN FERNANDO','988591510',NULL,'2025-12-09','2028-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-08-13' FROM flota.Conductor c WHERE c.rut='13713716-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18229621-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18229621-k','HUGO GAJARDO CONCHA','VILLA NATIVA PASJE OLIVILLO 583 SAN FERNANDO','985282913',NULL,'2025-11-11','2025-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-08-07' FROM flota.Conductor c WHERE c.rut='18229621-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='20744834-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('20744834-6','JORGE ZUÑIGA ACEVEDO','PETRONILA ALCAYAGA 1025 GABRIELA MISTRAL','985436699',NULL,'2025-11-26','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-07-27' FROM flota.Conductor c WHERE c.rut='20744834-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15754712-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15754712-7','SEBASTIAN ORREGO JOPIA','LOS LINGUES S/N°','961887047',NULL,'2025-12-12','2026-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-10-30' FROM flota.Conductor c WHERE c.rut='15754712-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11761321-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11761321-6','LUIS PIÑA CELIS','VILLA DON DARIO CALLE JUAN JIMENEZ 0186','959570705',NULL,'2025-12-29','2030-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-04-12' FROM flota.Conductor c WHERE c.rut='11761321-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6135483-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6135483-2','JUAN GONZALEZ PINO','V. EL RODEO SUR PJE CHAMPION 0669','123459789',NULL,'2025-12-15','2027-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-30' FROM flota.Conductor c WHERE c.rut='6135483-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18296786-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18296786-6','JUAN ANDRES MENESES NUÑEZ','Villa San Juan  Block 5 dpto16','989872792','j.x@live.cl','2025-12-22','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-07-12' FROM flota.Conductor c WHERE c.rut='18296786-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='11952332-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('11952332-K','CRISTIAN TAPIA','AVENIDA CIRCUNVALACION 965 VILLA DOÑA ESTER 2','995769182','CRTA1972@GMAIL.COM','2026-02-09','2026-02-28');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-07-04' FROM flota.Conductor c WHERE c.rut='11952332-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6395039-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6395039-4','System.Xml.XmlElement','POBL. LAUTARO PJE 7 CASA 414 SAN FERNANDO','978780705',NULL,'2021-06-14','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-11-28' FROM flota.Conductor c WHERE c.rut='6395039-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13867830-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13867830-k','PATRICIO ALCAINO CASTRO','CAMINO REAL 1551','932929114','patricioalcaino66@gmail.com','2026-01-05','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-04-08' FROM flota.Conductor c WHERE c.rut='13867830-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16725733-k')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16725733-k','FRANCISCO CACERES VERGARA','CALLE MAIPU 191','965930504',NULL,'2025-12-09','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2025-12-31' FROM flota.Conductor c WHERE c.rut='16725733-k'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13347820-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13347820-5','MARCO ORELLANA BARRERA','VILLA RUCATALCA PJE. INTERIOR 0147','965267645',NULL,'2025-05-12','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-11-14' FROM flota.Conductor c WHERE c.rut='13347820-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13439812-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13439812-4','JUAN MONSALVE','System.Xml.XmlElement','958241371',NULL,'2026-03-16','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-07-24' FROM flota.Conductor c WHERE c.rut='13439812-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13571418-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13571418-6','DIEGO PÉREZ ESPINOZA','EL ALAMO 800 SAN FERNANDO','930748065',NULL,'2026-03-30','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-04-30' FROM flota.Conductor c WHERE c.rut='13571418-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13575424-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13575424-2','ALEJNDRINA ROJAS VERDUGO','NEGRETE 433','984276178',NULL,'2026-01-08','2026-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-07-10' FROM flota.Conductor c WHERE c.rut='13575424-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13779754-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13779754-2','System.Xml.XmlElement','VILLA SAN BASILIO CALLE YERBAS BUENAS # 391','976798486',NULL,'2026-03-19','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-01-10' FROM flota.Conductor c WHERE c.rut='13779754-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14047975-6')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14047975-6','EMILIO ANDRADE PAVEZ','LOMAS DE NICOLAUTA PSJE TENERIFE 1850','951591021',NULL,'2026-02-09','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-01-24' FROM flota.Conductor c WHERE c.rut='14047975-6'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='14049121-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('14049121-7','JORGE CATRIAN VEGA','V. EL ROBLE PJE HERIBERTO SOTO 989 SAN FERNANDO','934360974',NULL,'2026-03-25','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-10-19' FROM flota.Conductor c WHERE c.rut='14049121-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15119193-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15119193-2','VICTOR NAVARRO SILVA','VILLA CENTINELA PJE JOSE SALAS 009','950591488',NULL,'2026-03-16','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-04-08' FROM flota.Conductor c WHERE c.rut='15119193-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15523501-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15523501-2','ALEX SOTO COLLAO','RUTA I 90 KM 0 FRENTE A ALIFRUT SAN FERNANDO','928128154',NULL,'2026-01-29','2026-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-01-25' FROM flota.Conductor c WHERE c.rut='15523501-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='15698139-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('15698139-7','RICHAR CÉSPEDES LÓPEZ','VILLA RODEO PSJE EL GALOPE N° 1660','955349701',NULL,'2026-03-03','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-10-27' FROM flota.Conductor c WHERE c.rut='15698139-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16834467-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16834467-7','RICARDO HIGUERA VERA','NEGRETE 1246','928417822',NULL,'2026-02-26','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2030-12-21' FROM flota.Conductor c WHERE c.rut='16834467-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='16860604-4')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('16860604-4','SAMUEL PEÑALOZA RIQUELME','GARCIA URTDADO DE MENDOZA 65','946744080','SAMUELANTONY@HOTMAIL.COM','2026-02-09','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-01-07' FROM flota.Conductor c WHERE c.rut='16860604-4'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='17211491-1')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('17211491-1','CAROLINA SANDOVAL BERMEDO','LOS AREGLADORES PJE A CRUCHAGA 532','964311991',NULL,'2026-01-07','2026-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-09' FROM flota.Conductor c WHERE c.rut='17211491-1'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18320504-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18320504-8','JOSE GONZALEZ BRAVO','EL BRONCE 0782 VILLA ORIGEN SAN FERNANDO','948957705',NULL,'2026-02-03','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-11-28' FROM flota.Conductor c WHERE c.rut='18320504-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18506392-5')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18506392-5','STEFANO ADRIAN OYARCE ACEVEDO','TEODORO SCHMIDT 1572 VILLA CONAVICOOP','974793537',NULL,'2026-01-28','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-05-29' FROM flota.Conductor c WHERE c.rut='18506392-5'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18515311-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18515311-8','AYLEEN TRUJILLO SANTIBAÑEZ','VILLA NATIVA PASAJE OLIVILLO 583 SAN FERNANDO','989277204',NULL,'2026-03-27','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2031-03-15' FROM flota.Conductor c WHERE c.rut='18515311-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18721994-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18721994-9','FRANCISCO ACEVEDO CELIS','PUENTE NEGRO EL LLANO ALTO S/N','982628993',NULL,'2026-01-21','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-07-19' FROM flota.Conductor c WHERE c.rut='18721994-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='18722129-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('18722129-3','SEBASTIAN MENESES AHUMADA','AGUA BUENA CALLEJON VALDOVINOS S/N','953992027',NULL,'2026-01-06','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-12' FROM flota.Conductor c WHERE c.rut='18722129-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='19262035-K')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('19262035-K','MARCELO FUENTES CAVIERES','SAN JUAN DE LA SIERRA S/N','933909110','FUENTESMARCELO90@GMAIL.COM','2026-03-27','2030-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-05-29' FROM flota.Conductor c WHERE c.rut='19262035-K'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='19452816-7')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('19452816-7','JOSE ESPINOZA VALENZUELA','PLACILLA VILLA SAN FRANCISCO CALLE PADRE HURTADO 1132','935377302',NULL,'2026-03-18','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-15' FROM flota.Conductor c WHERE c.rut='19452816-7'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='20970530-3')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('20970530-3','joaquin patricio fernandez sandoval','avenida circunvalacion psje carlos brito 0369','930640840','j.fernandezsandov.2001@gmail.com','2025-12-22','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2026-09-15' FROM flota.Conductor c WHERE c.rut='20970530-3'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8468217-2')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8468217-2','VICTOR BUSTOS BRIONES','RAMON FREIRE 1490 POBL. INDEPENDENCIA SAN FERNANDO','975583435',NULL,'2026-03-18','2026-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-11-11' FROM flota.Conductor c WHERE c.rut='8468217-2'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='8677228-0')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('8677228-0','WALDO CASTILLO MELLA','POBL. CARDENAL CARO PJE BARTOLOME DELAS CASAS N 14','927742218',NULL,'2026-02-12','2026-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2029-12-26' FROM flota.Conductor c WHERE c.rut='8677228-0'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='13779837-9')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('13779837-9','JUAN CORTEZ AGUIRRE','MIRAFLORES 1221 POBL. SAN MARTIN SAN FERNANDO','945420869',NULL,'2026-04-02','2026-12-31');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2028-02-06' FROM flota.Conductor c WHERE c.rut='13779837-9'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut='6712315-8')
  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)
  VALUES('6712315-8','Benjamin Rodriguez Herrera','los Palacios 169 block 8 depto 11','964885698',NULL,'2026-04-10','2026-12-30');
INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)
SELECT c.id_conductor,1,'2027-03-17' FROM flota.Conductor c WHERE c.rut='6712315-8'
AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);

-- ================================================
-- VEHICULOS
-- ================================================
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='AAAA-11')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('AAAA-11',1,'2024-04-30',NULL,'45797');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2027-04-30' FROM flota.Vehiculo v
WHERE v.patente='AAAA-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2027-04-30' FROM flota.Vehiculo v
WHERE v.patente='AAAA-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2027-04-30' FROM flota.Vehiculo v
WHERE v.patente='AAAA-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-04-30'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15123366-K'
WHERE v.patente='AAAA-11'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='BXSH-97')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('BXSH-97',1,'2021-06-10',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2023-05-31' FROM flota.Vehiculo v
WHERE v.patente='BXSH-97' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2023-05-31' FROM flota.Vehiculo v
WHERE v.patente='BXSH-97' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2023-05-02' FROM flota.Vehiculo v
WHERE v.patente='BXSH-97' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-10'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6017825-9'
WHERE v.patente='BXSH-97'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='BXXZ-58')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('BXXZ-58',1,'2022-10-06',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='BXXZ-58' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='BXXZ-58' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-24' FROM flota.Vehiculo v
WHERE v.patente='BXXZ-58' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-10-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6017825-9'
WHERE v.patente='BXXZ-58'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='CXWH-76')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('CXWH-76',1,'2022-03-15',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='CXWH-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='CXWH-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-06' FROM flota.Vehiculo v
WHERE v.patente='CXWH-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-03-15'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13200849-3'
WHERE v.patente='CXWH-76'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVSD-58')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVSD-58',1,'2025-11-26',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSD-58' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSD-58' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-19' FROM flota.Vehiculo v
WHERE v.patente='PVSD-58' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-11-26'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11530656-9'
WHERE v.patente='PVSD-58'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='DHYT-76')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('DHYT-76',1,'2021-06-14',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='DHYT-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='DHYT-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-17' FROM flota.Vehiculo v
WHERE v.patente='DHYT-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6744579-1'
WHERE v.patente='DHYT-76'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FDVB-57')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FDVB-57',1,'2021-01-09',NULL,'45616');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDVB-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDVB-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-11' FROM flota.Vehiculo v
WHERE v.patente='FDVB-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-01-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11760555-8'
WHERE v.patente='FDVB-57'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVSD-68')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVSD-68',1,'2021-06-11',NULL,'45607');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSD-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSD-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-12' FROM flota.Vehiculo v
WHERE v.patente='PVSD-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-11'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='12413397-1'
WHERE v.patente='PVSD-68'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FDVZ-60')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FDVZ-60',1,'2025-06-13',NULL,'45824');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDVZ-60' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDVZ-60' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2025-11-14' FROM flota.Vehiculo v
WHERE v.patente='FDVZ-60' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-06-13'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='14260593-7'
WHERE v.patente='FDVZ-60'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FDVZ-84')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FDVZ-84',1,'2022-07-07',NULL,'45607');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDVZ-84' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDVZ-84' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-07' FROM flota.Vehiculo v
WHERE v.patente='FDVZ-84' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-07-07'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10916547-6'
WHERE v.patente='FDVZ-84'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FDWJ-84')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FDWJ-84',1,'2025-04-10',NULL,'45756');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDWJ-84' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDWJ-84' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-04' FROM flota.Vehiculo v
WHERE v.patente='FDWJ-84' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-04-10'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11433470-7'
WHERE v.patente='FDWJ-84'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FDWK-69')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FDWK-69',1,'2021-09-06',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDWK-69' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDWK-69' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-06' FROM flota.Vehiculo v
WHERE v.patente='FDWK-69' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15117507-4'
WHERE v.patente='FDWK-69'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FDWX-91')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FDWX-91',1,'2022-08-04',NULL,'45615');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDWX-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDWX-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-01-29' FROM flota.Vehiculo v
WHERE v.patente='FDWX-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-08-04'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13304265-2'
WHERE v.patente='FDWX-91'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FDXV-71')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FDXV-71',1,'2021-08-25',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDXV-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDXV-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-06' FROM flota.Vehiculo v
WHERE v.patente='FDXV-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-08-25'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11952903-4'
WHERE v.patente='FDXV-71'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FDXV-86')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FDXV-86',1,'2021-10-06',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDXV-86' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FDXV-86' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-11' FROM flota.Vehiculo v
WHERE v.patente='FDXV-86' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-10-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6017825-9'
WHERE v.patente='FDXV-86'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FJXZ-11')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FJXZ-11',1,'2021-10-06',NULL,'45615');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FJXZ-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FJXZ-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-16' FROM flota.Vehiculo v
WHERE v.patente='FJXZ-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-10-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7146476-8'
WHERE v.patente='FJXZ-11'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FKCR-79')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FKCR-79',1,'2021-08-11',NULL,'45561');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FKCR-79' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FKCR-79' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-07' FROM flota.Vehiculo v
WHERE v.patente='FKCR-79' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-08-11'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8259372-1'
WHERE v.patente='FKCR-79'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FLZP-55')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FLZP-55',1,'2024-04-15',NULL,'45616');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FLZP-55' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FLZP-55' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2025-07-04' FROM flota.Vehiculo v
WHERE v.patente='FLZP-55' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-04-15'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='17059232-8'
WHERE v.patente='FLZP-55'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FXLR-13')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FXLR-13',1,'2021-11-06',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FXLR-13' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='FXLR-13' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-02' FROM flota.Vehiculo v
WHERE v.patente='FXLR-13' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15117911-8'
WHERE v.patente='FXLR-13'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='FXVK-87')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('FXVK-87',1,'2022-02-03',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2024-05-31' FROM flota.Vehiculo v
WHERE v.patente='FXVK-87' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2024-05-31' FROM flota.Vehiculo v
WHERE v.patente='FXVK-87' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2025-05-31' FROM flota.Vehiculo v
WHERE v.patente='FXVK-87' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-02-03'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15914358-9'
WHERE v.patente='FXVK-87'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='GBYP-67')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('GBYP-67',1,'2024-06-15',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GBYP-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GBYP-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-06' FROM flota.Vehiculo v
WHERE v.patente='GBYP-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-06-15'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8752048-6'
WHERE v.patente='GBYP-67'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='GBYP-78')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('GBYP-78',1,'2019-06-05',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GBYP-78' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GBYP-78' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2019-06-05'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10726874-K'
WHERE v.patente='GBYP-78'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='GBZF-21')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('GBZF-21',1,'2021-06-22',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GBZF-21' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GBZF-21' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-10' FROM flota.Vehiculo v
WHERE v.patente='GBZF-21' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-22'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15698448-5'
WHERE v.patente='GBZF-21'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='GBZV-36')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('GBZV-36',1,'2022-01-08',NULL,'45611');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GBZV-36' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GBZV-36' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-17' FROM flota.Vehiculo v
WHERE v.patente='GBZV-36' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-01-08'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='14261886-9'
WHERE v.patente='GBZV-36'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='GPXK-41')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('GPXK-41',1,'2021-08-25',NULL,'45615');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GPXK-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GPXK-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-27' FROM flota.Vehiculo v
WHERE v.patente='GPXK-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-08-25'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11952903-4'
WHERE v.patente='GPXK-41'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='GPYW-59')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('GPYW-59',1,'2021-06-10',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GPYW-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GPYW-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-17' FROM flota.Vehiculo v
WHERE v.patente='GPYW-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-10'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11761569-3'
WHERE v.patente='GPYW-59'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='GPYW-93')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('GPYW-93',1,'2025-06-17',NULL,'45825');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GPYW-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GPYW-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-14' FROM flota.Vehiculo v
WHERE v.patente='GPYW-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-06-17'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='14260593-7'
WHERE v.patente='GPYW-93'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='GYCY-50')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('GYCY-50',1,'2021-09-06',NULL,'45561');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GYCY-50' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='GYCY-50' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-26' FROM flota.Vehiculo v
WHERE v.patente='GYCY-50' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='5246025-5'
WHERE v.patente='GYCY-50'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HBLL-48')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HBLL-48',1,'2021-06-29',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HBLL-48' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HBLL-48' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-26' FROM flota.Vehiculo v
WHERE v.patente='HBLL-48' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-29'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13569694-3'
WHERE v.patente='HBLL-48'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HDJY-97')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HDJY-97',1,'2021-03-08',NULL,'45607');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HDJY-97' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HDJY-97' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-12' FROM flota.Vehiculo v
WHERE v.patente='HDJY-97' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-03-08'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15915952-3'
WHERE v.patente='HDJY-97'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HGGK-75')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HGGK-75',1,'2021-06-14',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGGK-75' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGGK-75' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11743655-1'
WHERE v.patente='HGGK-75'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HGGW-14')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HGGW-14',1,'2021-06-16',NULL,'45611');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGGW-14' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGGW-14' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-20' FROM flota.Vehiculo v
WHERE v.patente='HGGW-14' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-16'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13347360-2'
WHERE v.patente='HGGW-14'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVSF-16')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVSF-16',1,'2021-02-07',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSF-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-15' FROM flota.Vehiculo v
WHERE v.patente='PVSF-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-02-07'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13569906-3'
WHERE v.patente='PVSF-16'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HGHJ-91')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HGHJ-91',1,'2024-01-01',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGHJ-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGHJ-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-14' FROM flota.Vehiculo v
WHERE v.patente='HGHJ-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-01-01'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15649660-K'
WHERE v.patente='HGHJ-91'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HGHT-93')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HGHT-93',1,'2021-06-09',NULL,'45611');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGHT-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGHT-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-17' FROM flota.Vehiculo v
WHERE v.patente='HGHT-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11279202-3'
WHERE v.patente='HGHT-93'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HGHT-94')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HGHT-94',1,'2021-06-22',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGHT-94' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGHT-94' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-20' FROM flota.Vehiculo v
WHERE v.patente='HGHT-94' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-22'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6178392-K'
WHERE v.patente='HGHT-94'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HGHV-19')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HGHV-19',1,'2021-09-06',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGHV-19' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HGHV-19' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-06' FROM flota.Vehiculo v
WHERE v.patente='HGHV-19' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7354610-9'
WHERE v.patente='HGHV-19'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HJVG-42')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HJVG-42',1,'2021-01-16',NULL,'45560');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HJVG-42' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HJVG-42' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-09' FROM flota.Vehiculo v
WHERE v.patente='HJVG-42' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-01-16'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11530199-3'
WHERE v.patente='HJVG-42'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWHC-56')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWHC-56',1,'2026-03-16',NULL,'46097');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWHC-56' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWHC-56' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-09' FROM flota.Vehiculo v
WHERE v.patente='JWHC-56' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2026-03-16'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8045345-0'
WHERE v.patente='JWHC-56'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HWYJ-33')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HWYJ-33',1,'2021-11-06',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-23' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8159142-3'
WHERE v.patente='HWYJ-33'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HWYJ-65')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HWYJ-65',1,'2021-09-06',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-65' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-65' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-18' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-65' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7354610-9'
WHERE v.patente='HWYJ-65'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HWYJ-95')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HWYJ-95',1,'2021-09-06',NULL,'45575');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-95' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-95' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-02' FROM flota.Vehiculo v
WHERE v.patente='HWYJ-95' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15916725-9'
WHERE v.patente='HWYJ-95'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HWZG-63')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HWZG-63',1,'2022-04-03',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HWZG-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HWZG-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-18' FROM flota.Vehiculo v
WHERE v.patente='HWZG-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-04-03'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11743655-1'
WHERE v.patente='HWZG-63'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JVDZ-30')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JVDZ-30',1,'2023-10-04',NULL,'45561');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JVDZ-30' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JVDZ-30' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-03-13' FROM flota.Vehiculo v
WHERE v.patente='JVDZ-30' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-10-04'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10858763-6'
WHERE v.patente='JVDZ-30'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWHB-70')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWHB-70',1,'2021-11-06',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWHB-70' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWHB-70' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-24' FROM flota.Vehiculo v
WHERE v.patente='JWHB-70' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7957636-0'
WHERE v.patente='JWHB-70'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWHB-83')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWHB-83',1,'2021-11-29',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWHB-83' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWHB-83' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-02' FROM flota.Vehiculo v
WHERE v.patente='JWHB-83' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-29'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='5467133-4'
WHERE v.patente='JWHB-83'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWHC-17')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWHC-17',1,'2021-09-23',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWHC-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWHC-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-03' FROM flota.Vehiculo v
WHERE v.patente='JWHC-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-23'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13346398-4'
WHERE v.patente='JWHC-17'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWJF-56')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWJF-56',1,'2021-06-09',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWJF-56' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWJF-56' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-27' FROM flota.Vehiculo v
WHERE v.patente='JWJF-56' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='18989824-K'
WHERE v.patente='JWJF-56'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWJY-11')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWJY-11',1,'2024-11-06',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWJY-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWJY-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2025-09-05' FROM flota.Vehiculo v
WHERE v.patente='JWJY-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='5030538-4'
WHERE v.patente='JWJY-11'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWJY-22')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWJY-22',1,'2025-02-03',NULL,'45691');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWJY-22' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWJY-22' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-02-19' FROM flota.Vehiculo v
WHERE v.patente='JWJY-22' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-02-03'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='14260593-7'
WHERE v.patente='JWJY-22'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWKL-38')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWKL-38',1,'2021-11-06',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWKL-38' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWKL-38' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-20' FROM flota.Vehiculo v
WHERE v.patente='JWKL-38' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='14261222-4'
WHERE v.patente='JWKL-38'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWKL-63')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWKL-63',1,'2021-06-09',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2025-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWKL-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2025-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWKL-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2025-05-02' FROM flota.Vehiculo v
WHERE v.patente='JWKL-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='17746912-2'
WHERE v.patente='JWKL-63'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWKL-71')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWKL-71',1,'2021-06-22',NULL,'45560');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWKL-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWKL-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-03' FROM flota.Vehiculo v
WHERE v.patente='JWKL-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-22'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10737580-5'
WHERE v.patente='JWKL-71'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='JWKL-73')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('JWKL-73',1,'2021-06-22',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2025-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWKL-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2025-05-31' FROM flota.Vehiculo v
WHERE v.patente='JWKL-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2023-12-28' FROM flota.Vehiculo v
WHERE v.patente='JWKL-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-22'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10643083-7'
WHERE v.patente='JWKL-73'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='RPFY-69')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('RPFY-69',1,'2021-06-14',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='RPFY-69' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='RPFY-69' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-03' FROM flota.Vehiculo v
WHERE v.patente='RPFY-69' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10914820-2'
WHERE v.patente='RPFY-69'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCRG-93')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCRG-93',1,'2021-09-08',NULL,'45616');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCRG-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCRG-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-06' FROM flota.Vehiculo v
WHERE v.patente='KCRG-93' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-08'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='5246025-5'
WHERE v.patente='KCRG-93'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCXB-59')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCXB-59',1,'2024-10-06',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXB-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXB-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-24' FROM flota.Vehiculo v
WHERE v.patente='KCXB-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-10-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6017825-9'
WHERE v.patente='KCXB-59'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCXB-68')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCXB-68',1,'2021-06-14',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXB-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXB-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-20' FROM flota.Vehiculo v
WHERE v.patente='KCXB-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='9271681-3'
WHERE v.patente='KCXB-68'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCXB-75')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCXB-75',1,'2021-09-06',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXB-75' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXB-75' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-10' FROM flota.Vehiculo v
WHERE v.patente='KCXB-75' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='14352221-0'
WHERE v.patente='KCXB-75'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCXB-76')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCXB-76',1,'2021-06-10',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXB-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXB-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-09' FROM flota.Vehiculo v
WHERE v.patente='KCXB-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-10'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7550372-5'
WHERE v.patente='KCXB-76'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCXP-33')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCXP-33',1,'2021-05-11',NULL,'45561');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXP-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXP-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-20' FROM flota.Vehiculo v
WHERE v.patente='KCXP-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-05-11'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11952903-4'
WHERE v.patente='KCXP-33'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCXP-40')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCXP-40',1,'2021-06-14',NULL,'45533');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXP-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXP-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-13' FROM flota.Vehiculo v
WHERE v.patente='KCXP-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6935231-6'
WHERE v.patente='KCXP-40'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCXP-53')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCXP-53',1,'2024-11-14',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXP-53' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCXP-53' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-28' FROM flota.Vehiculo v
WHERE v.patente='KCXP-53' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-11-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15915893-4'
WHERE v.patente='KCXP-53'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYK-57')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYK-57',1,'2021-11-06',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYK-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYK-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-13' FROM flota.Vehiculo v
WHERE v.patente='KCYK-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11952903-4'
WHERE v.patente='KCYK-57'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYK-78')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYK-78',1,'2023-10-07',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYK-78' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYK-78' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-04' FROM flota.Vehiculo v
WHERE v.patente='KCYK-78' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-10-07'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='17058993-9'
WHERE v.patente='KCYK-78'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYR-37')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYR-37',1,'2021-06-15',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYR-37' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYR-37' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-20' FROM flota.Vehiculo v
WHERE v.patente='KCYR-37' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-15'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='12413613-K'
WHERE v.patente='KCYR-37'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYR-40')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYR-40',1,'2021-06-09',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYR-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYR-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-13' FROM flota.Vehiculo v
WHERE v.patente='KCYR-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8892584-K'
WHERE v.patente='KCYR-40'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYR-46')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYR-46',1,'2022-02-16',NULL,'45568');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYR-46' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYR-46' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-25' FROM flota.Vehiculo v
WHERE v.patente='KCYR-46' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-02-16'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6940525-8'
WHERE v.patente='KCYR-46'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYR-50')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYR-50',1,'2021-09-06',NULL,'45616');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYR-50' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYR-50' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-23' FROM flota.Vehiculo v
WHERE v.patente='KCYR-50' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11743655-1'
WHERE v.patente='KCYR-50'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYY-63')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYY-63',1,'2024-06-17',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYY-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYY-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-09' FROM flota.Vehiculo v
WHERE v.patente='KCYY-63' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-06-17'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13779705-4'
WHERE v.patente='KCYY-63'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYY-84')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYY-84',1,'2021-06-11',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYY-84' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYY-84' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-11'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11952903-4'
WHERE v.patente='KCYY-84'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCYY-85')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCYY-85',1,'2021-05-11',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYY-85' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCYY-85' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-09' FROM flota.Vehiculo v
WHERE v.patente='KCYY-85' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-05-11'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11952903-4'
WHERE v.patente='KCYY-85'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KCZR-57')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KCZR-57',1,'2021-11-05',NULL,'45615');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCZR-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KCZR-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-27' FROM flota.Vehiculo v
WHERE v.patente='KCZR-57' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-05'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11952903-4'
WHERE v.patente='KCZR-57'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYGL-64')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYGL-64',1,'2024-08-20',NULL,'45615');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGL-64' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGL-64' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-04' FROM flota.Vehiculo v
WHERE v.patente='KYGL-64' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-08-20'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13780194-9'
WHERE v.patente='KYGL-64'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYGL-91')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYGL-91',1,'2022-10-20',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGL-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGL-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-20' FROM flota.Vehiculo v
WHERE v.patente='KYGL-91' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-10-20'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7532446-4'
WHERE v.patente='KYGL-91'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYGL-92')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYGL-92',1,'2022-10-20',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGL-92' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGL-92' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-05' FROM flota.Vehiculo v
WHERE v.patente='KYGL-92' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-10-20'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7532446-4'
WHERE v.patente='KYGL-92'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYGP-15')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYGP-15',1,'2021-06-14',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGP-15' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGP-15' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-24' FROM flota.Vehiculo v
WHERE v.patente='KYGP-15' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='12414291-1'
WHERE v.patente='KYGP-15'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYGP-18')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYGP-18',1,'2024-02-03',NULL,'45691');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGP-18' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGP-18' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-03' FROM flota.Vehiculo v
WHERE v.patente='KYGP-18' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-02-03'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='18228886-1'
WHERE v.patente='KYGP-18'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYGP-24')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYGP-24',1,'2021-06-14',NULL,'45604');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGP-24' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGP-24' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-07' FROM flota.Vehiculo v
WHERE v.patente='KYGP-24' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6395039-4'
WHERE v.patente='KYGP-24'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYGP-27')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYGP-27',1,'2021-10-06',NULL,'45607');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGP-27' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYGP-27' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-03' FROM flota.Vehiculo v
WHERE v.patente='KYGP-27' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-10-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13304298-9'
WHERE v.patente='KYGP-27'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYJF-68')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYJF-68',1,'2021-06-09',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYJF-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYJF-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-23' FROM flota.Vehiculo v
WHERE v.patente='KYJF-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11743655-1'
WHERE v.patente='KYJF-68'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYJT-10')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYJT-10',1,'2021-09-06',NULL,'45607');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYJT-10' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYJT-10' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-06' FROM flota.Vehiculo v
WHERE v.patente='KYJT-10' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15118232-1'
WHERE v.patente='KYJT-10'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KYJT-17')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KYJT-17',1,'2021-06-10',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYJT-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KYJT-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-22' FROM flota.Vehiculo v
WHERE v.patente='KYJT-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-10'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6017825-9'
WHERE v.patente='KYJT-17'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='KZTY-67')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('KZTY-67',1,'2024-07-24',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KZTY-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='KZTY-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-11' FROM flota.Vehiculo v
WHERE v.patente='KZTY-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-07-24'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15119406-0'
WHERE v.patente='KZTY-67'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LSFL-43')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LSFL-43',1,'2022-08-16',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LSFL-43' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LSFL-43' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-22' FROM flota.Vehiculo v
WHERE v.patente='LSFL-43' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-08-16'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6646356-7'
WHERE v.patente='LSFL-43'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSR-61')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSR-61',1,'2021-06-09',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSR-61' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSR-61' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-07' FROM flota.Vehiculo v
WHERE v.patente='LZSR-61' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11743655-1'
WHERE v.patente='LZSR-61'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSR-64')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSR-64',1,'2024-06-17',NULL,'45607');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-18' FROM flota.Vehiculo v
WHERE v.patente='LZSR-64' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-06-17'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13304298-9'
WHERE v.patente='LZSR-64'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSR-76')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSR-76',1,'2022-03-08',NULL,'45561');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSR-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSR-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-13' FROM flota.Vehiculo v
WHERE v.patente='LZSR-76' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-03-08'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='9057615-1'
WHERE v.patente='LZSR-76'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSR-99')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSR-99',1,'2021-08-17',NULL,'45603');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSR-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSR-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-18' FROM flota.Vehiculo v
WHERE v.patente='LZSR-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-08-17'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8063610-5'
WHERE v.patente='LZSR-99'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSS-10')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSS-10',1,'2022-01-01',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-10' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-10' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-28' FROM flota.Vehiculo v
WHERE v.patente='LZSS-10' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-01-01'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='9276715-9'
WHERE v.patente='LZSS-10'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSS-11')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSS-11',1,'2021-09-23',NULL,'45561');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-24' FROM flota.Vehiculo v
WHERE v.patente='LZSS-11' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-23'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='16165484-1'
WHERE v.patente='LZSS-11'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSS-16')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSS-16',1,'2021-10-18',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2025-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2025-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2024-12-03' FROM flota.Vehiculo v
WHERE v.patente='LZSS-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-10-18'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10375863-7'
WHERE v.patente='LZSS-16'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSS-24')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSS-24',1,'2021-09-11',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-24' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-24' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-28' FROM flota.Vehiculo v
WHERE v.patente='LZSS-24' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-09-11'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11279329-1'
WHERE v.patente='LZSS-24'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZSS-30')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZSS-30',1,'2022-01-12',NULL,'45568');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-30' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZSS-30' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-11' FROM flota.Vehiculo v
WHERE v.patente='LZSS-30' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-01-12'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='9136775-0'
WHERE v.patente='LZSS-30'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZTR-17')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZTR-17',1,'2022-08-01',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTR-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTR-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-06' FROM flota.Vehiculo v
WHERE v.patente='LZTR-17' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-08-01'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='16973070-9'
WHERE v.patente='LZTR-17'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZTR-41')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZTR-41',1,'2022-04-05',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTR-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTR-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-07' FROM flota.Vehiculo v
WHERE v.patente='LZTR-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-04-05'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11530199-3'
WHERE v.patente='LZTR-41'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZTZ-16')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZTZ-16',1,'2024-09-26',NULL,'45607');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-23' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-09-26'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15915952-3'
WHERE v.patente='LZTZ-16'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZTZ-47')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZTZ-47',1,'2021-10-26',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-47' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-47' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-11' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-47' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-10-26'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7903010-4'
WHERE v.patente='LZTZ-47'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZTZ-49')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZTZ-49',1,'2022-01-24',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-49' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-49' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-21' FROM flota.Vehiculo v
WHERE v.patente='LZTZ-49' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-01-24'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6686710-2'
WHERE v.patente='LZTZ-49'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZVK-65')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZVK-65',1,'2022-06-01',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-65' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-65' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-02' FROM flota.Vehiculo v
WHERE v.patente='LZVK-65' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZVK-66')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZVK-66',1,'2022-02-06',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-11' FROM flota.Vehiculo v
WHERE v.patente='LZVK-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZVK-70')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZVK-70',1,'2022-06-21',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-70' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-70' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-25' FROM flota.Vehiculo v
WHERE v.patente='LZVK-70' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-06-21'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10863146-5'
WHERE v.patente='LZVK-70'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZVK-71')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZVK-71',1,'2022-07-07',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-13' FROM flota.Vehiculo v
WHERE v.patente='LZVK-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-07-07'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11952501-2'
WHERE v.patente='LZVK-71'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZVK-79')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZVK-79',1,'2022-08-26',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-79' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-79' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-04' FROM flota.Vehiculo v
WHERE v.patente='LZVK-79' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2022-08-26'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8982188-6'
WHERE v.patente='LZVK-79'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZVK-89')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZVK-89',1,'2023-02-28',NULL,'45611');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-89' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-89' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-09' FROM flota.Vehiculo v
WHERE v.patente='LZVK-89' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-02-28'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8163423-8'
WHERE v.patente='LZVK-89'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZVK-96')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZVK-96',1,'2023-04-27',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-96' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZVK-96' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-13' FROM flota.Vehiculo v
WHERE v.patente='LZVK-96' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-04-27'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6759634-K'
WHERE v.patente='LZVK-96'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZWH-40')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZWH-40',1,'2023-01-02',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZWH-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZWH-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-29' FROM flota.Vehiculo v
WHERE v.patente='LZWH-40' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-01-02'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='17133992-8'
WHERE v.patente='LZWH-40'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZWX-73')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZWX-73',1,'2023-03-20',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZWX-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZWX-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-02' FROM flota.Vehiculo v
WHERE v.patente='LZWX-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-03-20'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10303667-4'
WHERE v.patente='LZWX-73'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZWX-87')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZWX-87',1,'2023-04-14',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZWX-87' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZWX-87' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-10-02' FROM flota.Vehiculo v
WHERE v.patente='LZWX-87' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-04-14'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15117148-6'
WHERE v.patente='LZWX-87'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='LZWY-41')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('LZWY-41',1,'2023-08-02',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZWY-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='LZWY-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-28' FROM flota.Vehiculo v
WHERE v.patente='LZWY-41' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-08-02'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13437650-4'
WHERE v.patente='LZWY-41'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PLHW-88')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PLHW-88',1,'2021-10-06',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PLHW-88' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PLHW-88' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-03' FROM flota.Vehiculo v
WHERE v.patente='PLHW-88' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-10-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='9145768-7'
WHERE v.patente='PLHW-88'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PLRC-77')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PLRC-77',1,'2025-04-01',NULL,'45748');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PLRC-77' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PLRC-77' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-25' FROM flota.Vehiculo v
WHERE v.patente='PLRC-77' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-04-01'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15117610-0'
WHERE v.patente='PLRC-77'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVSR-16')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVSR-16',1,'2021-11-06',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSR-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSR-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-12' FROM flota.Vehiculo v
WHERE v.patente='PVSR-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8045345-0'
WHERE v.patente='PVSR-16'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PSDH-31')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PSDH-31',1,'2024-11-03',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PSDH-31' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PSDH-31' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-17' FROM flota.Vehiculo v
WHERE v.patente='PSDH-31' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-11-03'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8874151-k'
WHERE v.patente='PSDH-31'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVPH-73')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVPH-73',1,'2024-09-15',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPH-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPH-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-23' FROM flota.Vehiculo v
WHERE v.patente='PVPH-73' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-09-15'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='9111630-8'
WHERE v.patente='PVPH-73'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVPH-92')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVPH-92',1,'2024-02-05',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPH-92' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPH-92' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-03' FROM flota.Vehiculo v
WHERE v.patente='PVPH-92' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-02-05'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13347885-K'
WHERE v.patente='PVPH-92'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVPH-99')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVPH-99',1,'2024-06-24',NULL,'45604');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPH-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPH-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-24' FROM flota.Vehiculo v
WHERE v.patente='PVPH-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-06-24'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13779833-6'
WHERE v.patente='PVPH-99'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVPJ-19')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVPJ-19',1,'2023-11-23',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPJ-19' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPJ-19' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-01-15' FROM flota.Vehiculo v
WHERE v.patente='PVPJ-19' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-11-23'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='9503594-9'
WHERE v.patente='PVPJ-19'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVPR-12')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVPR-12',1,'2021-05-09',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPR-12' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPR-12' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2025-11-30' FROM flota.Vehiculo v
WHERE v.patente='PVPR-12' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-05-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15528046-8'
WHERE v.patente='PVPR-12'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVPR-16')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVPR-16',1,'2024-07-31',NULL,'45602');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPR-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPR-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-04' FROM flota.Vehiculo v
WHERE v.patente='PVPR-16' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-07-31'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='11530199-3'
WHERE v.patente='PVPR-16'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVPR-33')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVPR-33',1,'2024-05-02',NULL,'45532');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPR-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVPR-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-06' FROM flota.Vehiculo v
WHERE v.patente='PVPR-33' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-05-02'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='8981855-9'
WHERE v.patente='PVPR-33'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVRC-66')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVRC-66',1,'2021-11-06',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRC-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRC-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-28' FROM flota.Vehiculo v
WHERE v.patente='PVRC-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7671818-0'
WHERE v.patente='PVRC-66'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVRC-68')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVRC-68',1,'2029-05-29',NULL,'45638');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRC-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRC-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-23' FROM flota.Vehiculo v
WHERE v.patente='PVRC-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2029-05-29'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='10697849-2'
WHERE v.patente='PVRC-68'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVRC-71')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVRC-71',1,NULL,NULL,'45518');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRC-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRC-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-09' FROM flota.Vehiculo v
WHERE v.patente='PVRC-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,CAST(GETDATE() AS DATE)
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15698523-6'
WHERE v.patente='PVRC-71'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVRC-99')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVRC-99',1,'2021-06-09',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRC-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRC-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-05' FROM flota.Vehiculo v
WHERE v.patente='PVRC-99' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='6017825-9'
WHERE v.patente='PVRC-99'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVRH-71')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVRH-71',1,'2025-01-27',NULL,'45615');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRH-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVRH-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-10' FROM flota.Vehiculo v
WHERE v.patente='PVRH-71' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-01-27'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='9040174-2'
WHERE v.patente='PVRH-71'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVSD-89')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVSD-89',1,'2025-04-10',NULL,'45756');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSD-89' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSD-89' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-02' FROM flota.Vehiculo v
WHERE v.patente='PVSD-89' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-04-10'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='7354610-9'
WHERE v.patente='PVSD-89'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='PVSH-12')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('PVSH-12',1,'2025-05-13',NULL,'45789');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSH-12' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='PVSH-12' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-05' FROM flota.Vehiculo v
WHERE v.patente='PVSH-12' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-05-13'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='12780992-5'
WHERE v.patente='PVSH-12'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='RGCT-29')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('RGCT-29',1,'2023-03-20',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='RGCT-29' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='RGCT-29' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-05-13' FROM flota.Vehiculo v
WHERE v.patente='RGCT-29' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-03-20'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='5246025-5'
WHERE v.patente='RGCT-29'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='SRXK-67')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('SRXK-67',1,'2023-12-04',NULL,'45594');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='SRXK-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='SRXK-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-04-24' FROM flota.Vehiculo v
WHERE v.patente='SRXK-67' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2023-12-04'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='15698238-5'
WHERE v.patente='SRXK-67'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='TFRP-45')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('TFRP-45',1,'2021-06-09',NULL,'45616');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='TFRP-45' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='TFRP-45' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-06-09' FROM flota.Vehiculo v
WHERE v.patente='TFRP-45' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-06-09'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='5246025-5'
WHERE v.patente='TFRP-45'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='THSG-68')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('THSG-68',1,'2019-05-06',NULL,'45623');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='THSG-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='THSG-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-16' FROM flota.Vehiculo v
WHERE v.patente='THSG-68' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2019-05-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='5246025-5'
WHERE v.patente='THSG-68'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='TKHB-59')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('TKHB-59',1,'2024-06-18',NULL,'45609');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='TKHB-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='TKHB-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-07-22' FROM flota.Vehiculo v
WHERE v.patente='TKHB-59' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2024-06-18'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13201862-6'
WHERE v.patente='TKHB-59'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='VHDP-18')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('VHDP-18',1,'2025-09-08',NULL,'45908');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-30' FROM flota.Vehiculo v
WHERE v.patente='VHDP-18' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-30' FROM flota.Vehiculo v
WHERE v.patente='VHDP-18' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-03' FROM flota.Vehiculo v
WHERE v.patente='VHDP-18' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-09-08'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='16165038-2'
WHERE v.patente='VHDP-18'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='VHDR-86')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('VHDR-86',1,'2025-09-29',NULL,'45933');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='VHDR-86' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='VHDR-86' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-09-17' FROM flota.Vehiculo v
WHERE v.patente='VHDR-86' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2025-09-29'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='14260593-7'
WHERE v.patente='VHDR-86'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);
IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente='HTWP-66')
  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)
  VALUES('HTWP-66',1,'2021-11-06',NULL,'45610');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'PERMISO_CIRCULACION','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HTWP-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='PERMISO_CIRCULACION');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'SEGURO_OBLIGATORIO','2026-05-31' FROM flota.Vehiculo v
WHERE v.patente='HTWP-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='SEGURO_OBLIGATORIO');
INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)
SELECT v.id_vehiculo,'REVISION_TECNICA','2026-08-12' FROM flota.Vehiculo v
WHERE v.patente='HTWP-66' AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='REVISION_TECNICA');
INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)
SELECT v.id_vehiculo,c.id_conductor,'2021-11-06'
FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut='13201285-7'
WHERE v.patente='HTWP-66'
AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);

DECLARE @nC INT=(SELECT COUNT(*) FROM flota.Conductor);
DECLARE @nV INT=(SELECT COUNT(*) FROM flota.Vehiculo);
DECLARE @nD INT=(SELECT COUNT(*) FROM flota.DocumentoVehiculo);
DECLARE @nA INT=(SELECT COUNT(*) FROM flota.AsignacionVehiculoConductor);
PRINT 'Conductores : ' + CAST(@nC AS VARCHAR);
PRINT 'Vehiculos   : ' + CAST(@nV AS VARCHAR);
PRINT 'Documentos  : ' + CAST(@nD AS VARCHAR);
PRINT 'Asignaciones: ' + CAST(@nA AS VARCHAR);
GO