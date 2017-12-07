drop database if exists Checador;

create database if not exists Checador;

use Checador;

create table if not exists Administrador(
idAdministrador int primary key not null auto_increment ,
Nombre varchar(45) not null,
Pass varchar(45) not null
)engine=InnoDB;

create table if not exists Equipo(
idEquipo int primary key auto_increment not null,
NombreEquipo varchar(45) not null
)engine=InnoDB;

create table if not exists Proyecto(
idProyecto int primary key auto_increment not null,
NombreProyecto varchar(45) not null,
idEquipo int not null,constraint id4Equipo foreign key (idEquipo)
references Equipo(idEquipo) on delete cascade on update cascade
)engine=InnoDB;

create table if not exists Becario(
idBecario int primary key auto_increment not null,
NombreBecario varchar(45) not null,
ApPaterno varchar(45) not null,
ApMaterno varchar(45) not null,
NumControl varchar(45) not null,
idProyecto int not null, constraint idProyecto foreign key (idProyecto)
references Proyecto(idProyecto) on delete cascade on update cascade,
idEquipo int not null,constraint id2Equipo foreign key (idEquipo)
references Equipo(idEquipo) on delete cascade on update cascade
)engine=InnoDB;

Drop table JornadaTrabajo;
create table if not exists JornadaTrabajo(
idJornadaTrabajo int primary key auto_increment not null,
HoraEntrada Time(6) not null,
HoraSalida Time(6) not null,
idBecario int not null,constraint id2Becario foreign key (idBecario)
references Becario(idBecario) on delete cascade on update cascade
)engine=InnoDB;

create table if not exists Reporte(
idReporte int primary key auto_increment not null,
Fecha datetime not null,
HorasTrabajadas time(6) not null,
idProyecto int not null,constraint id3Proyecto foreign key (idProyecto)
references Proyecto(idProyecto) on delete cascade on update cascade,
idBecario int not null,constraint id3Becario foreign key (idBecario)
references Becario(idBecario) on delete cascade on update cascade,
idEquipo int not null,constraint id3Equipo foreign key (idEquipo)
references Equipo(idEquipo) on delete cascade on update cascade
)engine=InnoDB;



create table if not exists Bitacora(
idBitacora int primary key auto_increment not null,
Usuario varchar(45) not null,
idRegistro int not null,
Atributo varchar(45) not null,
Operacion varchar(45) not null,
Tabla varchar(45) not null,
Fecha datetime not null,
Variable varchar(45) not null,
ValorNuevo varchar(45) not null,
ValorViejo varchar(45) not null
)engine=InnoDB;


/*trigers*/

/* Administrador */

drop trigger if exists ins_Administrador;
delimiter //
create trigger ins_Administrador after insert on Administrador
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idAdministrador,'int','insert','Administrador',now(),'idAdministrador',new.idAdministrador,'vacio'),
			(user(),new.idAdministrador,'varchar','insert','Administrador',now(),'Nombre',new.Nombre,'vacio'),
			(user(),new.idAdministrador,'varchar','insert','Administrador',now(),'pass',new.pass,'vacio');

//
delimiter ;


drop trigger if exists up_Administrador;
delimiter //
create trigger up_Administrador before update on Administrador
	for each row
    if(old.idAdministrador != new.idAdministrador) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idAdministrador,'int','Update','Administrador',now(),'idAdministrador',new.idAdministrador,old.idAdministrador);
	
    elseif(old.Nombre != new.Nombre) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idAdministrador,'varchar','Update','Administrador',now(),'Nombre',new.Nombre,old.Nombre);
	
    elseif(old.pass != new.pass) then    
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idAdministrador,'varchar','Update','Administrador',now(),'pass',new.pass,old.pass);
	end if
//
delimiter ;


drop trigger if exists del_Administrador;
delimiter //
create trigger del_Administrador after delete on Administrador
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),old.idAdministrador,'int','delete','Administrador',now(),'idAdministrador','vacio',old.idAdministrador),
        (user(),old.idAdministrador,'varchar','delete','Administrador',now(),'Nombre','vacio',old.Nombre),
        (user(),old.idAdministrador,'varchar','delete','Administrador',now(),'pass','vacio',old.pass);

//
delimiter ;

/* Equipo */

