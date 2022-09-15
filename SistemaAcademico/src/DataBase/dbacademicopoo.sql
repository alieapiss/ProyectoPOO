/***************************** BASE DE DATOS PARA PROYECTO DE PROGRAMACION ORIENTADA A OBJETOS ******************************/
create database dbsistemaacademico;

use  dbsistemaacademico;

create table talumno 
(
    CodAlumno            	    char(6),
    NombreAlumno         	    varchar(20),
    ApellidosAlumno				varchar(20),
    DNIAlumno            	    int,
    FechaNacimiento      	    date,
    DireccionAlumno      	    varchar(45),
    Sexo                 	    char(1),
    TelefonoAlumno       	    char(10),
    EstadoAlumno         	    varchar(15),
    primary key (CodAlumno)
)

create table tsemestre 
(
    CodSemestre          char(5),
    FechaInicio          date,
    FechaTermino         date,
    Observacion          varchar(50),
    primary key (CodSemestre) 
)

create table tfacultad 
(
    CodFacultad         char(5),
    NombreFacultad      varchar(30),
    FechaCreacion       date,
    primary key (CodFacultad)
)

create table tescuelaprofesional 
(
    CodEscuelaProfesional    char(5),
    CodFacultad              char(5),
    NomEscuelaProfesional    varchar(45),
    Observación              varchar(50),
    foreign key (CodFacultad) references tfacultad (CodFacultad) on delete cascade on update cascade,
    primary key (CodEscuelaProfesional)
)

create table tdocente 
(
    CodDocente                  char(5),
    CodEscuelaProfesional       char(5),
    NombreDocente               varchar(20),
    ApellidosDocente			varchar(20),
	DNIDocente                  int,
    Sexo                        char(1),
	FechaNacimiento             date,
	GradoAcademico              varchar(15),
    CategoriaDocente            varchar(12),
    CondicionDocente            char(20), 
    foreign key (CodEscuelaProfesional) references tescuelaprofesional(CodEscuelaProfesional) on delete cascade on update cascade,
    primary key (CodDocente)
)

create table tasignatura 
(
    CodAsignatura           char(5),
    NombreAsignatura        varchar(50),
    NumeroCreditos          smallint,
    HorasTeoricas           smallint,
    HorasPractica           smallint,
    HorasLaboratorio        smallint,
    CategoriaAsignatura     char(4),
    primary key (CodAsignatura)
)
/*
create table tasignaturaprogramada  
(
   IDAsignaturaProgramada   int,
   CodAsignatura            char(5),
   CodSemestre              char(6),
   CodDocente               char(5),
   CodEscuelaProfesional    char(3),
   Observacion              varchar(50),
   foreign key (CodAsignatura) references tasignatura(CodAsignatura), 
   foreign key (CodSemestre) references tsemestre(CodSemestre), 
   foreign key (CodDocente) references tdocente (CodDocente), 
   foreign key (CodEscuelaProfesional) references tescuelaprofesional(CodEscuelaProfesional), 
   primary key (IDAsignaturaProgramada)
) */

create table tasignaturaprogramada  
(
   IDAsignaturaProgramada   int         not null,
   CodAsignatura            char(5)     not null,
   CodSemestre              char(5)     not null,
   CodDocente               char(5)  not null,
   CodEscuelaProfesional    char(5)     not null,
   Observacion              varchar(50),
   foreign key (CodAsignatura) references tasignatura(CodAsignatura) on delete cascade on update cascade, 
   foreign key (CodSemestre) references tsemestre(CodSemestre) on delete cascade on update cascade, 
   foreign key (CodDocente) references tdocente (CodDocente) on delete cascade on update cascade, 
   foreign key (CodEscuelaProfesional) references tescuelaprofesional(CodEscuelaProfesional), 
   primary key (IDAsignaturaProgramada)
)

/*
 alter table tasignaturaprogramada
  add constraint FK_tasignaturaprogramada_CodAsignatura foreign key (CodAsignatura) references tasignatura(CodAsignatura)
  on update cascade
  on delete cascade;

 alter table tasignaturaprogramada
  add constraint FK_tasignaturaprogramada_CodSemestre foreign key (CodSemestre) references tsemestre(CodSemestre)
  on update cascade
  on delete cascade;

 alter table tasignaturaprogramada
  add constraint FK_tasignaturaprogramada_CodDocente foreign key (CodDocente) references tdocente(CodDocente)
  on update cascade
  on delete cascade;

 alter table tasignaturaprogramada
  add constraint FK_tasignaturaprogramada_CodEscuelaProfesional foreign key (CodEscuelaProfesional) references tescuelaprofesional(CodEscuelaProfesional)
  on update cascade
  on delete cascade;

*/

create table tmatricula 
(
    IDMatricula              int,
    CodAlumno                char(6),
    CodEscuelaProfesional    char(5),
    CodSemestre              char(5),
    FechaMatricula           date,
    TotalCreditos            smallint,
    Observacion              varchar(50),
    foreign key (CodAlumno)                 references talumno(CodAlumno) on delete cascade on update cascade, 
    foreign key (CodEscuelaProfesional)     references tescuelaprofesional(CodEscuelaProfesional), 
    foreign key (CodSemestre)               references tsemestre(CodSemestre) on delete cascade on update cascade,
    primary key (IDMatricula)
)

create  table tdetallematricula 
(
	IDDetalleMatricula		 char(6),
    IDMatricula              int,
    IDAsignaturaProgramada   int,
    FechaActas               date,
    Nota                     Char(3),
    Observacion              char(35), 
	foreign key (IDMatricula)               references tmatricula(IDMatricula) on delete cascade on update cascade,
    foreign key (IDAsignaturaProgramada)    references tasignaturaprogramada(IDAsignaturaProgramada), 
    primary key (IDDetalleMatricula)
)

