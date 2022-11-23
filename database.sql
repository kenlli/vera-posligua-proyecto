/*==============================================================*/
/* -----------------Kenlly---------                             */
/*==============================================================*/

/*==============================================================*/
/* Table: REGISTRO                                              */
/*==============================================================*/
create table REGISTRO (
   RES_CI               INT4                 not null,
   RES_NOMBRE           CHAR(25)             null,
   RES_APELLIDO         CHAR(25)             null,
   RES_NUMTELEFONICO    INT4                 null,
   RES_CIUDAD           CHAR(15)             null,
   RES_EMAIL            CHAR(30)             null,
   RES_CONTRASENA       CHAR(10)             null,
   constraint PK_REGISTRO primary key (RES_CI)
);
--registro--			  
insert into REGISTRO values(2022060401,'EDWIN DENNIS','RIVADENEIRA SALVATIERRA',0988807986,'Manta','ed2022@gmail.com','Manabi',);
insert into REGISTRO values(2022060402,1,'JUANA EVANGELISTA','RIVERA MERO','je2022@gmail.com','2020-12-04','Manabi','Manta');
insert into REGISTRO values(2022060403,1,'ESTHER ELIZABETH','MERO MARIN','ee2022@gmail.com','2020-12-04','Manabi','Portoviejo');
insert into REGISTRO values(2022060404,1,'MAURICIO ANTONIO','LOPEZ GOMES','ma2022@gmail.com','2020-12-04','Manabi','Portoviejo');
insert into REGISTRO values(2022060405,1,'ANGEL AVAN','BRAVO LOOR','aa2022@gmail.com','2020-12-04','Manabi','Manta');
insert into REGISTRO values(2022060406,1,'SHIRLEY GISELA','MERO ZAMORA','sg2022@gmail.com','2020-12-04','Manabi','Pedernales');
insert into REGISTRO values(2022060407,1,'LUIS SEGUNDO','SEVILLA MORAN','ls2022@gmail.com','2020-12-04','Manabi','Pedernales');
insert into REGISTRO values(2022060408,2,'Jefferson','Vera','jv2022@gmail.com','2020-12-04','Manabi','Manta');
insert into REGISTRO values(2022060409,2,'Plua','Alberto','pl2022@gmail.com','2020-12-04','Manabi','Chone');
insert into REGISTRO values(2022060410,2,'Sara','Centeno','sc2022@gmail.com','2020-12-04','Manabi','Manta');
insert into REGISTRO values(2022060411,2,'Joselin','Rivas','jr2022@gmail.com','2020-12-04','Manabi','Carmen');
insert into REGISTRO values(2022060412,2,'Eras','Tomala','et2022@gmail.com','2020-12-04','Manabi','Manta');



/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL (
   ROL_ID               INT4                 not null,
   ROL_DESCRIPCION      CHAR(10)             null,
   constraint PK_ROL primary key (ROL_ID)
);





/*==============================================================*/
/* Table: PERFIL                                                */
/*==============================================================*/
create table PERFIL (
   PER_ID               INT4                 not null,
   ROL_ID               INT4                 not null,
   PER_DESCRIPCION      CHAR(15)             null,
   constraint PK_PERFIL primary key (PER_ID)
);






/*==============================================================*/
/* Table: LOGIN                                                 */
/*==============================================================*/
create table LOGIN (
   LOG_ID               INT4                 not null,
   PER_ID               INT4                 not null,
   RES_CI               INT4                 not null,
   LOG_CONTRASENA       CHAR(30)             null,
   constraint PK_LOGIN primary key (LOG_ID)
);





/*==============================================================*/
/* Table: COMPRA_ESTADO                                         */
/*==============================================================*/
create table COMPRA_ESTADO (
   COMP_EST_ID          INT4                 not null,
   COMP_EST_DESCIPCION  CHAR(10)             null,
   constraint PK_COMPRA_ESTADO primary key (COMP_EST_ID)
);






