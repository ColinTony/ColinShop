create database tiendaColin;
use tiendaColin;

/*
* Tabla tipo producto conendra los productos
*/
create table TipoProd(
idTipo int not null auto_increment primary key,
tipo nvarchar(50));

/*
* tabla Productos tendra el precio y nombre de los productos llave foranea hacia TipoProd
*/
create table Productos(
idProductos int auto_increment primary key,
nombre nvarchar(50),
precio int,
url nvarchar(60),
disponibles int,
descripcion text,
idTipo int not null,
foreign key (idTipo) references TipoProd(idTipo) on delete cascade);


/*
* tabla cliente tendra los datos del cliente
*/
create table Cliente (
idClie int not null auto_increment primary key,
apeP nvarchar(50),
apeM nvarchar(50),
nombres nvarchar (50),
nick nvarchar(50),
pass nvarchar(50),
email nvarchar(50));

/*
* tabla Carro es el carrito de compras , tendra id de los productos 
* llave foranea hacia cliente
*/
create table Carro(idCarro int not null auto_increment primary key,
idProductos int not null,
idClie int not null);


/*
* insertando los tipos de productos
*/
insert into TipoProd values (1,"Juego-PS3");
insert into TipoProd values (2,"Juego-XBOX");
insert into TipoProd values (3,"Pelicula-BD");

