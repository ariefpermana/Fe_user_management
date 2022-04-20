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