create table trequisito 
(
    CodAsignatura	    char(5), 
    CodRequisito		char(5),	
    foreign key (CodAsignatura)      references tasignatura (CodAsignatura) on delete cascade on update cascade,
    primary key (CodRequisito,CodAsignatura)
)

create table tdetalleregistro 
(
    CodDetalleRegistro char(6),
	CodDocente char(5),
    IDDetalleMatricula char(6),
    PC1 float,
    PC2 float,
    PC3 float,
    PP1 float,
    PP2 float,
    PP3 float,
    PA1 float,
    PA2 float,
    PA3 float,
    PF  float,
	foreign key (CodDocente) references tdocente (CodDocente) on delete cascade on update cascade, 
    foreign key (IDDetalleMatricula) references tdetallematricula(IDDetalleMatricula)on delete cascade on update cascade,
    primary key (CodDetalleRegistro)
)

/********** Insertando Datos *******************************************/
/******************* TABLA DE ALUMNO **********************/
insert into talumno values('051005','Javier','Paredes Montes','47556211','1998-11-12','Jr. Lima 458','M','789654123','Egresado');
insert into talumno values('091001','Anyinson Cristofer','Acharte Quispe','32496210','1995/10/01','Jr. Lima 420','M','369852147','Egresado');
insert into talumno values('091002','Jessica','Blanco Cordova','32459213','1995/10/01','Jr. Lima 430','F','753357753','Egresado');
insert into talumno values('091003','Axel Andree','Caceres Cansaya','32956215','1993/10/12','Jr. Puno 320','M','159951159','Egresado');
insert into talumno values('092001','Marbeli','Gutierrez Franco','32486245','1998/08/08','Jr. Junin 320','F','693369963','Regular');
insert into talumno values('092002','Margot','Huayta Patiño','38456255','1998/02/09','Jr. Lima 123','F','852588525','Regular');
insert into talumno values('101001','Julian','Abarca Ezequilla','32486298','1996/10/01','Jr. Lima 850','M','123321111','Regular');
insert into talumno values('101002','Yuri','Argamonte Huamani','21536212','1996/06/05','Jr. Lima 420','M','456321452','Regular');
insert into talumno values('051010','Marco','Aguilar Estrada','46556215','1997/06/01','Av. Peru 458','M','232121123','Egresado');
insert into talumno values('052001','Olivia','Trujillo Casas','48456212','1990/12/10','Jr. Lima 450','F','111112222','Egresado');
insert into talumno values('111036','Yalu','Garay Santos','32456120','1990/01/10','Av. Peru 480','M','563365563','Regular');
insert into talumno values('111005','Veronica','Palomino Montalvo','35556212','1999/03/01','Av. Peru 436','F','369963369','Regular');
insert into talumno values('112046','Olga Zarepta','Cuchillo Caytuiro','32356222','1997/10/01','Av. Arequipa 40','F','456654789','Regular');
insert into talumno values('112047','Jose','Hurtado Casaverde','32456262','1998/04/03','Av. Peru 420','M','789456123','Regular');
insert into talumno values('121001','Jaime','Ojeda Arriaga','26566212','2000/06/10','Jr. Lima 120','M','369000123','Ingresante');
insert into talumno values('141010','Luz','Vilca Calvo','26002136','2000/06/10','Jr. Pica Piedras 103','M','852000321','Regular');
insert into talumno values('141011','Mario','Bravo Calvo','43362147','2001/06/10','Av. La Roca 105','M','789444555','Ingresante');
insert into talumno values('141012','Armando','Lios Bronca','43385201','1999/06/10','Av. Ecuador 10','M','333222000','Ingresante');
insert into talumno values('141013','Maria','Barriga Lopez','42254896','2001/06/10','Jr. Juan Pablo Castro edificio 3','F','147852321','Ingresante');
insert into talumno values('141014','Celeste','Huilca Castro','48563722','2000/06/10','Jr. Chile 120','F','123321000','Ingresante');
insert into talumno values('141015','Roonny','Cruz Carrasco','15426848','1999/06/10','Jr.Huancavelica 105','M','789654120','Ingresante');

/**************************************** TABLA SEMESTRE ********************************/

insert into tsemestre values('20141','2014/04/04','2014/08/02','Res.Rectoral Nº056-2014');
insert into tsemestre values('20142','2014/08/31','2014/12/29','Res.Rectoral Nº238-2014');
insert into tsemestre values('20151','2015/04/09','2015/08/05','Res.Rectoral Nº040-2015');
insert into tsemestre values('20152','2015/08/15','2015/12/21','Res.Rectoral Nº129-2015');
insert into tsemestre values('20161','2016/04/04','2016/08/31','Res.Rectoral Nº109-2016');
insert into tsemestre values('20162','2016/09/02','2016/12/31','Res.Rectoral Nº209-2016');
insert into tsemestre values('20171','2017/04/04','2017/08/31','Res.Rectoral Nº206-2017');
insert into tsemestre values('20172','2017/09/02','2017/12/31','Res.Rectoral Nº336-2017');
insert into tsemestre values('20181','2018/04/10','2018/08/31','Res.Rectoral Nº206-2018');
insert into tsemestre values('20182','2018/09/02','2018/12/31','Res.Rectoral Nº336-2018');

/****************** TABLA FACULDAD *****************************/

insert into tfacultad  values('IS1','Ingenieria','1993/08/15');
insert into tfacultad  values('CC1','Ciencias Contables y Sociales','1994/05/17');
insert into tfacultad  values('CS1','Ciencias de la Salud','1989/10/24');

/****************** TABLA ESCUELA PROFESIONAL **********************/