drop trigger if exists ins_Equipo;
delimiter //
create trigger ins_Equipo after insert on Equipo
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idEquipo,'int','insert','Equipo',now(),'idEquipo',new.idEquipo,'vacio'),
			(user(),new.idEquipo,'varchar','insert','Equipo',now(),'NombreEquipo',new.NombreEquipo,'vacio');

//
delimiter ;


drop trigger if exists up_Equipo;
delimiter //
create trigger up_Equipo before update on Equipo
	for each row
    if(old.idEquipo != new.idEquipo) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idEquipo,'int','Update','Equipo',now(),'idEquipo',new.idEquipo,old.idEquipo);
	
    elseif(old.NombreEquipo != new.NombreEquipo) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idEquipo,'varchar','Update','Equipo',now(),'NombreEquipo',new.NombreEquipo,old.NombreEquipo);
	end if
//
delimiter ;


drop trigger if exists del_Equipo;
delimiter //
create trigger del_Equipo after delete on Equipo
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),old.idEquipo,'int','delete','Equipo',now(),'idEquipo','vacio',old.idEquipo),
        (user(),old.idEquipo,'varchar','delete','Equipo',now(),'NombreEquipo','vacio',old.NombreEquipo);

//
delimiter ;

/* Proyecto */

drop trigger if exists ins_Proyecto;
delimiter //
create trigger ins_Proyecto after insert on Proyecto
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idProyecto,'int','insert','Proyecto',now(),'idProyecto',new.idProyecto,'vacio'),
			(user(),new.idProyecto,'varchar','insert','Proyecto',now(),'NombreProyecto',new.NombreProyecto,'vacio'),
			(user(),new.idProyecto,'int','insert','Proyecto',now(),'idEquipo',new.idEquipo,'vacio');

//
delimiter ;


drop trigger if exists up_Proyecto;
delimiter //
create trigger up_Proyecto before update on Proyecto
	for each row
    if(old.idProyecto != new.idProyecto) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idProyecto,'int','Update','Proyecto',now(),'idProyecto',new.idProyecto,old.idProyecto);
	
    elseif(old.NombreProyecto != new.NombreProyecto) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idProyecto,'varchar','Update','Proyecto',now(),'NombreProyecto',new.NombreProyecto,old.NombreProyecto);
	
    elseif(old.idEquipo != new.idEquipo) then    
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idProyecto,'varchar','Update','Proyecto',now(),'idEquipo',new.idEquipo,old.idEquipo);
	end if
//
delimiter ;


drop trigger if exists del_Proyecto;
delimiter //
create trigger del_Proyecto after delete on Proyecto
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),old.idProyecto,'int','delete','Proyecto',now(),'idProyecto','vacio',old.idProyecto),
        (user(),old.idProyecto,'varchar','delete','Proyecto',now(),'NombreProyecto','vacio',old.NombreProyecto),
        (user(),old.idProyecto,'varchar','delete','Proyecto',now(),'idEquipo','vacio',old.idEquipo);

//
delimiter ;

/* Becario */

drop trigger if exists ins_Becario;
delimiter //
create trigger ins_Becario after insert on Becario
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idBecario,'int','insert','Becario',now(),'idBecario',new.idBecario,'vacio'),
			(user(),new.idBecario,'varchar','insert','Becario',now(),'NombreBecario',new.NombreBecario,'vacio'),
			(user(),new.idBecario,'varchar','insert','Becario',now(),'ApPaterno',new.ApPaterno,'vacio'),
            (user(),new.idBecario,'varchar','insert','Becario',now(),'ApMaterno',new.ApMaterno,'vacio'),
            (user(),new.idBecario,'varchar','insert','Becario',now(),'NumControl',new.NumControl,'vacio'),
            (user(),new.idBecario,'int','insert','Becario',now(),'idProyecto',new.idProyecto,'vacio'),
			(user(),new.idBecario,'int','insert','Becario',now(),'idEquipo',new.idEquipo,'vacio');


//
delimiter ;


