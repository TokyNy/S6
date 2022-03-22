create table Table(
    id varchar(10) not null default concat('Table',nextval('seqAddition')),
    desc varchar(20) not null,
    PRIMARY KEY(id)
);

create table Addition(
    id varchar(10) not null default concat('Add',nextval('seqAddition')),
    idTable varchar(10) not null,
    date datetime not null,
    prixTotal float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idTable) REFERENCES Table(id),
);

create table AddictionDetails(
    id varchar(10) not null default concat('AddDet',nextval('seqAddition')),
    idAddition varchar(10) not null,
    idPlat varchar(10) not null,
    prix float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idAddition) REFERENCES Addition(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id)
);

create table Ingredients(
    id varchar(10) not null default concat('Ing',nextval('seqAddition')),
    desc varchar(20) not null,
    poids float not null,
    PRIMARY KEY(id)
);

create table Plat(
    id varchar(10) not null default concat('Plat',nextval('seqAddition')),
    desc varchar(20) not null,
    prix float not null,
    PRIMARY KEY(id)
);

insert into
create table PlatDetails(
    id varchar(10) not null default concat('PlatDet',nextval('seqAddition')),
    idPlat varchar(10) not null,
    idIngredient varchar(10) not null,
    poids float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id),
    FOREIGN KEY(idIngredient) REFERENCES Ingredients(id)
);