/*==============================================================*/
/* Table: OFERTA_ESTADO                                         */
/*==============================================================*/
create table OFERTA_ESTADO (
   OFER_EST_ID          INT4                 not null,
   OFER_EST_DESCRIPCION CHAR(10)             null,
   constraint PK_OFERTA_ESTADO primary key (OFER_EST_ID)
);







/*==============================================================*/
/* Table: OFERTA                                                */
/*==============================================================*/
create table OFERTA (
   OFER_ID              INT4                 not null,
   COMP_EST_ID          INT4                 not null,
   OFER_EST_ID          INT4                 not null,
   PER_ID               INT4                 not null,
   COMPR_ID             INT4                 null,
   OFER_VALOR           DECIMAL              null,
   OFER_FECHA           DATE                 null,
   OFER_TIPO            CHAR(20)             null,
   OFER_NOMBRE          CHAR(20)             null,
   constraint PK_OFERTA primary key (OFER_ID)
);






/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA (
   COMPR_ID             INT4                 not null,
   OFER_ID              INT4                 null,
   COMPR_FECHA_INICIO   DATE                 null,
   COMPR_FECHA_FIN      DATE                 null,
   COMPR_VALOR_INICAL   DECIMAL              null,
   COMPR_VALOR_COMPRADO DECIMAL              null,
   constraint PK_COMPRA primary key (COMPR_ID)
);






/*==============================================================*/
/* Table: ENVIOS                                                */
/*==============================================================*/
create table ENVIOS (
   ENV_ID               INT4                 not null,
   COMPR_ID             INT4                 null,
   ENV_CIUDAD           CHAR(15)             null,
   ENV_FECHA_SALIDA     DATE                 null,
   ENV_FECHA_LLEGADA    DATE                 null,
   ENV_COSTO_ENVIO      DECIMAL              null,
   constraint PK_ENVIOS primary key (ENV_ID)
);





/*==============================================================*/
/* Table: RELATIONSHIP_10                                       */
/*==============================================================*/
create table RELATIONSHIP_10 (
   COMPR_ID             INT4                 not null,
   PER_ID               INT4                 not null,
   constraint PK_RELATIONSHIP_10 primary key (COMPR_ID, PER_ID)
);









/*==============================================================*/
alter table COMPRA
   add constraint FK_COMPRA_RELATIONS_OFERTA foreign key (OFER_ID)
      references OFERTA (OFER_ID)
      on delete restrict on update restrict;

alter table ENVIOS
   add constraint FK_ENVIOS_RELATIONS_COMPRA foreign key (COMPR_ID)
      references COMPRA (COMPR_ID)
      on delete restrict on update restrict;

alter table LOGIN
   add constraint FK_LOGIN_RELATIONS_PERFIL foreign key (PER_ID)
      references PERFIL (PER_ID)
      on delete restrict on update restrict;

alter table LOGIN
   add constraint FK_LOGIN_RELATIONS_REGISTRO foreign key (RES_CI)
      references REGISTRO (RES_CI)
      on delete restrict on update restrict;

alter table OFERTA
   add constraint FK_OFERTA_RELATIONS_COMPRA_E foreign key (COMP_EST_ID)
      references COMPRA_ESTADO (COMP_EST_ID)
      on delete restrict on update restrict;

alter table OFERTA
   add constraint FK_OFERTA_RELATIONS_OFERTA_E foreign key (OFER_EST_ID)
      references OFERTA_ESTADO (OFER_EST_ID)
      on delete restrict on update restrict;

alter table OFERTA
   add constraint FK_OFERTA_RELATIONS_PERFIL foreign key (PER_ID)
      references PERFIL (PER_ID)
      on delete restrict on update restrict;

alter table OFERTA
   add constraint FK_OFERTA_RELATIONS_COMPRA foreign key (COMPR_ID)
      references COMPRA (COMPR_ID)
      on delete restrict on update restrict;

alter table PERFIL
   add constraint FK_PERFIL_RELATIONS_ROL foreign key (ROL_ID)
      references ROL (ROL_ID)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_COMPRA foreign key (COMPR_ID)
      references COMPRA (COMPR_ID)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_PERFIL foreign key (PER_ID)
      references PERFIL (PER_ID)
      on delete restrict on update restrict;

