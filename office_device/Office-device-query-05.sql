CREATE TABLE kuliah.pelajaran (
	kdmk CHAR(4) NOT NULL,
	matkul varchar(50) NULL,
	sks INT null,
	PRIMARY KEY (kdmk),
	CONSTRAINT uc_pelajaran UNIQUE (kdmk)
);