insert into tescuelaprofesional values('IIS','IS1','Ingeniería Informática y Sistemas','Ninguna');
insert into tescuelaprofesional values('IM','CS1','Ingeniería de Minas','Ninguna');
insert into tescuelaprofesional  values('IAG','CC1','Ingeniería Agroindustrial','Ninguna');
insert into tescuelaprofesional  values('IC','IS1','Ingeniería Civil','Ninguna');
insert into tescuelaprofesional  values('ADE','CC1','Administracion Empresas','Ninguna');
insert into tescuelaprofesional  values('CCP','CC1','Ciencias Politicas y Contabilidad','Ninguna');
insert into tescuelaprofesional  values('VZ','CC1','Veterinaria y Zootecnia','Ninguna');
insert into tescuelaprofesional  values('ECI','CC1','Educacion Inicial','Ninguna');

/************************* TABLA DOCENTE **********************************/

insert into tdocente values (10801,'IIS','Jorge','Serrano Quispe','23421563','M','1962/08/02','Doctor','Auxiliar','Contratado');
insert into tdocente values (10802,'IIS','Jose Luis','Merma Aroni','23789456','M','1963/09/02','Magister','Asociado','Nombrado');
insert into tdocente values (10803,'IIS','Wilber','Colque Candia','23894561','M','1961/01/01','Bachiller','Auxiliar','Contratado');
insert into tdocente values (10804,'IIS','Evelyn','Luque Ochoa','46892310','F','1960/10/10','Doctor','Auxiliar','Nombrado');
insert into tdocente values (10805,'IIS','Erech','Ordoñez Ramos','00496385','M','1963/12/11','Magister','Auxiliar','Nombrado');
insert into tdocente values (10806,'IM','Shermila','Santos Guerra','45612378','F','1960/06/09','Magister','Asociado','Nombrado');
insert into tdocente values (10807,'IM','Jhon','Zegarra Sierra','78945612','M','1963/06/12','Bachiller','Asociado','Contratado');
insert into tdocente values (10808,'IAG','Rosa','Marrufo Ludeña','23964521','F','1961/10/12','Doctor','Principal','Nombrado');

/*********************************** TABLA ASIGNATURA ***********************************/

insert into tasignatura values ('IS101','Introducción a la Informática y Sistemas',4,3,0,2,'AFPO');
insert into tasignatura values ('IS102','Matemática Discreta I',4,3,2,0,'AFPB');
insert into tasignatura values ('IS103','Matemáticas Básicas',4,3,2,0,'AFG');
insert into tasignatura values ('IS201','Algoritmica I',5,3,0,4,'AFPO');
insert into tasignatura values ('IS202','Matemática Discreta II',4,3,2,0,'AFPB');
insert into tasignatura values ('IS203','Geometría Analítica',4,3,2,0,'AFG');
insert into tasignatura values ('IS301','Algotitmica II',5,3,0,4,'AFPO');
insert into tasignatura values ('IS302','Sistemas Operativos',4,3,0,2,'AFPO');
insert into tasignatura values ('IS303','Calculo I',4,3,2,0,'AFPB');
insert into tasignatura values ('IS401','Algoritmica III',5,3,0,4,'AFPO');
insert into tasignatura values ('IS402','Base de Datos I',4,3,0,2,'AFPO');
insert into tasignatura values ('IS405','Calculo II',4,3,2,0,'AFPB');
insert into tasignatura values ('IS501','Taller de Programación I',2,0,2,2,'AFPO');
insert into tasignatura values ('IS502','Base de Datos II',4,3,0,2,'AFPO');
insert into tasignatura values ('IS104','Matematica ',4,3,2,0,'AFPO');
insert into tasignatura values ('IS105','Lenguaje y Comunicacion',4,3,2,0,'AFPO');
insert into tasignatura values ('IS106','Constitucion Politica del Peru',3,2,2,0,'AFPO');
insert into tasignatura values ('IS107','Metodologia de Estudios Universitarios',3,2,2,0,'AFPO');
insert into tasignatura values ('IS108','Biologia',4,3,0,2,'AFPO');
insert into tasignatura values ('IS109','Fundamentos de Programacion',4,3,0,2,'AFG');


/********************************* TABLA ASIGNATURA PROGRAMADA ***************************/

