CREATE DATABASE desafio4;

\c desafio4;

CREATE TABLE Autor(
    ID_Autor Serial NOT NULL,
    Nombre_Autor VARCHAR(50),
    PRIMARY KEY(ID_Autor)
);

CREATE TABLE Usuario(
    ID_Usuario SERIAL NOT NULL,
    Nombre VARCHAR(20),
    Apellido_Pat VARCHAR(20),
    Apellido_Mat VARCHAR(20),
    PRIMARY KEY (ID_Usuario)
);


CREATE TABLE Editorial(
    ID_Editorial SERIAL NOT NULL,
    Nombre_Editorial VARCHAR(100),
    PRIMARY KEY (ID_Editorial)
);


CREATE TABLE Libro(
    Cod_Libro SERIAL NOT NULL,
    Titulo VARCHAR(100),
    PRIMARY KEY (Cod_Libro)
);

CREATE TABLE Solicitado_Por(
    ID_User INT NOT NULL,
    Cod_Book INT NOT NULL,
    Fecha_Devolucion DATE,
    PRIMARY KEY (ID_User),
    PRIMARY KEY (Cod_Book),
    FOREIGN KEY (Cod_Book) REFERENCES Libro(Cod_Libro),
    FOREIGN KEY (ID_User) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Escrito_Por(
    Cod_Libro INT NOT NULL,
    ID_Autor INT NOT NULL,
    PRIMARY KEY (Cod_Libro),
    PRIMARY KEY (ID_Autor),
    FOREIGN KEY (Cod_Libro) REFERENCES Libro(Cod_Libro),
    FOREIGN KEY (ID_Autor) REFERENCES Autor(ID_Autor)
);

CREATE TABLE Editado_Por(
    Cod_Libro INT NOT NULL,
    ID_Editorial INT NOT NULL,
    PRIMARY KEY (ID_Editorial),
    PRIMARY KEY (Cod_Libro),
    FOREIGN KEY (ID_Editorial) REFERENCES Editorial(ID_Editorial),
    FOREIGN KEY (Cod_Libro) REFERENCES Libro(Cod_Libro)
);