CREATE TABLE public.tb_master_user_role (
	role_id int4 NOT NULL,
	role_name varchar(255) NULL,
	CONSTRAINT tb_master_user_role_pkey PRIMARY KEY (role_id)
);

CREATE TABLE public.tb_master_user (
	user_id bigserial NOT NULL,
	alamat varchar(255) NULL,
	created_on timestamp NULL,
	email varchar(255) NULL,
	jenis_kelamin varchar(255) NULL,
	lastupdated timestamp NULL,
	"name" varchar(255) NULL,
	role_id int4 NULL,
	CONSTRAINT tb_master_user_pkey PRIMARY KEY (user_id)
);

INSERT INTO public.tb_master_user (alamat,created_on,email,jenis_kelamin,lastupdated,"name",role_id) VALUES
	 ('tangerang','2022-04-21 09:02:31','ariefpermana@gmail.com','L','2022-04-21 13:12:15','arief permana',0);

INSERT INTO public.tb_master_user_role (role_id,role_name) VALUES
	 (0,'Admin'),
	 (1,'Developer'),
	 (2,'QA');