drop trigger if exists up_Becario;
delimiter //
create trigger up_Becario before update on Becario
	for each row
    if(old.idBecario != new.idBecario) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idBecario,'int','Update','Becario',now(),'idBecario',new.idBecario,old.idBecario);
	
    elseif(old.NombreBecario != new.NombreBecario) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idBecario,'varchar','Update','Becario',now(),'NombreBecario',new.NombreBecario,old.NombreBecario);
	elseif(old.ApPaterno != new.ApPaterno) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idBecario,'varchar','Update','Becario',now(),'ApPaterno',new.ApPaterno,old.ApPaterno);
	elseif(old.ApMaterno != new.ApMaterno) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idBecario,'varchar','Update','Becario',now(),'ApMaterno',new.ApMaterno,old.ApMaterno);
	elseif(old.NumControl != new.NumControl) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idBecario,'varchar','Update','Becario',now(),'NumControl',new.NumControl,old.NumControl);
	elseif(old.idProyecto != new.idProyecto) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idBecario,'varchar','Update','Becario',now(),'idProyecto',new.idProyecto,old.idProyecto);
	
    elseif(old.idEquipo != new.idEquipo) then    
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idBecario,'varchar','Update','Becario',now(),'idEquipo',new.idEquipo,old.idEquipo);
	end if
//
delimiter ;


drop trigger if exists del_Becario;
delimiter //
create trigger del_Becario after delete on Becario
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),old.idBecario,'int','delete','Becario',now(),'idBecario','vacio',old.idBecario),
        (user(),old.idBecario,'varchar','delete','Becario',now(),'NombreBecario','vacio',old.NombreBecario),
		(user(),old.idBecario,'varchar','delete','Becario',now(),'ApPaterno','vacio',old.ApPaterno),
        (user(),old.idBecario,'varchar','delete','Becario',now(),'ApMaterno','vacio',old.ApMaterno),
        (user(),old.idBecario,'varchar','delete','Becario',now(),'NumControl','vacio',old.NumControl),
        (user(),old.idBecario,'varchar','delete','Becario',now(),'idProyecto','vacio',old.idProyecto),
        (user(),old.idBecario,'varchar','delete','Becario',now(),'idEquipo','vacio',old.idEquipo);

//
delimiter ;

/* JornadaTrabajo */

drop trigger if exists ins_JornadaTrabajo;
delimiter //
create trigger ins_JornadaTrabajo after insert on JornadaTrabajo
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idJornadaTrabajo,'int','insert','JornadaTrabajo',now(),'idJornadaTrabajo',new.idJornadaTrabajo,'vacio'),
			(user(),new.idJornadaTrabajo,'varchar','insert','JornadaTrabajo',now(),'HoraEntrada',new.HoraEntrada,'vacio'),
			(user(),new.idJornadaTrabajo,'varchar','insert','JornadaTrabajo',now(),'HoraSalida',new.HoraSalida,'vacio'),
            (user(),new.idJornadaTrabajo,'int','insert','JornadaTrabajo',now(),'idBecario',new.idBecario,'vacio');


//
delimiter ;


drop trigger if exists up_JornadaTrabajo;
delimiter //
create trigger up_JornadaTrabajo before update on JornadaTrabajo
	for each row
    if(old.idJornadaTrabajo != new.idJornadaTrabajo) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idJornadaTrabajo,'int','Update','JornadaTrabajo',now(),'idJornadaTrabajo',new.idJornadaTrabajo,old.idJornadaTrabajo);
	
	elseif(old.HoraEntrada != new.HoraEntrada) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idJornadaTrabajo,'varchar','Update','JornadaTrabajo',now(),'HoraEntrada',new.HoraEntrada,old.HoraEntrada);
	elseif(old.HoraSalida != new.HoraSalida) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idJornadaTrabajo,'varchar','Update','JornadaTrabajo',now(),'HoraSalida',new.HoraSalida,old.HoraSalida);
	
    elseif(old.idBecario != new.idBecario) then    
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idJornadaTrabajo,'varchar','Update','JornadaTrabajo',now(),'idBecario',new.idBecario,old.idBecario);
	end if
//
delimiter ;


drop trigger if exists del_JornadaTrabajo;
delimiter //
create trigger del_JornadaTrabajo after delete on JornadaTrabajo
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),old.idJornadaTrabajo,'int','delete','JornadaTrabajo',now(),'idJornadaTrabajo','vacio',old.idJornadaTrabajo),
        (user(),old.idJornadaTrabajo,'varchar','delete','JornadaTrabajo',now(),'HoraEntrada','vacio',old.HoraEntrada),
		(user(),old.idJornadaTrabajo,'varchar','delete','JornadaTrabajo',now(),'HoraSalida','vacio',old.HoraSalida),
        (user(),old.idJornadaTrabajo,'varchar','delete','JornadaTrabajo',now(),'idBecario','vacio',old.idBecario);

//
delimiter ;

/* Reporte */