/*
* Insertando productos
*/
#juegos PS3
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("FIFA 16",1200,"imagenes/PS3/Fifa16.jpg",51,"FIFA 16 innova a lo largo de la cancha para entregar una experiencia futbolística equilibrada, auténtica y emocionante que te permite jugar a tu manera y competir a un nivel más alto. Tendrás confianza en la defensa, tomarás el control en la media cancha y crearás más momentos de magia que nunca antes. FIFA 16: Juega bonito. ",1);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("THE LAST OF US",1000,"imagenes/PS3/TheLastOfUs.png",51,"'The Last of Us' narra la cruda historia de Joel, un contrabandista que subsiste en un mundo convertido en un auténtico infierno, después de que años atrás una infección terminara con la mayor parte de la población e hiciera enloquecer a muchos de los supervivientes.",1);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("CALL OF DUTY B.O II",1000,"imagenes/PS3/CODBO.jpg",35,"En esta secuela directa de Black Ops descubriremos qué ocurrió con sus personajes y el primero en dar la cara es Frank Woods, ahora un anciano (el narrador del tráiler) al tiempo que conoceremos otros nuevos. Así, durante los segmentos sucedidos en los años 80 (que muestran hombres a caballo) tomaremos el control de Alex Mason, mientras que en la porción que tiene lugar en 2025 (la mayor parte) asumimos el rol de su hijo, David Mason.",1);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("RESIDENT EVIL 6",750,"imagenes/PS3/Resident6.jpg",40,"Capcom se enfrenta a una de las pruebas de fuego de este año, el lanzamiento de la sexta entrega de la que es probablemente su saga más reputada: Resident Evil. La marca lleva unos años rodeada de polémica tras la deriva hacia la acción de los últimos episodios y tras la absoluta mediocridad del olvidable Operation Raccoon City, pero se prometió un regreso a las raíces de la franquicia con esta sexta entrega. Finalmente la nueva infección zombi está algo más lejos de los primeros capítulos de lo que podía pensarse en un principio, pero eso no es óbice para que dejemos de considerarlo un gran shooter.",1);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("SILENT HILL HOMECOMING",700,"imagenes/PS3/SilentHill.jpg",45,"Esta entrega siguie el viaje de Alex Shepherd, un soldado que vuelve de la guerra a su ciudad natal, Shepherd's Glen, donde se da cuenta que su hermano está desaparecido y que el pueblo está sumido en el caos. Mientras continúa buscando a su hermano menor, él descubre más sobre la Orden (el culto de Silent Hill), así como de la historia del pueblo y su propio pasado.",1);
#Accesorios PS3
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("CONTROL DUALSHOCK 3",650,"imagenes/PS3/PlayStationControl.png",45,"El control inalámbrico DUALSHOCK®3 para el PlayStation®3 te da la mejor experiencia intuitiva
de juego, con sensores de presión en cada botón y la incorporación de SIXAXIS™, tecnología sensible para detectar el movimiento. Cada golpe, choque y explosión es más realista cuando sientes la vibración en la palma de tu mano. Incluso detecta movimientos naturales en tiempo real y una alta precisión en juego interactivo actuado como una extensión natural de tu cuerpo. El control inalámbrico SIXAXIS™ utiliza la tecnología Bluetooth para el juego inalámbrico y el cable USB del control para cargar el control automáticamente a través de la consola en cualquier momento. Al integrar todas estas características al control original de PlayStation®, el DUALSHOCK®3 enriquecerá la avanzada experiencia de juego disponible solamente en el sistema PlayStation®3.",1);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("CAMARA EYE",400,"imagenes/PS3/Camara.png",45,"EyeCreate es el primer software de edición de video para la consola PlayStation®3. Mediante el uso de EyeCreate™ y la cámara PlayStation Eye puedes capturar videos, audios e incluso fotos, que pueden editarse en una película. Una extensa lista de efectos especiales como filtros de color, distorsiones, filtros de arte y rastros de movimiento pueden imprimirle un toque profesional a tu video. Existen incluso funciones avanzadas como Time Lapse y Stop Motion, con las que puedes experimentar. Una vez que hayas terminado de crear y editar tu obra maestra, expórtala para verla en la carpeta de video de XMB™. EyeCreate™ te permite expresarte y ser creativo.",1);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("CONTROL MOVE",500,"imagenes/PS3/ControlMove.jpg",45,"Entra en acción con la nueva experiencia de juegos con movimiento para Playstation®3.PlayStation®Move revoluciona los juegos con movimiento con la experiencia más envolvente y realista que sólo es posible en el sistema PlayStation®3. El control sencillo y fácil de usar captura una amplia gama de movimientos, lo que te da el mejor control sobre tu manera de jugar. Contamos con una diversa selección de juegos, y nuevos juegos se lanzan todo el tiempo, así que puedes pasar horas de diversión con tu familia y amigos.",1);
#Juegos XBOX
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("HALO 3",1000,"imagenes/Xbox/Halo3.png",48,"Halo 3 se centra en la guerra interestelar entre la humanidad del siglo XXVI, liderada por la United Nations Space Command (UNSC), y una agrupación de razas alienígenas conocida como el Covenant, la cual después de una larga guerra de décadas ha comenzado una invasión a la Tierra. El jugador asume el papel del Jefe Maestro, un supersoldado genéticamente mejorado que participa en la defensa de la humanidad, acompañado por los Marines al igual que una raza de alienígenas llamados Elites, liderados por el Inquisidor. El juego cuenta con vehículos, armas y un modo de juego jamás visto en las entregas anteriores de la saga.",2);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("GEARS OF WAR",600,"imagenes/Xbox/Gear.jpg",48,"después de la activación del martillo del alba en Sera. Marcus Fenix, El soldado de la CGO, se reintegra en el ejército después de haber pasado cuatro años en prisión por abandonar su puesto militar con el fin de hacer un vano intento por salvar a su padre, Adam Fenix. Dominic Santiago lo saca de la prisión, y lo lleva con el Escuadrón Delta. El pelotón trata de obtener el resonador, un dispositivo que haría mapas de los túneles de locust para luego implementar la bomba de masa ligera, que destruirá el corazón de las fuerzas de los locust. El pelotón delta recupera el dispositivo, pero sufren múltiples bajas en el proceso",2);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("WATCH DOGS",700,"imagenes/Xbox/watch.jpg",48,"Ambientado en un futuro cercano en la ciudad de Chicago, donde una red central de ordenadores conocida como el ctOS, conecta a todo y a todos incluyendo todos los datos e información privadas de todos sus habitantes incluso anticipando posibles crímenes, Watch_Dogs explora el impacto de la tecnología en la sociedad moderna. Usando la ciudad como arma, el protagonista se embarcará en una misión personal para administrar justicia por mano propia. El juego empieza con el protagonista, un hacker llamado Aiden Pearce actuando junto a un colega robando dinero de las cuentas corrientes de los allí presentes hackeando la red local en un hotel. ",2);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("GTA V",1000,"imagenes/Xbox/GTA.jpg",48,"Nueve años después de un atraco frustrado en Ludendorff (North Yankton), que dejó a uno de sus perpetrantes muerto, otro bajo arresto y obligó a un tercero a la clandestinidad, el exladrón de bancos, Michael Townley, fue tomado como muerto en North Yankton y ha sido puesto bajo protección de testigos por el agente corrupto del FIB Dave Norton, amigo íntimo del mismo, trasladándolo así con su familia a Los Santos (San Andreas) con una nueva identidad: «Michael De Santa». A Franklin Clinton, que trabaja como embargador de vehículos en un concesionario de coches, junto con su amigo Lamar Davis, se le pide recuperar un vehículo perteneciente al hijo de Michael, Jimmy, quien está atrasado en el pago de su adquisición. Deduciendo que su hijo está punto de convertirse en una víctima de un fraude de crédito, Michael se esconde en el vehículo y se enfrenta a Franklin. Cuando éste conduce de camino al concesionario, lo obliga a estrellar el coche contra el negocio. Clinton es despedido, pero él y De Santa se convierten en amigos",2);
#Accesiorios XBOX
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("CONTROL XBOX",500,"imagenes/Xbox/ControlXbox.png",68,"El mando inalámbrico está disponible en varios colores como negro, blanco, azul cielo, rosa, azul marino y rojo.3 También hay ediciones especiales con motivos del juego Halo 3, y de algunos equipos de fútbol. El mando Xbox 360 puede ser utilizado en un ordenador gracias al conector USB o el adaptador de mandos inalámbricos distribuido por Microsoft. Por otro lado, los soldados estadounidenses han utilizado el mando para controlar robots anti minas.",2);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("CONTROL ED.ESPECIAL",740,"imagenes/Xbox/ControlED.jpg",68,"Mando Edicion especial , esta edicion hara verte mucho mejor con tu consola, es igual de como que un control normal solo que esta edicion tiene un buen diseño color rojo.",2);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("CONTROL REMOTO MULTIMEDIA",500,"imagenes/Xbox/ControlMedia.png",68,"El control funciona como cualquier control remoto de televisor. También incluye controles para la Consola Xbox 360 y un botón que entrega acceso inmediato a un equipo conectado a Windows Media Center.El botón Guía Xbox de su control remoto pone la experiencia de Xbox 360 en sus manos. Úselo y los botones A, B, X, Y, y Aceptar para moverse y controlar la Guía e Interfaz Xbox en la Consola Xbox 360, tal como lo haría con su control.",2);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("AUDIFONOS XBOX",800,"imagenes/Xbox/Audifonos.png",68,"Una mejor experiencia multijugador , estos audifonos te haran entrar en el juego como no tienes idea , viviendo una mejor experiencia en cada juego tendras, Platica en privado con tus amigos mientras juegas , Audio claro de banda ancha , Liviano y cómodo para prolongadas sesiones de juego , Micrófono responsivo ,  ademas que es muy facil de usar",2);
#Peluculas BD
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("SILENT HILL 2",300,"imagenes/Pelicula-BD/Silent.jpg",18,"Años después de los sucesos que debió vivir en Silent Hill, Sharon Da Silva (Adelaide Clemens), ahora es una adolescente sin recuerdos del incidente, que se muda constantemente de un lugar a otro con su padre Christopher Da Silva (Sean Bean). Ambos han cambiado sus nombres a Heather Mason y Harry Mason con el fin de evadir a alguien que los ha estado atormentando durante años y no deja de perseguirlos.Tras acabar de mudarse, un día antes de comenzar la escuela, Heather sueña un mundo lugar oscuro y terrorífico donde ella escapa por un parque de diversiones de unos hombres, allí se esconde en un carrusel que pronto es rodeado por sus perseguidores, luego aparece Pyramid Head quien parece estar moviendo los mecanismos del carrusel, finalmente ve a Alessa quien la insta a no ir a Silent Hill tras lo cual despierta.",3);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("TED 2",400,"imagenes/Pelicula-BD/Ted2.jpg",51,"Ted (voz de Seth MacFarlane) finalmente se casa con su novia Tamy-Lynn (Jessica Barth), y juntos llegan a la decisión de tener un bebé. Por la obvia razón de que Ted es solo un oso de felpa, acude a su dueño y mejor amigo John Bennett (Mark Wahlberg) para que se ofrezca como su donante de esperma y de paso, practicarle a Tamy-Lynn el método de inseminación artificial. El problema radica en que, para Ted ser papá, primero debe ser reconocido ante las leyes norteamericanas como 'una persona normal', o más bien 'un ciudadano con derechos, igual que todos'. Para ello, ambos acuden a una abogada para resolver el caso: Samantha Jackson (Amanda Seyfried).",3);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("SPIDERMAN 2",400,"imagenes/Pelicula-BD/Spider.jpg",51,"Peter Parker lleva una vida muy ocupada, compaginando su tiempo entre su papel como Spider-Man, acabando con los malos, y en el instituto con la persona a la que quiere, Gwen. Peter no ve el momento de graduarse. No ha olvidado la promesa que le hizo al padre de Gwen de protegerla, manteniéndose lejos de ella, pero es una promesa que simplemente no puede cumplir. Las cosas cambiarán para Peter cuando aparece un nuevo villano, Electro, y un viejo amigo, Harry Osborn, regresa, al tiempo que descubre nuevas pistas sobre su pasado. (FILMAFFINITY)",3);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("STAR WARS EPISODE III",600,"imagenes/Pelicula-BD/Star.jpg",51,"Último capítulo de la saga de Star Wars, en el que Anakin Skywalker definitivamente se pasa al lado oscuro. En el Episodio III aparece el General Grievous, un ser implacable mitad-alien mitad-robot, el líder del ejército separatista Droid. Los Sith son los amos del lado oscuro de la Fuerza y los enemigos de los Jedi. Ellos fueron prácticamente exterminados por los Jedi hace mil años, pero la orden del mal sobrevivió en la clandestinidad. (FILMAFFINITY)",3);
insert into Productos (nombre,precio,url,disponibles,descripcion,idTipo) values("THE WARRIORS",300,"imagenes/Pelicula-BD/Warriors.jpg",54,"Cyrus, el líder de los Riffs, la banda urbana más poderosa de Nueva York, convoca a nueve miembros de cada una de las bandas de la ciudad, entre ellos los Warriors, a una multitudinaria reunión en un parque del centro. En la reunión, habla con las pandillas para iniciar una tregua entre ellas, y comenta que, contando entre todas 60.000 pandilleros frente a los 20.000 miembros del cuerpo de policía, podrían apoderarse de la ciudad; pero mientras pronuncia su discurso es asesinado por Luther, el líder de los Rogues. Fox, un miembro de los Warriors, lo observa pero, antes de que Luther pueda matarlo también, llega la policía y todas las pandillas huyen. Cuando el líder de los Warriors, Cleon, se acerca a ver el cuerpo de Cyrus, Luther, el asesino de Cyrus, culpa a los Warriors del asesinato; entonces los Riffs matan a Cleon y mandan buscar a los «Guerreros».",3);


#Procedimiento dar de Alta un cliente
delimiter **
create procedure registroCliente(apeP nvarchar(30), apeM nvarchar(30),nombres nvarchar(30),nick nvarchar(30),pass nvarchar(18),email nvarchar(30))
begin
	insert into Cliente(apeM,apeP,nombres,nick,pass,email) values(apeP,apeM,nombres,nick,pass,email);
end; **
delimiter ;
#Procedimiento para hacer el Login
delimiter **
create procedure Login(nickLog nvarchar(50),passLog nvarchar(50))
begin
	select * from Cliente where nick = nickLog and pass = passLog;
end;**
delimiter ;

#Procedimiento para consultar todos los productos Ps3
delimiter **
create procedure ProdPs3()
begin
	select * from Productos where idTipo = 1;
end;**
delimiter ;
#Procedimineto para consultar todos los productos Xbox
delimiter **
create procedure ProdXbox()
begin
	select * from Productos where idTipo = 2;
end;**
delimiter ;
#Procedimiento para consultar todas las peliculas
delimiter **
create procedure ProdPelis()
begin
	select * from Productos where idTipo = 3;
end;**
delimiter ;
#Procedimiento para consultar todos los productos
delimiter **
create procedure Productos()
begin
	select * from Productos;
end;**
delimiter ;

#Procedimiento Registrar un producto en mi carrito
delimiter **
create procedure IngresaCarrito(idProductosP int, idCliente int)
begin
	insert into Carro(idProductos,idClie) values (idProductosP,idCliente);
end;**
delimiter ;

#Procedimiento Para consultar Carrito llevado
delimiter **
create procedure Carro(idClieP int)
begin
	select Carro.idCarro, Productos.idProductos , Productos.disponibles , Productos.nombre , Productos.precio , Productos.url from 
		Carro inner join Productos on Carro.idProductos = Productos.idProductos where Carro.idClie = idClieP;
end;**
delimiter ;

#Procedimiento para Modificar al Cliente
delimiter **
create procedure modificarCliente(apePM nvarchar(30), apeMM nvarchar(30),nombresM nvarchar(30),nickM nvarchar(30),passM nvarchar(18),emailM nvarchar(30),id int)
	begin
		update Cliente set apeP = apePM where idClie = id;
		update Cliente set apeM = apeMM where idClie = id;
		update Cliente set nombres = nombresM where idClie = id;
		update Cliente set nick = nickM where idClie = id;
		update Cliente set pass = passM where idClie = id;
		update Cliente set email = emailM where idClie = id;
	end;**
delimiter ;


#Procedimiento para limpiar el carrito
delimiter **
create procedure Pagar(idClieP int)
begin
	delete from Carro where idClie = idClieP;
end;**
delimiter ;

#Procedimiento borrar un producto de tu carrito
delimiter **
create procedure borrarProducto(idClieP int , idCarroP int)
begin
	delete from Carro where Carro.idCarro = idCarroP and Carro.idClie = idClieP;
end;**
delimiter ;



SET SQL_SAFE_UPDATES=0;


call registroCliente("Colin","Heredia","Luis Antonio","ColinTony","1234","colin@colin.com");
call registroCliente("Cortes","Pepe","Martinez","Cortesito","cortes","cortes@cortes.com");


call Carro(1);
#call Login("ColinTony","1234");
#select * from Productos;
#drop database tiendaColin;
#drop procedure registroCliente;