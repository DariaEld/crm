CREATE TABLE public.client
(
    id numeric NOT NULL DEFAULT nextval('client_seq'),
    fio character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying,
    passport character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.product
(
    id numeric NOT NULL DEFAULT nextval('product_seq'),
    name character varying NOT NULL,
    price numeric NOT NULL,
    img_src character varying,
    PRIMARY KEY (id)
);

CREATE TABLE public.deal_status
(
    id numeric NOT NULL,
    key_name character varying NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT key_name_uq UNIQUE (key_name)
);

CREATE TABLE public.deal
(
    id numeric NOT NULL DEFAULT nextval('deal_seq'),
    date_created date DEFAULT CURRENT_DATE,
    status_id numeric NOT NULL,
    client_id numeric NOT NULL,
    product_id numeric NOT NULL,
    comment character varying,
    PRIMARY KEY (id),
    CONSTRAINT client_fk FOREIGN KEY (client_id)
        REFERENCES public.client (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_fk FOREIGN KEY (product_id)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT status_fk FOREIGN KEY (status_id)
        REFERENCES public.deal_status (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);