drop trigger if exists ins_Reporte;
delimiter //
create trigger ins_Reporte after insert on Reporte
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idReporte,'int','insert','Reporte',now(),'idReporte',new.idReporte,'vacio'),
			(user(),new.idReporte,'varchar','insert','Reporte',now(),'Fecha',new.Fecha,'vacio'),
			(user(),new.idReporte,'varchar','insert','Reporte',now(),'HorasTrabajadas',new.HorasTrabajadas,'vacio'),
            (user(),new.idReporte,'varchar','insert','Reporte',now(),'idProyecto',new.idProyecto,'vacio'),
            (user(),new.idReporte,'varchar','insert','Reporte',now(),'idBecario',new.idBecario,'vacio'),
			(user(),new.idReporte,'int','insert','Reporte',now(),'idEquipo',new.idEquipo,'vacio');


//
delimiter ;


drop trigger if exists up_Reporte;
delimiter //
create trigger up_Reporte before update on Reporte
	for each row
    if(old.idReporte != new.idReporte) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idReporte,'int','Update','Reporte',now(),'idReporte',new.idReporte,old.idReporte);	
    elseif(old.Fecha != new.Fecha) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idReporte,'varchar','Update','Reporte',now(),'Fecha',new.Fecha,old.Fecha);
	elseif(old.HorasTrabajadas != new.HorasTrabajadas) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idReporte,'varchar','Update','Reporte',now(),'HorasTrabajadas',new.HorasTrabajadas,old.HorasTrabajadas);
	elseif(old.idProyecto != new.idProyecto) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idReporte,'varchar','Update','Reporte',now(),'idProyecto',new.idProyecto,old.idProyecto);
	elseif(old.idBecario != new.idBecario) then
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idReporte,'varchar','Update','Reporte',now(),'idBecario',new.idBecario,old.idBecario);
    elseif(old.idEquipo != new.idEquipo) then    
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),new.idReporte,'varchar','Update','Reporte',now(),'idEquipo',new.idEquipo,old.idEquipo);
	end if
//
delimiter ;


drop trigger if exists del_Reporte;
delimiter //
create trigger del_Reporte after delete on Reporte
	for each row
		insert into bitacora(usuario,idRegistro,atributo,operacion,tabla,fecha,variable,valorNuevo,valorViejo)
		values(user(),old.idReporte,'int','delete','Reporte',now(),'idReporte','vacio',old.idReporte),
        (user(),old.idReporte,'varchar','delete','Reporte',now(),'Fecha','vacio',old.Fecha),
		(user(),old.idReporte,'varchar','delete','Reporte',now(),'HorasTrabajadas','vacio',old.HorasTrabajadas),
        (user(),old.idReporte,'varchar','delete','Reporte',now(),'idProyecto','vacio',old.idProyecto),
        (user(),old.idReporte,'varchar','delete','Reporte',now(),'idBecario','vacio',old.idBecario),
        (user(),old.idReporte,'varchar','delete','Reporte',now(),'idEquipo','vacio',old.idEquipo);

//
delimiter ;




insert into Administrador(Nombre,pass) values('Tadeo','123');

insert into Equipo(NombreEquipo) values('Android');
insert into Equipo(NombreEquipo) values('Web');
insert into Equipo(NombreEquipo) values('IOS');
insert into Equipo(NombreEquipo) values('Android y Web');
insert into Equipo(NombreEquipo) values('Android y IOS');
insert into Equipo(NombreEquipo) values('Web y IOS');
insert into Equipo(NombreEquipo) values('Android, Web y IOS');
insert into Equipo(NombreEquipo) values('Nada');
insert into Proyecto(NombreProyecto,idEquipo) values('Nada',8);
insert into Proyecto(NombreProyecto,idEquipo) values('SkyCrew',7);
insert into Proyecto(NombreProyecto,idEquipo) values('Crew',5);
insert into Proyecto(NombreProyecto,idEquipo) values('Crew',5);

INSERT INTO Becario(NombreBecario,ApPaterno,ApMaterno,NumControl,idProyecto,idEquipo) 
VALUES ('1','1','1','1',1,8);

INSERT INTO Becario(NombreBecario,ApPaterno,ApMaterno,NumControl,idProyecto,idEquipo) 
VALUES ('juan','Pedro','Martinez','3024',1,3);

select* from proyecto;
select * from Becario;
select *from equipo;
select * from Administrador;
select * from Bitacora;
select * from JornadaTrabajo;