insert into tasignaturaprogramada values(1,'IS101' , '20142' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(2,'IS102' , '20142' , '10803', 'IIS','Ninguna');
insert into tasignaturaprogramada values(3,'IS103' , '20142' , '10803', 'IIS','Ninguna');
insert into tasignaturaprogramada values(4,'IS101' , '20151' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(5,'IS102' , '20151' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(6,'IS103' , '20151' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(7,'IS201' , '20151' , '10801', 'IIS','Ninguna');
insert into tasignaturaprogramada values(8,'IS202' , '20151' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(9,'IS203' , '20151' , '10803', 'IIS','Ninguna');
insert into tasignaturaprogramada values(10,'IS101' , '20152' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(11,'IS102' , '20152' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(12,'IS103' , '20152' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(13,'IS201' , '20152' , '10801', 'IIS','Ninguna');
insert into tasignaturaprogramada values(14,'IS202' , '20152' , '10806', 'IIS','Ninguna');
insert into tasignaturaprogramada values(15,'IS203' , '20152' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(16,'IS301' , '20152' , '10804', 'IIS','Ninguna');
insert into tasignaturaprogramada values(17,'IS302' , '20152' , '10805', 'IIS','Ninguna');
insert into tasignaturaprogramada values(18,'IS303' , '20152' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(19,'IS303' , '20161' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(20,'IS101' , '20161' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(21,'IS102' , '20161' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(22,'IS103' , '20161' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(23,'IS201' , '20161' , '10801', 'IIS','Ninguna');
insert into tasignaturaprogramada values(24,'IS202' , '20161' , '10806', 'IIS','Ninguna');
insert into tasignaturaprogramada values(25,'IS203' , '20161' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(26,'IS301' , '20161' , '10804', 'IIS','Ninguna');
insert into tasignaturaprogramada values(27,'IS302' , '20161' , '10805', 'IIS','Ninguna');
insert into tasignaturaprogramada values(28,'IS303' , '20161' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(29,'IS401' , '20161' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(30,'IS402' , '20161' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(31,'IS103' , '20162' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(32,'IS201' , '20162' , '10801', 'IIS','Ninguna');
insert into tasignaturaprogramada values(33,'IS202' , '20162' , '10806', 'IIS','Ninguna');
insert into tasignaturaprogramada values(34,'IS203' , '20162' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(35,'IS301' , '20162' , '10804', 'IIS','Ninguna');
insert into tasignaturaprogramada values(36,'IS302' , '20162' , '10805', 'IIS','Ninguna');
insert into tasignaturaprogramada values(37,'IS303' , '20162' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(38,'IS302' , '20162' , '10805', 'IIS','Ninguna');
insert into tasignaturaprogramada values(39,'IS303' , '20162' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(40,'IS401' , '20162' , '10805', 'IIS','Ninguna');
insert into tasignaturaprogramada values(41,'IS402' , '20162' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(42,'IS501' , '20162' , '10805', 'IIS','Ninguna');
insert into tasignaturaprogramada values(43,'IS502' , '20162' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(44,'IS104' , '20181' , '10801', 'IIS','Ninguna');
insert into tasignaturaprogramada values(45,'IS105' , '20181' , '10802', 'IIS','Ninguna');
insert into tasignaturaprogramada values(46,'IS106' , '20181' , '10804', 'IIS','Ninguna');
insert into tasignaturaprogramada values(47,'IS107' , '20181' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(48,'IS108' , '20181' , '10805', 'IIS','Ninguna');
insert into tasignaturaprogramada values(49,'IS109' , '20181' , '10807', 'IIS','Ninguna');
insert into tasignaturaprogramada values(50,'IS104' , '20182' , '10803', 'IIS','Ninguna');
insert into tasignaturaprogramada values(51,'IS105' , '20182' , '10806', 'IIS','Ninguna');
insert into tasignaturaprogramada values(52,'IS106' , '20182' , '10805', 'IIS','Ninguna');
insert into tasignaturaprogramada values(53,'IS107' , '20182' , '10803', 'IIS','Ninguna');
insert into tasignaturaprogramada values(54,'IS108' , '20182' , '10808', 'IIS','Ninguna');
insert into tasignaturaprogramada values(55,'IS109' , '20182' , '10807', 'IIS','Ninguna');

/************************** TABLA MATRICULA ****************************/

insert into tmatricula values(1,'091001','IIS','20142','2014/07/25',12,'Ninguno');
insert into tmatricula values(2,'091002','IIS','20142','2014/07/25',12,'Ninguno');
insert into tmatricula values(3,'091001','IIS','20151','2015/03/30',12,'Ninguno');
insert into tmatricula values(4,'091002','IIS','20151','2015/03/30',12,'Ninguno');
insert into tmatricula values(5,'092001','IIS','20151','2015/03/30',12,'Ninguno');
insert into tmatricula values(6,'092002','IIS','20151','2015/03/30',12,'Ninguno');
insert into tmatricula values(7,'091001','IIS','20152','2015/07/23',0,'Ninguno');
insert into tmatricula values(8,'092001','IIS','20152','2015/07/23',0,'Ninguno');
insert into tmatricula values(9,'101001','IIS','20152','2015/07/23',0,'Ninguno');
insert into tmatricula values(10,'101002','IIS','20152','2015/07/23',0,'Ninguno');
insert into tmatricula values(11,'092001','IIS','20161','2016/03/26',0,'Ninguno');
insert into tmatricula values(12,'092001','IIS','20162','2016/03/26',0,'Ninguno');
insert into tmatricula values(13,'091001','IIS','20161','2015/07/25',12,'Ninguno');
insert into tmatricula values(14,'091001','IIS','20162','2015/07/25',12,'Ninguno');
insert into tmatricula values(15,'101002','IIS','20161','2016/07/25',8,'Ninguno');
insert into tmatricula values(16,'101002','IIS','20162','2016/07/25',8,'Ninguno');
insert into tmatricula values(17,'121001','IIS','20162','2016/07/25',8,'Ninguno');
insert into tmatricula values(18,'141011','IIS','20181','2018/03/28',22,'Ninguno');
insert into tmatricula values(19,'141012','IIS','20181','2018/03/22',22,'Ninguno');
insert into tmatricula values(20,'141013','IIS','20181','2018/03/25',22,'Ninguno');
insert into tmatricula values(21,'141014','IIS','20181','2018/03/24',22,'Ninguno');
insert into tmatricula values(22,'141015','IIS','20181','2018/03/23',20,'Ninguno');
insert into tmatricula values(23,'141013','IIS','20182','2018/08/26',15,'Ninguno');
insert into tmatricula values(24,'141015','IIS','20182','2018/08/23',22,'Ninguno');
insert into tmatricula values(25,'121001','IIS','20182','2018/08/29',11,'Ninguno');
insert into tmatricula values(26,'141011','IIS','20182','2018/08/25',18,'Ninguno');

/***************************** TABLA DETALLE MATRICULA ********************************/

insert into tdetallematricula values ('DM0001',1,1,'2014/11/22',10,'Ninguno');
insert into tdetallematricula values ('DM0002',1,2,'2014/12/29',13,'Ninguno');
insert into tdetallematricula values ('DM0003',1,3,'2014/12/18',13,'Ninguno');
insert into tdetallematricula values ('DM0004',2,1,'2014/10/02',15,'Ninguno');
insert into tdetallematricula values ('DM0005',2,2,'2014/09/03',09,'Ninguno');
insert into tdetallematricula values ('DM0006',2,3,'2014/10/24',13,'Ninguno');
insert into tdetallematricula values ('DM0007',3,4,'2015/07/18',12,'Ninguno');
insert into tdetallematricula values ('DM0008',3,8,'2015/06/28',12,'Ninguno');
insert into tdetallematricula values ('DM0009',3,9,'2015/04/15',10,'Ninguno');
insert into tdetallematricula values ('DM0010',4,7,'2015/08/29',12,'Ninguno');
insert into tdetallematricula values ('DM0011',4,5,'2015/10/06',13,'Ninguno');
insert into tdetallematricula values ('DM0012',4,9,'2015/04/29',13,'Ninguno');
insert into tdetallematricula values ('DM0013',5,4,'2015/06/06',13,'Ninguno');
insert into tdetallematricula values ('DM0014',5,5,'2015/09/11',15,'Ninguno');
insert into tdetallematricula values ('DM0015',5,6,'2015/08/18',14,'Ninguno');
insert into tdetallematricula values ('DM0016',6,4,'2015/07/15',12,'Ninguno');
insert into tdetallematricula values ('DM0017',6,5,'2015/08/09',15,'Ninguno');
insert into tdetallematricula values ('DM0018',6,6,'2015/02/10',05,'Ninguno');
insert into tdetallematricula values ('DM0019',11,18,'2016/11/29',05,'Ninguno');
insert into tdetallematricula values ('DM0020',13,30,'2016/07/09',10,'Ninguno');
insert into tdetallematricula values ('DM0021',14,35,'2016/06/14',10,'Ninguno');
insert into tdetallematricula values ('DM0022',14,40,'2016/01/02',12,'Ninguno');
insert into tdetallematricula values ('DM0023',14,42,'2016/02/04',14,'Ninguno');
insert into tdetallematricula values ('DM0024',11,19,'2016/01/12',10,'Ninguno');
insert into tdetallematricula values ('DM0025',11,30,'2016/03/16',10,'Ninguno');
insert into tdetallematricula values ('DM0026',12,35,'2016/07/05',10,'Ninguno');
insert into tdetallematricula values ('DM0027',12,40,'2016/02/25',12,'Ninguno');
insert into tdetallematricula values ('DM0028',12,41,'2017/06/14',13,'Ninguno');
insert into tdetallematricula values ('DM0029',12,42,'2017/10/30',14,'Ninguno');
insert into tdetallematricula values ('DM0030',15,30,'2017/10/23',13,'Ninguno');
insert into tdetallematricula values ('DM0031',16,41,'2017/01/09',11,'Ninguno');
insert into tdetallematricula values ('DM0032',16,43,'2017/06/23',13,'Ninguno');
insert into tdetallematricula values ('DM0033',16,42,'2017/06/05',14,'Ninguno');
insert into tdetallematricula values ('DM0034',17,31,'2017/11/19',11,'Ninguno');
insert into tdetallematricula values ('DM0035',17,32,'2017/09/09',13,'Ninguno');
insert into tdetallematricula values ('DM0036',17,33,'2017/05/24',14,'Ninguno');
insert into tdetallematricula values ('DM0037',18,45,'2017/01/02',12,'Ninguno');
insert into tdetallematricula values ('DM0038',18,49,'2017/04/20',10,'Ninguno');
insert into tdetallematricula values ('DM0039',23,47,'2017/08/15',15,'Ninguno');
insert into tdetallematricula values ('DM0040',22,52,'2017/04/10',14,'Ninguno');
insert into tdetallematricula values ('DM0041',26,44,'2017/03/14',12,'Ninguno');
insert into tdetallematricula values ('DM0042',19,47,'2017/05/30',16,'Ninguno');
insert into tdetallematricula values ('DM0043',21,52,'2017/09/01',12,'Ninguno');
insert into tdetallematricula values ('DM0044',19,49,'2017/10/25',14,'Ninguno');
insert into tdetallematricula values ('DM0045',20,46,'2017/02/03',16,'Ninguno');
insert into tdetallematricula values ('DM0046',24,46,'2017/01/19',15,'Ninguno');
insert into tdetallematricula values ('DM0047',22,47,'2017/03/10',12,'Ninguno');
insert into tdetallematricula values ('DM0048',22,49,'2018/01/09',08,'Ninguno');
insert into tdetallematricula values ('DM0049',19,51,'2018/04/17',13,'Ninguno');
insert into tdetallematricula values ('DM0050',22,53,'2018/02/10',16,'Ninguno');
insert into tdetallematricula values ('DM0051',24,55,'2018/10/22',12,'Ninguno');
insert into tdetallematricula values ('DM0052',21,48,'2018/10/15',09,'Ninguno');
insert into tdetallematricula values ('DM0053',26,43,'2018/12/21',00,'Ninguno');
insert into tdetallematricula values ('DM0054',19,44,'2018/12/21',11,'Ninguno');
insert into tdetallematricula values ('DM0055',24,44,'2018/07/24',13,'Ninguno');
insert into tdetallematricula values ('DM0056',23,46,'2018/04/18',20,'Ninguno');
insert into tdetallematricula values ('DM0057',25,49,'2018/08/13',16,'Ninguno');
insert into tdetallematricula values ('DM0058',23,44,'2018/05/16',13,'Ninguno');
insert into tdetallematricula values ('DM0059',26,46,'2018/09/07',18,'Ninguno');
insert into tdetallematricula values ('DM0060',21,50,'2018/03/03',13,'Ninguno');
insert into tdetallematricula values ('DM0061',23,43,'2018/03/13',11,'Ninguno');
insert into tdetallematricula values ('DM0062',25,46,'2018/12/28',15,'Ninguno');
insert into tdetallematricula values ('DM0063',18,53,'2018/05/30',16,'Ninguno');
insert into tdetallematricula values ('DM0064',24,48,'2018/12/01',07,'Ninguno');
insert into tdetallematricula values ('DM0065',26,45,'2018/03/23',09,'Ninguno');
insert into tdetallematricula values ('DM0066',19,52,'2018/11/14',14,'Ninguno');
insert into tdetallematricula values ('DM0067',19,50,'2018/09/01',19,'Ninguno');
insert into tdetallematricula values ('DM0068',18,44,'2018/11/25',10,'Ninguno');
insert into tdetallematricula values ('DM0069',20,47,'2018/03/18',13,'Ninguno');
insert into tdetallematricula values ('DM0070',23,48,'2018/09/10',11,'Ninguno');
insert into tdetallematricula values ('DM0071',20,54,'2018/11/10',14,'Ninguno');
insert into tdetallematricula values ('DM0072',18,48,'2018/05/02',07,'Ninguno');
insert into tdetallematricula values ('DM0073',23,51,'2018/06/12',10,'Ninguno');
insert into tdetallematricula values ('DM0074',22,44,'2018/08/09',11,'Ninguno');
insert into tdetallematricula values ('DM0075',22,48,'2018/08/09',12,'Ninguno');
insert into tdetallematricula values ('DM0076',18,55,'2018/03/01',20,'Ninguno');
insert into tdetallematricula values ('DM0077',19,40,'2018/01/22',11,'Ninguno');
insert into tdetallematricula values ('DM0078',25,47,'2018/08/04',10,'Ninguno');
insert into tdetallematricula values ('DM0079',20,52,'2018/09/29',14,'Ninguno');
insert into tdetallematricula values ('DM0080',19,43,'2018/07/11',10,'Ninguno');
insert into tdetallematricula values ('DM0081',19,42,'2018/10/24',18,'Ninguno');
insert into tdetallematricula values ('DM0082',21,51,'2018/02/10',17,'Ninguno');
insert into tdetallematricula values ('DM0083',22,43,'2018/02/14',16,'Ninguno');
insert into tdetallematricula values ('DM0084',21,45,'2018/04/21',12,'Ninguno');
insert into tdetallematricula values ('DM0085',25,43,'2018/07/11',14,'Ninguno');
insert into tdetallematricula values ('DM0086',20,42,'2018/04/25',16,'Ninguno');
insert into tdetallematricula values ('DM0087',24,54,'2018/08/14',08,'Ninguno');
insert into tdetallematricula values ('DM0088',26,48,'2018/11/25',05,'Ninguno');
insert into tdetallematricula values ('DM0089',22,50,'2018/12/30',06,'Ninguno');
insert into tdetallematricula values ('DM0090',20,51,'2018/12/06',07,'Ninguno');

/********************************* TABLA DETALLE DE REGISTRO NOTAS **************************************/

insert into tdetalleregistro values ('R00001','10801','DM0001','','','','','','','','','','');
insert into tdetalleregistro values ('R00002','10801','','','','','','','','','','','');
insert into tdetalleregistro values ('R00003','10801','','','','','','','','','','','');
insert into tdetalleregistro values ('R00004','10801','','','','','','','','','','','');
insert into tdetalleregistro values ('R00005','10801','','','','','','','','','','','');
insert into tdetalleregistro values ('R00006','10801','','','','','','','','','','','');
insert into tdetalleregistro values ('R00007','10801','','','','','','','','','','','');
insert into tdetalleregistro values ('R00008','10801','','','','','','','','','','','');
insert into tdetalleregistro values ('R00009','10802','','','','','','','','','','','');
insert into tdetalleregistro values ('R00010','10802','','','','','','','','','','','');
insert into tdetalleregistro values ('R00011','10802','','','','','','','','','','','');
insert into tdetalleregistro values ('R00012','10802','','','','','','','','','','','');
insert into tdetalleregistro values ('R00013','10802','','','','','','','','','','','');
insert into tdetalleregistro values ('R00014','10803','','','','','','','','','','','');
insert into tdetalleregistro values ('R00015','10803','','','','','','','','','','','');
insert into tdetalleregistro values ('R00016','10803','','','','','','','','','','','');
insert into tdetalleregistro values ('R00017','10803','','','','','','','','','','','');
insert into tdetalleregistro values ('R00018','10803','','','','','','','','','','','');
insert into tdetalleregistro values ('R00019','10805','','','','','','','','','','','');
insert into tdetalleregistro values ('R00020','10805','','','','','','','','','','','');
insert into tdetalleregistro values ('R00021','10805','','','','','','','','','','','');
insert into tdetalleregistro values ('R00022','10805','','','','','','','','','','','');

/*********************************CONSULTAS DE SELECT **************************************/

select * from talumno
select * from tasignatura
select * from tasignaturaprogramada
select * from tdetallematricula
select * from tdocente
select * from tescuelaprofesional
select * from tfacultad
select * from tmatricula
select * from trequisito
select * from tsemestre


/******************************************* CONSULTAS ******************************************/
/*****************************************************************************************/
/******************************* PROCEDIMIENTOS ALMACENADOS ******************************/
/******************************* ALUMNOS ******************************/
/******************************* MOSTRAR ALUMNOS ******************************/

create procedure sp_mostraralumnos
as begin 
select * from talumno
end 
GO

--execute sp_mostraralumnos

/******************************* GENERA CODIGO ALUMNOS ******************************/

CREATE PROC sp_generacodigoalumno
AS BEGIN
DECLARE @CodAlumno char(6)
SET @CodAlumno  = (SELECT MAX(CodAlumno ) FROM talumno)
SET @CodAlumno = 'A' + RIGHT('000'+LTRIM(RIGHT (ISNULL( @CodAlumno ,'000'),5)+1),5)
SELECT @CodAlumno  AS CodigoAlumno
END
GO

--execute sp_generacodigoalumno

/******************************* AGREGAR ALUMNOS ******************************/

create procedure sp_agregaralumnos
@CodAlumno char(6),
@NombreAlumno varchar(20),
@ApellidosAlumno varchar(20),
@DNIAlumno int,
@FechaNacimiento date,
@DireccionAlumno varchar(45),
@Sexo char(1),
@TelefonoAlumno char(10),
@EstadoAlumno varchar(15)
as begin
insert into talumno values(@CodAlumno,@NombreAlumno,@ApellidosAlumno,@DNIAlumno,@FechaNacimiento,@DireccionAlumno,@Sexo,@TelefonoAlumno,@EstadoAlumno)
end 
GO


/******************************* BUSCAR ALUMNOS ******************************/ 


create proc sp_buscaralumnos
@NombreAlumno varchar(20)
as begin
select * from talumno  where NombreAlumno = @NombreAlumno
end 
GO


/******************************* MODIFICAR ALUMNOS ******************************/


create proc sp_modificaralumnos
@CodAlumno char(6),
@NombreAlumno varchar(20),
@ApellidosAlumno varchar(20),
@DNIAlumno int,
@FechaNacimiento date,
@DireccionAlumno varchar(45),
@Sexo char(1),
@TelefonoAlumno char(10),
@EstadoAlumno varchar(15)
as begin
update talumno  set NombreAlumno=@NombreAlumno,ApellidosAlumno=@ApellidosAlumno,
DNIAlumno=@DNIAlumno, FechaNacimiento=@FechaNacimiento,DireccionAlumno=@DireccionAlumno,Sexo=@Sexo,
TelefonoAlumno=@TelefonoAlumno, EstadoAlumno=@EstadoAlumno
where CodAlumno=@CodAlumno 
end
GO


/******************************* ELIMINAR ALUMNOS ******************************/

create procedure sp_eliminaralumnos
@CodAlumno varchar(10)
as begin
delete from talumno  where CodAlumno =@CodAlumno
end
GO

/******************************************************************************************/
/*****************************************************************************************/
/******************************* PROCEDIMIENTOS ALMACENADOS ******************************/
/******************************* DOCENTES ******************************/
/******************************* MOSTRAR DOCENTES ******************************/

create procedure sp_mostrardocentes 
as begin 
select * from tdocente 
end 
GO

--execute sp_mostrardocentes

/******************************* GENERA CODIGO DOCENTES ******************************/

CREATE PROC sp_generarcodigodocente
AS BEGIN
DECLARE @CodDocente char(5)
SET @CodDocente  = (SELECT MAX(CodDocente ) FROM tdocente)
SET @CodDocente = 'D' + RIGHT('000'+LTRIM(RIGHT (ISNULL( @CodDocente ,'000'),4)+1),4)
SELECT @CodDocente  AS CodigoDocente
END
GO

/******************************* AGREGAR DOCENTES ******************************/

create procedure sp_agregardocentes
@CodDocente char(5),
@CodEscuelaProfesional char(3),
@NombreDocente varchar(20), 
@ApellidosDocente varchar(20),
@DNIDocente int,
@Sexo char(1),
@FechaNacimiento date,
@GradoAcademico varchar(15),
@CategoriaDocente varchar(12),
@CondicionDocente char(1)
as begin
insert into tdocente values(@CodDocente,@CodEscuelaProfesional,@NombreDocente,@ApellidosDocente,
@DNIDocente,@Sexo,@FechaNacimiento,@GradoAcademico,@CategoriaDocente,@CondicionDocente)
end 
GO


/******************************* BUSCAR DOCENTES ******************************/ 


create proc sp_buscardocentes
@NombreDocente varchar(20)
as begin
select * from tdocente  where NombreDocente = @NombreDocente
end 
GO


/******************************* MODIFICAR DOCENTES ******************************/


create proc sp_modificardocentes
@CodDocente char(5),
@CodEscuelaProfesional char(3),
@NombreDocente varchar(20),
@ApellidosDocente varchar(20),
@DNIDocente int,
@Sexo char(1),
@FechaNacimiento date,
@GradoAcademico varchar(15),
@CategoriaDocente varchar(12),
@CondicionDocente char(1)
as begin
update tdocente  set CodEscuelaProfesional=@CodEscuelaProfesional, NombreDocente=@NombreDocente,
ApellidosDocente=@ApellidosDocente,
DNIDocente=@DNIDocente, FechaNacimiento=@FechaNacimiento,
GradoAcademico=@GradoAcademico,Sexo=@Sexo,
CategoriaDocente=@CategoriaDocente, CondicionDocente=@CondicionDocente
where CodDocente=@CodDocente 
end
GO


/******************************* ELIMINAR DOCENTES ******************************/

create procedure sp_eliminardocentes
@CodDocente char(5)
as begin
delete from tdocente  where CodDocente =@CodDocente
end
GO

/******************************* PROCEDIMIENTOS ALMACENADOS ******************************/
/******************************* ESCUELA PROFESIONAL ******************************/
/******************************* MOSTRAR ESCUELA PROFESIONAL ******************************/

create procedure sp_mostrarescuelaprofesional
as begin 
select * from tescuelaprofesional
end 
go

--execute sp_mostrarescuelaprofesional

/******************************* GENERA CODIGO ESCUELA PROFESIONAL ******************************/

create procedure sp_generarcodigoescuelaprofesional
as begin
declare @CodEscuelaProfesional char(5) 
set @CodEscuelaProfesional  = (select MAX(CodEscuelaProfesional ) from tescuelaprofesional)
SET @CodEscuelaProfesional = 'C' + RIGHT('000'+LTRIM(RIGHT (ISNULL( @CodEscuelaProfesional ,'000'),4)+1),4)
select @CodEscuelaProfesional  AS CodigoEscuelaProfesional
end 
go




/******************************* AGREGAR ESCUELA PROFESIONAL ******************************/

create procedure sp_agregarescuelaprofesional
@CodEscuelaProfesional char(5),
@CodFacultad char(5),
@NomEscuelaProfesional varchar(45),
@Observación varchar(50)
as begin
insert into tescuelaprofesional values(@CodEscuelaProfesional,@CodFacultad,@NomEscuelaProfesional,@Observación)
end 
GO


/******************************* BUSCAR ESCUELA PROFESIONAL ******************************/ 


create proc sp_buscarescuelaprofesional
@NomEscuelaProfesional varchar(45)
as begin
select * from tescuelaprofesional  where NomEscuelaProfesional = @NomEscuelaProfesional
end 
GO


/******************************* MODIFICAR ESCUELA PROFESIONAL ******************************/


create proc sp_modificarescuelaprofesional
@CodEscuelaProfesional char(5),
@CodFacultad char(5),
@NomEscuelaProfesional varchar(45),
@Observación varchar(50)
as begin
update tescuelaprofesional  set CodFacultad=@CodFacultad, NomEscuelaProfesional=@NomEscuelaProfesional,
Observación=@Observación
where CodEscuelaProfesional=@CodEscuelaProfesional 
end 
go


/******************************* ELIMINAR ESCUELA PROFESIONAL ******************************/

create procedure sp_eliminarescuelaprofesional
@CodEscuelaProfesional char(5)
as begin
delete from tescuelaprofesional  where CodEscuelaProfesional = @CodEscuelaProfesional
end 
go

/******************************* PROCEDIMIENTOS ALMACENADOS ******************************/
/******************************* ASIGNATURAS ******************************/
/******************************* MOSTRAR ASIGNATURA ******************************/

create procedure sp_mostrarasignatura 
as begin 
select * from tasignatura
end 
go

--execute sp_mostrarasignatura

/******************************* GENERA CODIGO ASIGNATURAS ******************************/

create procedure sp_generarcodigoasignatura
as begin
declare @CodAsignatura char(5) 
set @CodAsignatura  = (select MAX(CodAsignatura ) from tasignatura)
SET @CodAsignatura = 'C' + RIGHT('000'+LTRIM(RIGHT (ISNULL( @CodAsignatura ,'000'),3)+1),3)
select @CodAsignatura  AS CodigoAsignatura
end 
go


/******************************* AGREGAR ASIGNATURAS ******************************/

create procedure sp_agregarasignatura
@CodAsignatura           char(5),
@NombreAsignatura        varchar(50),
@NumeroCreditos          smallint,
@HorasTeoricas           smallint,
@HorasPractica           smallint,
@HorasLaboratorio        smallint,
@CategoriaAsignatura     char(4)
as begin
insert into tasignatura values(@CodAsignatura,@NombreAsignatura,@NumeroCreditos,@HorasTeoricas,@HorasPractica,@HorasLaboratorio,@CategoriaAsignatura)
end 
GO


/******************************* BUSCAR ASIGNATURAS ******************************/ 


create proc sp_buscarasignatura
@NombreAsignatura varchar(50)
as begin
select * from tasignatura  where NombreAsignatura = @NombreAsignatura
end 
GO


/******************************* MODIFICAR ASIGNATURAS ******************************/

create proc sp_modificarasignatura
@CodAsignatura           char(5),
@NombreAsignatura        varchar(50),
@NumeroCreditos          smallint,
@HorasTeoricas           smallint,
@HorasPractica           smallint,
@HorasLaboratorio        smallint,
@CategoriaAsignatura     char(4)
as begin
update tasignatura  set NombreAsignatura=@NombreAsignatura, NumeroCreditos=@NumeroCreditos, 
HorasTeoricas=@HorasTeoricas, HorasPractica=@HorasPractica, HorasLaboratorio =@HorasLaboratorio, CategoriaAsignatura =@CategoriaAsignatura 
where CodAsignatura=@CodAsignatura 
end 
go


/******************************* ELIMINAR ASIGNATURAS ******************************/

create procedure sp_eliminarasignatura
@CodAsignatura char(5)
as begin
delete from tasignatura  where CodAsignatura = @CodAsignatura
end 
go


/******************************* PROCEDIMIENTOS ALMACENADOS ******************************/
/******************************* MATRICULA ******************************/
/******************************* LISTA ALUMNOS MATRICULADOS ******************************/
-- Lista de alumnos matriculados

create procedure sp_alumnosmatriculados
as begin 
select IDMatricula, CodSemestre,TM.CodAlumno, NombreAlumno, ApellidosAlumno, FechaMatricula
from tmatricula TM
inner join talumno TA on TM.CodAlumno=TA.CodAlumno
end 
GO

select IDMatricula, CodSemestre,TM.CodAlumno, NombreAlumno, ApellidosAlumno, FechaMatricula
from TMATRICULA TM
inner join TALUMNO TA on TM.CodAlumno=TA.CodAlumno


-- Procedimiento almacenado para determinaR el numero de docentes por escuela profesional

create procedure sp_docentesporescuelapropf
as begin 
select TE.NomEscuelaProfesional, TD.CodEscuelaProfesional, count(*) as NroDocentes
from tescuelaprofesional TE inner join tdocente TD 
on TE.CodEscuelaProfesional = TD.CodEscuelaProfesional
group by TE.NomEscuelaProfesional, TD.CodEscuelaProfesional
end 
GO

select TE.NomEscuelaProfesional, TD.CodEscuelaProfesional, count(*) as NroDocentes, NombreDocente
from tescuelaprofesional TE inner join tdocente TD 
on TE.CodEscuelaProfesional = TD.CodEscuelaProfesional
group by TE.NomEscuelaProfesional, TD.CodEscuelaProfesional,NombreDocente

