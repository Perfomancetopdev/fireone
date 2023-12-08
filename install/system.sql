--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.19
-- Dumped by pg_dump version 9.6.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: actions; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA actions;


ALTER SCHEMA actions OWNER TO admin;

--
-- Name: admin; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA admin;


ALTER SCHEMA admin OWNER TO admin;

--
-- Name: affiliate; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA affiliate;


ALTER SCHEMA affiliate OWNER TO admin;

--
-- Name: lists; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA lists;


ALTER SCHEMA lists OWNER TO admin;

--
-- Name: production; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA production;


ALTER SCHEMA production OWNER TO admin;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: naturalsort(text); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.naturalsort(text) RETURNS bytea
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
    select string_agg(convert_to(coalesce(r[2], length(length(r[1])::text) || length(r[1])::text || r[1]), 'SQL_ASCII'),'\x00')
    from regexp_matches($1, '0*([0-9]+)|([^0-9]+)', 'g') r;
$_$;


ALTER FUNCTION public.naturalsort(text) OWNER TO admin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clicks; Type: TABLE; Schema: actions; Owner: admin
--

CREATE TABLE actions.clicks (
    id integer NOT NULL,
    unique_token text NOT NULL,
    process_id integer NOT NULL,
    process_type character varying(10) NOT NULL,
    user_production_id integer NOT NULL,
    user_full_name text NOT NULL,
    vmta_id integer,
    smtp_user_id integer,
    affiliate_network_id integer NOT NULL,
    offer_production_id character varying(200) NOT NULL,
    list_id integer NOT NULL,
    client_id integer NOT NULL,
    action_time timestamp without time zone NOT NULL,
    process_updated boolean,
    agent text,
    action_ip character varying(15) DEFAULT NULL::character varying,
    country_code character varying(10) DEFAULT NULL::character varying,
    country character varying(100) DEFAULT NULL::character varying,
    region character varying(100) DEFAULT NULL::character varying,
    city character varying(100) DEFAULT NULL::character varying,
    device_type character varying(100) DEFAULT NULL::character varying,
    device_name character varying(100) DEFAULT NULL::character varying,
    operating_system character varying(50) DEFAULT NULL::character varying,
    browser_name character varying(50) DEFAULT NULL::character varying,
    browser_version character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE actions.clicks OWNER TO admin;

--
-- Name: leads; Type: TABLE; Schema: actions; Owner: admin
--

CREATE TABLE actions.leads (
    id integer NOT NULL,
    unique_token text NOT NULL,
    process_id integer NOT NULL,
    process_type character varying(10) NOT NULL,
    user_production_id integer NOT NULL,
    user_full_name text NOT NULL,
    vmta_id integer,
    smtp_user_id integer,
    affiliate_network_id integer NOT NULL,
    offer_production_id character varying(200) NOT NULL,
    list_id integer NOT NULL,
    client_id integer NOT NULL,
    action_time timestamp without time zone NOT NULL,
    payout numeric NOT NULL,
    process_updated boolean,
    agent text,
    action_ip character varying(15) DEFAULT NULL::character varying,
    country_code character varying(10) DEFAULT NULL::character varying,
    country character varying(100) DEFAULT NULL::character varying,
    region character varying(100) DEFAULT NULL::character varying,
    city character varying(100) DEFAULT NULL::character varying,
    device_type character varying(100) DEFAULT NULL::character varying,
    device_name character varying(100) DEFAULT NULL::character varying,
    operating_system character varying(50) DEFAULT NULL::character varying,
    browser_name character varying(50) DEFAULT NULL::character varying,
    browser_version character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE actions.leads OWNER TO admin;

--
-- Name: opens; Type: TABLE; Schema: actions; Owner: admin
--

CREATE TABLE actions.opens (
    id integer NOT NULL,
    unique_token text NOT NULL,
    process_id integer NOT NULL,
    process_type character varying(10) NOT NULL,
    user_production_id integer NOT NULL,
    user_full_name text NOT NULL,
    vmta_id integer,
    smtp_user_id integer,
    affiliate_network_id integer NOT NULL,
    offer_production_id character varying(200) NOT NULL,
    list_id integer NOT NULL,
    client_id integer NOT NULL,
    action_time timestamp without time zone NOT NULL,
    process_updated boolean,
    agent text,
    action_ip character varying(15) DEFAULT NULL::character varying,
    country_code character varying(10) DEFAULT NULL::character varying,
    country character varying(100) DEFAULT NULL::character varying,
    region character varying(100) DEFAULT NULL::character varying,
    city character varying(100) DEFAULT NULL::character varying,
    device_type character varying(100) DEFAULT NULL::character varying,
    device_name character varying(100) DEFAULT NULL::character varying,
    operating_system character varying(50) DEFAULT NULL::character varying,
    browser_name character varying(50) DEFAULT NULL::character varying,
    browser_version character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE actions.opens OWNER TO admin;

--
-- Name: optouts; Type: TABLE; Schema: actions; Owner: admin
--

CREATE TABLE actions.optouts (
    id integer NOT NULL,
    unique_token text NOT NULL,
    process_id integer NOT NULL,
    process_type character varying(10) NOT NULL,
    user_production_id integer NOT NULL,
    user_full_name text NOT NULL,
    vmta_id integer,
    smtp_user_id integer,
    affiliate_network_id integer NOT NULL,
    offer_production_id character varying(200) NOT NULL,
    list_id integer NOT NULL,
    client_id integer NOT NULL,
    action_time timestamp without time zone NOT NULL,
    process_updated boolean,
    agent text,
    action_ip character varying(15) DEFAULT NULL::character varying,
    country_code character varying(10) DEFAULT NULL::character varying,
    country character varying(100) DEFAULT NULL::character varying,
    region character varying(100) DEFAULT NULL::character varying,
    city character varying(100) DEFAULT NULL::character varying,
    device_type character varying(100) DEFAULT NULL::character varying,
    device_name character varying(100) DEFAULT NULL::character varying,
    operating_system character varying(50) DEFAULT NULL::character varying,
    browser_name character varying(50) DEFAULT NULL::character varying,
    browser_version character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE actions.optouts OWNER TO admin;

--
-- Name: seq_id_clicks; Type: SEQUENCE; Schema: actions; Owner: admin
--

CREATE SEQUENCE actions.seq_id_clicks
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actions.seq_id_clicks OWNER TO admin;

--
-- Name: seq_id_leads; Type: SEQUENCE; Schema: actions; Owner: admin
--

CREATE SEQUENCE actions.seq_id_leads
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actions.seq_id_leads OWNER TO admin;

--
-- Name: seq_id_opens; Type: SEQUENCE; Schema: actions; Owner: admin
--

CREATE SEQUENCE actions.seq_id_opens
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actions.seq_id_opens OWNER TO admin;

--
-- Name: seq_id_optouts; Type: SEQUENCE; Schema: actions; Owner: admin
--

CREATE SEQUENCE actions.seq_id_optouts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actions.seq_id_optouts OWNER TO admin;

--
-- Name: seq_id_unsubscribes; Type: SEQUENCE; Schema: actions; Owner: admin
--

CREATE SEQUENCE actions.seq_id_unsubscribes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actions.seq_id_unsubscribes OWNER TO admin;

--
-- Name: unsubscribes; Type: TABLE; Schema: actions; Owner: admin
--

CREATE TABLE actions.unsubscribes (
    id integer NOT NULL,
    unique_token text NOT NULL,
    process_id integer NOT NULL,
    process_type character varying(10) NOT NULL,
    user_production_id integer NOT NULL,
    user_full_name text NOT NULL,
    vmta_id integer,
    smtp_user_id integer,
    affiliate_network_id integer NOT NULL,
    offer_production_id character varying(200) NOT NULL,
    list_id integer NOT NULL,
    client_id integer NOT NULL,
    action_time timestamp without time zone NOT NULL,
    process_updated boolean,
    agent text,
    action_ip character varying(15) DEFAULT NULL::character varying,
    country_code character varying(10) DEFAULT NULL::character varying,
    country character varying(100) DEFAULT NULL::character varying,
    region character varying(100) DEFAULT NULL::character varying,
    city character varying(100) DEFAULT NULL::character varying,
    device_type character varying(100) DEFAULT NULL::character varying,
    device_name character varying(100) DEFAULT NULL::character varying,
    operating_system character varying(50) DEFAULT NULL::character varying,
    browser_name character varying(50) DEFAULT NULL::character varying,
    browser_version character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE actions.unsubscribes OWNER TO admin;

--
-- Name: atlantic_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.atlantic_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    access_key text NOT NULL,
    private_key text NOT NULL,
    proxy_status character varying(100) NOT NULL,
    proxy_ip character varying(100) DEFAULT NULL::character varying,
    proxy_port character varying(5) DEFAULT NULL::character varying,
    proxy_username text,
    proxy_password text,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.atlantic_accounts OWNER TO admin;

--
-- Name: atlantic_instances; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.atlantic_instances (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    instance_id character varying(100) NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(200) NOT NULL,
    mta_server_id integer NOT NULL,
    mta_server_name character varying(200) NOT NULL,
    size character varying(100) NOT NULL,
    platform character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.atlantic_instances OWNER TO admin;

--
-- Name: atlantic_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.atlantic_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    account_id integer NOT NULL,
    region character varying(200) NOT NULL,
    nb_instances integer NOT NULL,
    domains text NOT NULL,
    os character varying(100) NOT NULL,
    size character varying(100) NOT NULL,
    progress character varying(10) NOT NULL,
    instances_created integer,
    instances_installed integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE admin.atlantic_processes OWNER TO admin;

--
-- Name: audit_logs; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.audit_logs (
    id integer NOT NULL,
    action_by character varying(200) NOT NULL,
    record_id integer NOT NULL,
    record_name character varying(200) NOT NULL,
    record_type character varying(100) NOT NULL,
    action_type character varying(100) NOT NULL,
    action_time timestamp without time zone NOT NULL
);


ALTER TABLE admin.audit_logs OWNER TO admin;

--
-- Name: aws_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.aws_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    access_key character varying(200) NOT NULL,
    secret_key character varying(200) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date,
    default_images_ids text,
    proxy_status character varying(100),
    proxy_ip character varying(100),
    proxy_port character varying(5),
    proxy_username character varying(500),
    proxy_password character varying(500)
);


ALTER TABLE admin.aws_accounts OWNER TO admin;

--
-- Name: aws_accounts_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.aws_accounts_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    account_id integer NOT NULL,
    account_name character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    process_type character varying(100) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE admin.aws_accounts_processes OWNER TO admin;

--
-- Name: aws_instances; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.aws_instances (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(200) NOT NULL,
    mta_server_id integer NOT NULL,
    mta_server_name character varying(200) NOT NULL,
    type character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date,
    region_name text
);


ALTER TABLE admin.aws_instances OWNER TO admin;

--
-- Name: aws_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.aws_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    account_id integer NOT NULL,
    regions text NOT NULL,
    nb_instances integer NOT NULL,
    domains text NOT NULL,
    os character varying(100) NOT NULL,
    instance_type character varying(100) NOT NULL,
    subnets_filter text,
    progress character varying(10) NOT NULL,
    instances_created integer,
    instances_installed integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone,
    storage integer NOT NULL,
    account_name character varying(100),
    nb_private_ips integer
);


ALTER TABLE admin.aws_processes OWNER TO admin;

--
-- Name: digital_ocean_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.digital_ocean_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    token text NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date,
    proxy_ip character varying(200),
    proxy_port character varying(5),
    proxy_status character varying(100),
    proxy_username character varying(500),
    proxy_password character varying(500)
);


ALTER TABLE admin.digital_ocean_accounts OWNER TO admin;

--
-- Name: digital_ocean_droplets; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.digital_ocean_droplets (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(200) NOT NULL,
    mta_server_id integer NOT NULL,
    mta_server_name character varying(200) NOT NULL,
    size character varying(100) NOT NULL,
    platform character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date,
    droplet_id character varying(100)
);


ALTER TABLE admin.digital_ocean_droplets OWNER TO admin;

--
-- Name: digital_ocean_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.digital_ocean_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    account_id integer NOT NULL,
    region character varying(200) NOT NULL,
    nb_droplets integer NOT NULL,
    domains text NOT NULL,
    os character varying(100) NOT NULL,
    size character varying(100) NOT NULL,
    progress character varying(10) NOT NULL,
    droplets_created integer,
    droplets_installed integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE admin.digital_ocean_processes OWNER TO admin;

--
-- Name: domains; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.domains (
    id integer NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(100) NOT NULL,
    account_type character varying(50) NOT NULL,
    status character varying(20) NOT NULL,
    mta_server_id integer,
    ip_id integer,
    value character varying(100) NOT NULL,
    availability character varying(50) NOT NULL,
    has_brand character varying(10) NOT NULL,
    expiration_date date NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.domains OWNER TO admin;

--
-- Name: godaddy_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.godaddy_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    customer_id character varying(200) NOT NULL,
    access_key character varying(200) NOT NULL,
    secret_key character varying(200) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.godaddy_accounts OWNER TO admin;

--
-- Name: hetzner_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.hetzner_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    api_key text NOT NULL,
    proxy_status character varying(100) NOT NULL,
    proxy_ip character varying(100) DEFAULT NULL::character varying,
    proxy_port character varying(5) DEFAULT NULL::character varying,
    proxy_username text,
    proxy_password text,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.hetzner_accounts OWNER TO admin;

--
-- Name: hetzner_instances; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.hetzner_instances (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    instance_id character varying(100) NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(200) NOT NULL,
    mta_server_id integer NOT NULL,
    mta_server_name character varying(200) NOT NULL,
    size character varying(100) NOT NULL,
    platform character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.hetzner_instances OWNER TO admin;

--
-- Name: hetzner_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.hetzner_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    account_id integer NOT NULL,
    region character varying(200) NOT NULL,
    nb_instances integer NOT NULL,
    domains text NOT NULL,
    os character varying(100) NOT NULL,
    size character varying(100) NOT NULL,
    progress character varying(10) NOT NULL,
    instances_created integer,
    instances_installed integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE admin.hetzner_processes OWNER TO admin;

--
-- Name: isps; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.isps (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    schema_name character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.isps OWNER TO admin;

--
-- Name: linode_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.linode_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    token text NOT NULL,
    proxy_status character varying(100) NOT NULL,
    proxy_ip character varying(100) DEFAULT NULL::character varying,
    proxy_port character varying(5) DEFAULT NULL::character varying,
    proxy_username text,
    proxy_password text,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.linode_accounts OWNER TO admin;

--
-- Name: linode_instances; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.linode_instances (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    instance_id character varying(100) NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(200) NOT NULL,
    mta_server_id integer NOT NULL,
    mta_server_name character varying(200) NOT NULL,
    size character varying(100) NOT NULL,
    platform character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.linode_instances OWNER TO admin;

--
-- Name: linode_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.linode_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    account_id integer NOT NULL,
    region character varying(200) NOT NULL,
    nb_instances integer NOT NULL,
    domains text NOT NULL,
    os character varying(100) NOT NULL,
    size character varying(100) NOT NULL,
    progress character varying(10) NOT NULL,
    instances_created integer,
    instances_installed integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE admin.linode_processes OWNER TO admin;

--
-- Name: mailboxes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.mailboxes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(100) NOT NULL,
    domain_id integer NOT NULL,
    domain_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.mailboxes OWNER TO admin;

--
-- Name: management_servers; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.management_servers (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    provider_name character varying(200) NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(200) NOT NULL,
    host_name character varying(200) DEFAULT NULL::character varying,
    main_ip character varying(200) NOT NULL,
    ssh_login_type character varying(50) NOT NULL,
    ssh_username character varying(100) NOT NULL,
    ssh_password character varying(100) DEFAULT NULL::character varying,
    ssh_pem_content text,
    ssh_passphrase character varying(200) DEFAULT NULL::character varying,
    ssh_port integer NOT NULL,
    expiration_date date NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.management_servers OWNER TO admin;

--
-- Name: mta_servers; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.mta_servers (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    provider_name character varying(200) NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(200) NOT NULL,
    host_name character varying(200) DEFAULT NULL::character varying,
    main_ip character varying(200) NOT NULL,
    ssh_login_type character varying(50) NOT NULL,
    ssh_username character varying(100) NOT NULL,
    ssh_password character varying(100) DEFAULT NULL::character varying,
    old_ssh_password character varying(100) DEFAULT NULL::character varying,
    ssh_pem_content text,
    ssh_passphrase text,
    ssh_port integer NOT NULL,
    old_ssh_port integer NOT NULL,
    ips_count integer,
    is_installed boolean,
    dmarc_installed boolean,
    dkim_installed boolean,
    ssh_connectivity_status character varying(100) DEFAULT 'Not Checked'::character varying,
    expiration_date date NOT NULL,
    os character varying(100),
    country_code character varying(3) DEFAULT 'US'::character varying,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.mta_servers OWNER TO admin;

--
-- Name: namecheap_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.namecheap_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    api_key character varying(200) NOT NULL,
    white_listed_ip character varying(15) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.namecheap_accounts OWNER TO admin;

--
-- Name: namecom_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.namecom_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    api_key character varying(200) NOT NULL,
    white_listed_ip character varying(15) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.namecom_accounts OWNER TO admin;

--
-- Name: permissions; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    role_name character varying(100) NOT NULL,
    controller character varying(100) NOT NULL,
    method character varying(100) NOT NULL,
    parents character varying(200) DEFAULT NULL::character varying,
    permission_key character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.permissions OWNER TO admin;

--
-- Name: pmta_commands_history; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.pmta_commands_history (
    id integer NOT NULL,
    server_id integer NOT NULL,
    user_id integer NOT NULL,
    action character varying(50) NOT NULL,
    target character varying(50) NOT NULL,
    isps text,
    vmtas text,
    results text,
    action_time timestamp without time zone NOT NULL
);


ALTER TABLE admin.pmta_commands_history OWNER TO admin;

--
-- Name: pmta_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.pmta_processes (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    provider_name character varying(200) NOT NULL,
    server_id integer NOT NULL,
    server_name text NOT NULL,
    user_full_name text NOT NULL,
    queues character varying(100) DEFAULT NULL::character varying,
    vmtas text,
    pause_wait integer NOT NULL,
    resume_wait integer NOT NULL,
    action_start_time timestamp without time zone NOT NULL
);


ALTER TABLE admin.pmta_processes OWNER TO admin;

--
-- Name: proxy_servers; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.proxy_servers (
    id integer NOT NULL,
    mta_server_id integer,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    proxy_username character varying(100) DEFAULT NULL::character varying,
    proxy_password character varying(100) DEFAULT NULL::character varying,
    http_port integer NOT NULL,
    socks_port integer,
    ips_count integer NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.proxy_servers OWNER TO admin;

--
-- Name: roles; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.roles (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    role_type character varying(50) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.roles OWNER TO admin;

--
-- Name: scaleway_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.scaleway_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    api_token text NOT NULL,
    organization text NOT NULL,
    proxy_status character varying(100) NOT NULL,
    proxy_ip character varying(100) DEFAULT NULL::character varying,
    proxy_port character varying(5) DEFAULT NULL::character varying,
    proxy_username text,
    proxy_password text,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.scaleway_accounts OWNER TO admin;

--
-- Name: scaleway_instances; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.scaleway_instances (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    instance_id character varying(100) NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(200) NOT NULL,
    mta_server_id integer NOT NULL,
    mta_server_name character varying(200) NOT NULL,
    size character varying(100) NOT NULL,
    platform character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.scaleway_instances OWNER TO admin;

--
-- Name: scaleway_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.scaleway_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20) DEFAULT NULL::character varying,
    account_id integer NOT NULL,
    region character varying(200) NOT NULL,
    nb_instances integer NOT NULL,
    domains text NOT NULL,
    os character varying(100) NOT NULL,
    size character varying(100) NOT NULL,
    progress character varying(10) NOT NULL,
    instances_created integer,
    instances_installed integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE admin.scaleway_processes OWNER TO admin;

--
-- Name: seq_id_atlantic_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_atlantic_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_atlantic_accounts OWNER TO admin;

--
-- Name: seq_id_atlantic_instances; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_atlantic_instances
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_atlantic_instances OWNER TO admin;

--
-- Name: seq_id_atlantic_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_atlantic_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_atlantic_processes OWNER TO admin;

--
-- Name: seq_id_audit_logs; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_audit_logs
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_audit_logs OWNER TO admin;

--
-- Name: seq_id_aws_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_aws_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_aws_accounts OWNER TO admin;

--
-- Name: seq_id_aws_accounts_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_aws_accounts_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_aws_accounts_processes OWNER TO admin;

--
-- Name: seq_id_aws_instances; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_aws_instances
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_aws_instances OWNER TO admin;

--
-- Name: seq_id_aws_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_aws_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_aws_processes OWNER TO admin;

--
-- Name: seq_id_digital_ocean_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_digital_ocean_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_digital_ocean_accounts OWNER TO admin;

--
-- Name: seq_id_digital_ocean_droplets; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_digital_ocean_droplets
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_digital_ocean_droplets OWNER TO admin;

--
-- Name: seq_id_digital_ocean_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_digital_ocean_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_digital_ocean_processes OWNER TO admin;

--
-- Name: seq_id_domains; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_domains
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_domains OWNER TO admin;

--
-- Name: seq_id_godaddy_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_godaddy_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_godaddy_accounts OWNER TO admin;

--
-- Name: seq_id_hetzner_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_hetzner_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_hetzner_accounts OWNER TO admin;

--
-- Name: seq_id_hetzner_instances; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_hetzner_instances
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_hetzner_instances OWNER TO admin;

--
-- Name: seq_id_hetzner_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_hetzner_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_hetzner_processes OWNER TO admin;

--
-- Name: seq_id_isps; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_isps
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_isps OWNER TO admin;

--
-- Name: seq_id_linode_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_linode_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_linode_accounts OWNER TO admin;

--
-- Name: seq_id_linode_instances; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_linode_instances
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_linode_instances OWNER TO admin;

--
-- Name: seq_id_linode_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_linode_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_linode_processes OWNER TO admin;

--
-- Name: seq_id_mailboxes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_mailboxes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_mailboxes OWNER TO admin;

--
-- Name: seq_id_management_servers; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_management_servers
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_management_servers OWNER TO admin;

--
-- Name: seq_id_mta_servers; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_mta_servers
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_mta_servers OWNER TO admin;

--
-- Name: seq_id_namecheap_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_namecheap_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_namecheap_accounts OWNER TO admin;

--
-- Name: seq_id_namecom_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_namecom_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_namecom_accounts OWNER TO admin;

--
-- Name: seq_id_permissions; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_permissions
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_permissions OWNER TO admin;

--
-- Name: seq_id_pmta_commands_history; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_pmta_commands_history
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_pmta_commands_history OWNER TO admin;

--
-- Name: seq_id_pmta_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_pmta_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_pmta_processes OWNER TO admin;

--
-- Name: seq_id_proxy_servers; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_proxy_servers
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_proxy_servers OWNER TO admin;

--
-- Name: seq_id_roles; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_roles
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_roles OWNER TO admin;

--
-- Name: seq_id_scaleway_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_scaleway_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_scaleway_accounts OWNER TO admin;

--
-- Name: seq_id_scaleway_instances; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_scaleway_instances
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_scaleway_instances OWNER TO admin;

--
-- Name: seq_id_scaleway_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_scaleway_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_scaleway_processes OWNER TO admin;

--
-- Name: seq_id_servers_providers; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_servers_providers
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_servers_providers OWNER TO admin;

--
-- Name: seq_id_servers_vmtas; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_servers_vmtas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_servers_vmtas OWNER TO admin;

--
-- Name: seq_id_smtp_servers; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_smtp_servers
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_smtp_servers OWNER TO admin;

--
-- Name: seq_id_smtp_users; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_smtp_users
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_smtp_users OWNER TO admin;

--
-- Name: seq_id_subdomain_names; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_subdomain_names
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_subdomain_names OWNER TO admin;

--
-- Name: seq_id_users; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_users
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_users OWNER TO admin;

--
-- Name: seq_id_users_roles; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_users_roles
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_users_roles OWNER TO admin;

--
-- Name: seq_id_vultr_accounts; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_vultr_accounts
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_vultr_accounts OWNER TO admin;

--
-- Name: seq_id_vultr_instances; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_vultr_instances
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_vultr_instances OWNER TO admin;

--
-- Name: seq_id_vultr_processes; Type: SEQUENCE; Schema: admin; Owner: admin
--

CREATE SEQUENCE admin.seq_id_vultr_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin.seq_id_vultr_processes OWNER TO admin;

--
-- Name: servers_providers; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.servers_providers (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.servers_providers OWNER TO admin;

--
-- Name: servers_vmtas; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.servers_vmtas (
    id integer NOT NULL,
    mta_server_id integer NOT NULL,
    mta_server_name character varying(200) NOT NULL,
    isp_id integer,
    isp_name character varying(200) DEFAULT NULL::character varying,
    status character varying(20) NOT NULL,
    type character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    domain character varying(100) NOT NULL,
    custom_domain character varying(100) DEFAULT NULL::character varying,
    ip character varying(100) NOT NULL,
    ping_status character varying(100) DEFAULT 'Not Checked'::character varying,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.servers_vmtas OWNER TO admin;

--
-- Name: smtp_servers; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.smtp_servers (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    provider_name character varying(200) NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(200) NOT NULL,
    host_name character varying(200) DEFAULT NULL::character varying,
    encryption_type character varying(10) NOT NULL,
    smtp_port integer NOT NULL,
    users_count integer NOT NULL,
    expiration_date date NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.smtp_servers OWNER TO admin;

--
-- Name: smtp_users; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.smtp_users (
    id integer NOT NULL,
    smtp_server_id integer NOT NULL,
    smtp_server_name character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(200) NOT NULL,
    proxy_ip character varying(200) DEFAULT NULL::character varying,
    proxy_port integer,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date,
    proxy_username character varying(200),
    proxy_password character varying(200)
);


ALTER TABLE admin.smtp_users OWNER TO admin;

--
-- Name: subdomain_names; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.subdomain_names (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.subdomain_names OWNER TO admin;

--
-- Name: users; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.users (
    id integer NOT NULL,
    production_id integer NOT NULL,
    master_access character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    first_name character varying(200) NOT NULL,
    last_name character varying(200) DEFAULT NULL::character varying,
    email character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    avatar_name character varying(100) DEFAULT NULL::character varying,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.users OWNER TO admin;

--
-- Name: users_roles; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.users_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.users_roles OWNER TO admin;

--
-- Name: vultr_accounts; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.vultr_accounts (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    token text NOT NULL,
    proxy_status character varying(100) NOT NULL,
    proxy_ip character varying(100) DEFAULT NULL::character varying,
    proxy_port character varying(5) DEFAULT NULL::character varying,
    proxy_username text,
    proxy_password text,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.vultr_accounts OWNER TO admin;

--
-- Name: vultr_instances; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.vultr_instances (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    instance_id character varying(100) NOT NULL,
    account_id integer NOT NULL,
    account_name character varying(200) NOT NULL,
    mta_server_id integer NOT NULL,
    mta_server_name character varying(200) NOT NULL,
    size character varying(100) NOT NULL,
    platform character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE admin.vultr_instances OWNER TO admin;

--
-- Name: vultr_processes; Type: TABLE; Schema: admin; Owner: admin
--

CREATE TABLE admin.vultr_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20) DEFAULT NULL::character varying,
    account_id integer NOT NULL,
    region character varying(200) NOT NULL,
    nb_instances integer NOT NULL,
    domains text NOT NULL,
    os character varying(100) NOT NULL,
    size character varying(100) NOT NULL,
    progress character varying(10) NOT NULL,
    instances_created integer,
    instances_installed integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE admin.vultr_processes OWNER TO admin;

--
-- Name: affiliate_networks; Type: TABLE; Schema: affiliate; Owner: admin
--

CREATE TABLE affiliate.affiliate_networks (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    affiliate_id integer NOT NULL,
    name character varying(100) NOT NULL,
    company_name character varying(200) DEFAULT NULL::character varying,
    website character varying(100) DEFAULT NULL::character varying,
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    api_type character varying(50) DEFAULT NULL::character varying,
    api_url character varying(200) DEFAULT NULL::character varying,
    api_key text,
    sub_id_one character varying(100) DEFAULT NULL::character varying,
    sub_id_two character varying(100) DEFAULT NULL::character varying,
    sub_id_three character varying(100) DEFAULT NULL::character varying,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date,
    network_id character varying(200)
);


ALTER TABLE affiliate.affiliate_networks OWNER TO admin;

--
-- Name: creatives; Type: TABLE; Schema: affiliate; Owner: admin
--

CREATE TABLE affiliate.creatives (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    affiliate_network_id integer NOT NULL,
    offer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    value text NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE affiliate.creatives OWNER TO admin;

--
-- Name: from_names; Type: TABLE; Schema: affiliate; Owner: admin
--

CREATE TABLE affiliate.from_names (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    affiliate_network_id integer NOT NULL,
    offer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    value character varying(200) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE affiliate.from_names OWNER TO admin;

--
-- Name: links; Type: TABLE; Schema: affiliate; Owner: admin
--

CREATE TABLE affiliate.links (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    affiliate_network_id integer NOT NULL,
    offer_id integer NOT NULL,
    creative_id integer NOT NULL,
    type character varying(10) NOT NULL,
    value text NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE affiliate.links OWNER TO admin;

--
-- Name: offers; Type: TABLE; Schema: affiliate; Owner: admin
--

CREATE TABLE affiliate.offers (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    affiliate_network_id integer NOT NULL,
    affiliate_network_name character varying(200) NOT NULL,
    production_id character varying(200) NOT NULL,
    campaign_id character varying(200) NOT NULL,
    verticals_ids text,
    name character varying(200) NOT NULL,
    countries text NOT NULL,
    description text,
    rules text,
    expiration_date date NOT NULL,
    type character varying(10) NOT NULL,
    payout character varying(100) NOT NULL,
    available_days character varying(200) NOT NULL,
    auto_sup boolean,
    default_suppression_link text,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date,
    last_suppression_updated_date timestamp without time zone
);


ALTER TABLE affiliate.offers OWNER TO admin;

--
-- Name: seq_id_affiliate_networks; Type: SEQUENCE; Schema: affiliate; Owner: admin
--

CREATE SEQUENCE affiliate.seq_id_affiliate_networks
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affiliate.seq_id_affiliate_networks OWNER TO admin;

--
-- Name: seq_id_creatives; Type: SEQUENCE; Schema: affiliate; Owner: admin
--

CREATE SEQUENCE affiliate.seq_id_creatives
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affiliate.seq_id_creatives OWNER TO admin;

--
-- Name: seq_id_from_names; Type: SEQUENCE; Schema: affiliate; Owner: admin
--

CREATE SEQUENCE affiliate.seq_id_from_names
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affiliate.seq_id_from_names OWNER TO admin;

--
-- Name: seq_id_links; Type: SEQUENCE; Schema: affiliate; Owner: admin
--

CREATE SEQUENCE affiliate.seq_id_links
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affiliate.seq_id_links OWNER TO admin;

--
-- Name: seq_id_offers; Type: SEQUENCE; Schema: affiliate; Owner: admin
--

CREATE SEQUENCE affiliate.seq_id_offers
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affiliate.seq_id_offers OWNER TO admin;

--
-- Name: seq_id_subjects; Type: SEQUENCE; Schema: affiliate; Owner: admin
--

CREATE SEQUENCE affiliate.seq_id_subjects
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affiliate.seq_id_subjects OWNER TO admin;

--
-- Name: seq_id_suppressions; Type: SEQUENCE; Schema: affiliate; Owner: admin
--

CREATE SEQUENCE affiliate.seq_id_suppressions
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affiliate.seq_id_suppressions OWNER TO admin;

--
-- Name: seq_id_verticals; Type: SEQUENCE; Schema: affiliate; Owner: admin
--

CREATE SEQUENCE affiliate.seq_id_verticals
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE affiliate.seq_id_verticals OWNER TO admin;

--
-- Name: subjects; Type: TABLE; Schema: affiliate; Owner: admin
--

CREATE TABLE affiliate.subjects (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    affiliate_network_id integer NOT NULL,
    offer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    value text NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE affiliate.subjects OWNER TO admin;

--
-- Name: suppressions; Type: TABLE; Schema: affiliate; Owner: admin
--

CREATE TABLE affiliate.suppressions (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    affiliate_network_id integer NOT NULL,
    affiliate_network_name character varying(200) NOT NULL,
    offer_id integer NOT NULL,
    offer_name character varying(200) NOT NULL,
    lists_ids text NOT NULL,
    progress character varying(10) NOT NULL,
    emails_found integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE affiliate.suppressions OWNER TO admin;

--
-- Name: verticals; Type: TABLE; Schema: affiliate; Owner: admin
--

CREATE TABLE affiliate.verticals (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(200) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE affiliate.verticals OWNER TO admin;

--
-- Name: blacklists; Type: TABLE; Schema: lists; Owner: admin
--

CREATE TABLE lists.blacklists (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id integer,
    progress character varying(10) NOT NULL,
    emails_found integer,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone
);


ALTER TABLE lists.blacklists OWNER TO admin;

--
-- Name: data_lists; Type: TABLE; Schema: lists; Owner: admin
--

CREATE TABLE lists.data_lists (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    data_provider_id integer NOT NULL,
    data_provider_name character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    table_name character varying(100) NOT NULL,
    table_schema character varying(100) NOT NULL,
    isp_id integer NOT NULL,
    isp_name character varying(200) NOT NULL,
    total_count integer,
    encrypt_emails character varying(20) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE lists.data_lists OWNER TO admin;

--
-- Name: data_providers; Type: TABLE; Schema: lists; Owner: admin
--

CREATE TABLE lists.data_providers (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE lists.data_providers OWNER TO admin;

--
-- Name: seq_id_blacklists; Type: SEQUENCE; Schema: lists; Owner: admin
--

CREATE SEQUENCE lists.seq_id_blacklists
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lists.seq_id_blacklists OWNER TO admin;

--
-- Name: seq_id_data_lists; Type: SEQUENCE; Schema: lists; Owner: admin
--

CREATE SEQUENCE lists.seq_id_data_lists
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lists.seq_id_data_lists OWNER TO admin;

--
-- Name: seq_id_data_providers; Type: SEQUENCE; Schema: lists; Owner: admin
--

CREATE SEQUENCE lists.seq_id_data_providers
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lists.seq_id_data_providers OWNER TO admin;

--
-- Name: auto_responders; Type: TABLE; Schema: production; Owner: admin
--

CREATE TABLE production.auto_responders (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    status character varying(20) NOT NULL,
    type character varying(100) NOT NULL,
    server_id integer NOT NULL,
    server_name character varying(200) NOT NULL,
    component_id integer NOT NULL,
    component_name character varying(200) NOT NULL,
    affiliate_network_id integer,
    offer_id integer,
    clients_excluded text,
    on_open boolean,
    on_click boolean,
    on_unsub boolean,
    on_optout boolean,
    content text NOT NULL
);


ALTER TABLE production.auto_responders OWNER TO admin;

--
-- Name: headers; Type: TABLE; Schema: production; Owner: admin
--

CREATE TABLE production.headers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    header character varying(200) NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by date,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE production.headers OWNER TO admin;

--
-- Name: mta_processes; Type: TABLE; Schema: production; Owner: admin
--

CREATE TABLE production.mta_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    process_type character varying(100) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone,
    servers_ids text NOT NULL,
    user_id integer NOT NULL,
    total_emails integer,
    progress integer,
    affiliate_network_id integer,
    offer_id integer,
    isp_id integer,
    auto_responders_ids text,
    data_start integer,
    data_count integer,
    lists text,
    delivered integer,
    hard_bounced integer,
    soft_bounced integer,
    opens integer,
    clicks integer,
    leads integer,
    unsubs integer,
    negative_file_path text,
    content text NOT NULL
);


ALTER TABLE production.mta_processes OWNER TO admin;

--
-- Name: mta_processes_ips; Type: TABLE; Schema: production; Owner: admin
--

CREATE TABLE production.mta_processes_ips (
    id integer NOT NULL,
    process_id integer NOT NULL,
    server_vmta_id integer NOT NULL,
    sent_total integer,
    delivered integer,
    hard_bounced integer,
    soft_bounced integer,
    opens integer,
    clicks integer,
    leads integer,
    unsubs integer
);


ALTER TABLE production.mta_processes_ips OWNER TO admin;

--
-- Name: seq_id_auto_responders; Type: SEQUENCE; Schema: production; Owner: admin
--

CREATE SEQUENCE production.seq_id_auto_responders
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production.seq_id_auto_responders OWNER TO admin;

--
-- Name: seq_id_mta_processes; Type: SEQUENCE; Schema: production; Owner: admin
--

CREATE SEQUENCE production.seq_id_mta_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production.seq_id_mta_processes OWNER TO admin;

--
-- Name: seq_id_mta_processes_ips; Type: SEQUENCE; Schema: production; Owner: admin
--

CREATE SEQUENCE production.seq_id_mta_processes_ips
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production.seq_id_mta_processes_ips OWNER TO admin;

--
-- Name: seq_id_smtp_processes; Type: SEQUENCE; Schema: production; Owner: admin
--

CREATE SEQUENCE production.seq_id_smtp_processes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production.seq_id_smtp_processes OWNER TO admin;

--
-- Name: seq_id_smtp_processes_users; Type: SEQUENCE; Schema: production; Owner: admin
--

CREATE SEQUENCE production.seq_id_smtp_processes_users
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production.seq_id_smtp_processes_users OWNER TO admin;

--
-- Name: seq_id_teams; Type: SEQUENCE; Schema: production; Owner: admin
--

CREATE SEQUENCE production.seq_id_teams
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production.seq_id_teams OWNER TO admin;

--
-- Name: seq_id_teams_authorisations; Type: SEQUENCE; Schema: production; Owner: admin
--

CREATE SEQUENCE production.seq_id_teams_authorisations
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production.seq_id_teams_authorisations OWNER TO admin;

--
-- Name: smtp_processes; Type: TABLE; Schema: production; Owner: admin
--

CREATE TABLE production.smtp_processes (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    process_id character varying(20),
    process_type character varying(100) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone,
    servers_ids text NOT NULL,
    user_id integer NOT NULL,
    total_emails integer,
    progress integer,
    affiliate_network_id integer,
    offer_id integer,
    isp_id integer,
    auto_responders_ids text,
    data_start integer,
    data_count integer,
    lists text,
    delivered integer,
    hard_bounced integer,
    soft_bounced integer,
    opens integer,
    clicks integer,
    leads integer,
    unsubs integer,
    negative_file_path text,
    content text NOT NULL
);


ALTER TABLE production.smtp_processes OWNER TO admin;

--
-- Name: smtp_processes_users; Type: TABLE; Schema: production; Owner: admin
--

CREATE TABLE production.smtp_processes_users (
    id integer NOT NULL,
    process_id integer NOT NULL,
    smtp_user_id integer NOT NULL,
    sent_total integer,
    delivered integer,
    hard_bounced integer,
    soft_bounced integer,
    opens integer,
    clicks integer,
    leads integer,
    unsubs integer
);


ALTER TABLE production.smtp_processes_users OWNER TO admin;

--
-- Name: teams; Type: TABLE; Schema: production; Owner: admin
--

CREATE TABLE production.teams (
    id integer NOT NULL,
    status character varying(20) NOT NULL,
    name character varying(200) NOT NULL,
    isps_ids text NOT NULL,
    team_leaders_ids text NOT NULL,
    team_leaders_count integer NOT NULL,
    team_members_ids text NOT NULL,
    team_members_count integer NOT NULL,
    created_by character varying(200) NOT NULL,
    last_updated_by character varying(200) DEFAULT NULL::character varying,
    created_date date NOT NULL,
    last_updated_date date
);


ALTER TABLE production.teams OWNER TO admin;

--
-- Name: teams_authorisations; Type: TABLE; Schema: production; Owner: admin
--

CREATE TABLE production.teams_authorisations (
    id integer NOT NULL,
    team_id integer NOT NULL,
    team_member_id integer,
    vmtas_ids text,
    smtp_servers_ids text,
    offers_ids text,
    data_lists_ids text NOT NULL
);


ALTER TABLE production.teams_authorisations OWNER TO admin;

--
-- Data for Name: clicks; Type: TABLE DATA; Schema: actions; Owner: admin
--



--
-- Data for Name: leads; Type: TABLE DATA; Schema: actions; Owner: admin
--



--
-- Data for Name: opens; Type: TABLE DATA; Schema: actions; Owner: admin
--



--
-- Data for Name: optouts; Type: TABLE DATA; Schema: actions; Owner: admin
--



--
-- Name: seq_id_clicks; Type: SEQUENCE SET; Schema: actions; Owner: admin
--

SELECT pg_catalog.setval('actions.seq_id_clicks', 1, false);


--
-- Name: seq_id_leads; Type: SEQUENCE SET; Schema: actions; Owner: admin
--

SELECT pg_catalog.setval('actions.seq_id_leads', 3196, true);


--
-- Name: seq_id_opens; Type: SEQUENCE SET; Schema: actions; Owner: admin
--

SELECT pg_catalog.setval('actions.seq_id_opens', 1, false);


--
-- Name: seq_id_optouts; Type: SEQUENCE SET; Schema: actions; Owner: admin
--

SELECT pg_catalog.setval('actions.seq_id_optouts', 1, false);


--
-- Name: seq_id_unsubscribes; Type: SEQUENCE SET; Schema: actions; Owner: admin
--

SELECT pg_catalog.setval('actions.seq_id_unsubscribes', 1, false);


--
-- Data for Name: unsubscribes; Type: TABLE DATA; Schema: actions; Owner: admin
--



--
-- Data for Name: atlantic_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: atlantic_instances; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: atlantic_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: admin; Owner: admin
--

INSERT INTO admin.audit_logs VALUES (1, 'IResponse Admin', 2, 'Mehdi M', 'User', 'Insert', '2020-08-22 01:36:31');
INSERT INTO admin.audit_logs VALUES (2, 'Mehdi M', 2, 'adginex1', 'AffiliateNetwork', 'Insert', '2020-08-22 03:49:51');
INSERT INTO admin.audit_logs VALUES (3, 'Mehdi M', 2, 'cx3', 'AffiliateNetwork', 'Update', '2020-08-22 04:05:33');
INSERT INTO admin.audit_logs VALUES (4, 'Mehdi M', 2, 'cx3', 'AffiliateNetwork', 'Delete', '2020-08-22 04:14:20');
INSERT INTO admin.audit_logs VALUES (5, 'Mehdi M', 3, 'traxstax', 'AffiliateNetwork', 'Insert', '2020-08-22 04:20:10');
INSERT INTO admin.audit_logs VALUES (6, 'Mehdi M', 4, 'smartadv', 'AffiliateNetwork', 'Insert', '2020-08-22 04:30:27');


--
-- Data for Name: aws_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: aws_accounts_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: aws_instances; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: aws_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: digital_ocean_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: digital_ocean_droplets; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: digital_ocean_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: domains; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: godaddy_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: hetzner_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: hetzner_instances; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: hetzner_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: isps; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: linode_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: linode_instances; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: linode_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: mailboxes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: management_servers; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: mta_servers; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: namecheap_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: namecom_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: permissions; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: pmta_commands_history; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: pmta_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: proxy_servers; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: roles; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: scaleway_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: scaleway_instances; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: scaleway_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Name: seq_id_atlantic_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_atlantic_accounts', 1, false);


--
-- Name: seq_id_atlantic_instances; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_atlantic_instances', 1, false);


--
-- Name: seq_id_atlantic_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_atlantic_processes', 1, false);


--
-- Name: seq_id_audit_logs; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_audit_logs', 6, true);


--
-- Name: seq_id_aws_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_aws_accounts', 1, false);


--
-- Name: seq_id_aws_accounts_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_aws_accounts_processes', 1, false);


--
-- Name: seq_id_aws_instances; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_aws_instances', 1, false);


--
-- Name: seq_id_aws_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_aws_processes', 1, false);


--
-- Name: seq_id_digital_ocean_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_digital_ocean_accounts', 1, false);


--
-- Name: seq_id_digital_ocean_droplets; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_digital_ocean_droplets', 1, false);


--
-- Name: seq_id_digital_ocean_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_digital_ocean_processes', 1, false);


--
-- Name: seq_id_domains; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_domains', 1, false);


--
-- Name: seq_id_godaddy_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_godaddy_accounts', 1, false);


--
-- Name: seq_id_hetzner_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_hetzner_accounts', 1, false);


--
-- Name: seq_id_hetzner_instances; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_hetzner_instances', 1, false);


--
-- Name: seq_id_hetzner_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_hetzner_processes', 1, false);


--
-- Name: seq_id_isps; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_isps', 1, false);


--
-- Name: seq_id_linode_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_linode_accounts', 1, false);


--
-- Name: seq_id_linode_instances; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_linode_instances', 1, false);


--
-- Name: seq_id_linode_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_linode_processes', 1, false);


--
-- Name: seq_id_mailboxes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_mailboxes', 1, false);


--
-- Name: seq_id_management_servers; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_management_servers', 1, false);


--
-- Name: seq_id_mta_servers; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_mta_servers', 1, false);


--
-- Name: seq_id_namecheap_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_namecheap_accounts', 1, false);


--
-- Name: seq_id_namecom_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_namecom_accounts', 1, false);


--
-- Name: seq_id_permissions; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_permissions', 1, false);


--
-- Name: seq_id_pmta_commands_history; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_pmta_commands_history', 1, false);


--
-- Name: seq_id_pmta_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_pmta_processes', 1, false);


--
-- Name: seq_id_proxy_servers; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_proxy_servers', 1, false);


--
-- Name: seq_id_roles; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_roles', 1, false);


--
-- Name: seq_id_scaleway_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_scaleway_accounts', 1, false);


--
-- Name: seq_id_scaleway_instances; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_scaleway_instances', 1, false);


--
-- Name: seq_id_scaleway_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_scaleway_processes', 1, false);


--
-- Name: seq_id_servers_providers; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_servers_providers', 1, false);


--
-- Name: seq_id_servers_vmtas; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_servers_vmtas', 1, false);


--
-- Name: seq_id_smtp_servers; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_smtp_servers', 1, false);


--
-- Name: seq_id_smtp_users; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_smtp_users', 1, false);


--
-- Name: seq_id_subdomain_names; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_subdomain_names', 1, false);


--
-- Name: seq_id_users; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_users', 2, true);


--
-- Name: seq_id_users_roles; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_users_roles', 1, false);


--
-- Name: seq_id_vultr_accounts; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_vultr_accounts', 1, false);


--
-- Name: seq_id_vultr_instances; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_vultr_instances', 1, false);


--
-- Name: seq_id_vultr_processes; Type: SEQUENCE SET; Schema: admin; Owner: admin
--

SELECT pg_catalog.setval('admin.seq_id_vultr_processes', 1, false);


--
-- Data for Name: servers_providers; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: servers_vmtas; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: smtp_servers; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: smtp_users; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: subdomain_names; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: admin; Owner: admin
--

INSERT INTO admin.users VALUES (1, 1, 'Enabled', 'Activated', 'login', 'Admin', 'admin@app.com', '$2y$10$7i2AhfXC6bGi2r4r5nWAaudAUkdM59NI5.JP2l2/N2lrc7e16l0zq', NULL, 'admin@app.com', 'admin@app.com', '2022-10-01', '2022-10-01');

--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: vultr_accounts; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: vultr_instances; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: vultr_processes; Type: TABLE DATA; Schema: admin; Owner: admin
--



--
-- Data for Name: affiliate_networks; Type: TABLE DATA; Schema: affiliate; Owner: admin
--



--
-- Data for Name: creatives; Type: TABLE DATA; Schema: affiliate; Owner: admin
--


--
-- Data for Name: from_names; Type: TABLE DATA; Schema: affiliate; Owner: admin
--



--
-- Data for Name: links; Type: TABLE DATA; Schema: affiliate; Owner: admin
--



--
-- Name: seq_id_affiliate_networks; Type: SEQUENCE SET; Schema: affiliate; Owner: admin
--

SELECT pg_catalog.setval('affiliate.seq_id_affiliate_networks', 4, true);


--
-- Name: seq_id_creatives; Type: SEQUENCE SET; Schema: affiliate; Owner: admin
--

SELECT pg_catalog.setval('affiliate.seq_id_creatives', 654, true);


--
-- Name: seq_id_from_names; Type: SEQUENCE SET; Schema: affiliate; Owner: admin
--

SELECT pg_catalog.setval('affiliate.seq_id_from_names', 3413, true);


--
-- Name: seq_id_links; Type: SEQUENCE SET; Schema: affiliate; Owner: admin
--

SELECT pg_catalog.setval('affiliate.seq_id_links', 1343, true);


--
-- Name: seq_id_offers; Type: SEQUENCE SET; Schema: affiliate; Owner: admin
--

SELECT pg_catalog.setval('affiliate.seq_id_offers', 657, true);


--
-- Name: seq_id_subjects; Type: SEQUENCE SET; Schema: affiliate; Owner: admin
--

SELECT pg_catalog.setval('affiliate.seq_id_subjects', 10024, true);


--
-- Name: seq_id_suppressions; Type: SEQUENCE SET; Schema: affiliate; Owner: admin
--

SELECT pg_catalog.setval('affiliate.seq_id_suppressions', 1, false);


--
-- Name: seq_id_verticals; Type: SEQUENCE SET; Schema: affiliate; Owner: admin
--

SELECT pg_catalog.setval('affiliate.seq_id_verticals', 66, true);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: affiliate; Owner: admin
--



--
-- Data for Name: suppressions; Type: TABLE DATA; Schema: affiliate; Owner: admin
--



--
-- Data for Name: verticals; Type: TABLE DATA; Schema: affiliate; Owner: admin
--

INSERT INTO affiliate.verticals VALUES (6, 'Activated', 'Home Services', 'admin@admin.com', 'admin@admin.com', '2020-08-22', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (1, 'Activated', 'Consumer Goods', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (3, 'Activated', 'Credit Card', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (8, 'Activated', 'Psychic', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (7, 'Activated', 'Education', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (4, 'Activated', 'Home Services', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (5, 'Activated', 'Education', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (10, 'Activated', 'Beauty', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (11, 'Activated', 'Diet', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (9, 'Activated', 'Legal', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (14, 'Activated', 'Diet', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (13, 'Activated', 'Survey', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (12, 'Activated', 'Real Estate', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (15, 'Activated', 'Sub-Prime', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (17, 'Activated', 'Legal', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (19, 'Activated', 'Freebie', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (16, 'Activated', 'Consumer Goods', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (20, 'Activated', 'Payday', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (21, 'Activated', 'Payday', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (18, 'Activated', 'Male Enhancement', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (23, 'Activated', 'Payday', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (22, 'Activated', 'Loan', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (24, 'Activated', 'Loan', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (25, 'Activated', 'Loan', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (26, 'Activated', 'Consumer Goods', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (27, 'Activated', 'Health', 'admin@admin.com', 'admin@admin.com', '2020-10-01', '2020-10-01');
INSERT INTO affiliate.verticals VALUES (28, 'Activated', 'Wellness', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (2, 'Activated', 'Legal', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (29, 'Activated', 'Miscellaneous', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (30, 'Activated', 'Casino', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (32, 'Activated', 'Bingo', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (31, 'Activated', 'Auto', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (33, 'Activated', 'Gambling', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (34, 'Activated', 'Insurance', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (35, 'Activated', 'Pain Relief', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (36, 'Activated', 'Financial', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (38, 'Activated', 'Misc', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (39, 'Activated', 'DE - GERMANY', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (40, 'Activated', 'Crypto', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (42, 'Activated', 'TOP US OFFERS', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (43, 'Activated', 'Crypto', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (44, 'Activated', 'US Offers', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (46, 'Activated', 'CBD', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (37, 'Activated', 'Misc', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (47, 'Activated', 'AU/NZ - AUSTRALIA / NEW ZEALAND', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (48, 'Activated', 'US Offers', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (41, 'Activated', 'US Offers', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (45, 'Activated', 'US Offers', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (51, 'Activated', 'UK - UNITED KINGDOM', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (49, 'Activated', 'US Offers', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (52, 'Activated', 'TOP US OFFERS', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (50, 'Activated', 'FI - FINLAND', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (53, 'Activated', 'SMS', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (54, 'Activated', 'SE - SWEDEN', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (56, 'Activated', 'AT - AUSTRIA', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (55, 'Activated', 'CA - CANADA', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (57, 'Activated', 'Advertorials', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (58, 'Activated', 'FR - FRANCE', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (59, 'Activated', 'Shark Tank Nutra', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (60, 'Activated', 'NO - NORWAY', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (61, 'Activated', 'SURVEY', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (62, 'Activated', 'NL - NETHERLANDS', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (63, 'Activated', 'CPC offers', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (64, 'Activated', 'IT - ITALY', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (65, 'Activated', 'US Survey', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');
INSERT INTO affiliate.verticals VALUES (66, 'Activated', 'DK - DENMARK', 'admin@admin.com', 'admin@admin.com', '2022-10-01', '2022-10-01');


--
-- Data for Name: blacklists; Type: TABLE DATA; Schema: lists; Owner: admin
--



--
-- Data for Name: data_lists; Type: TABLE DATA; Schema: lists; Owner: admin
--



--
-- Data for Name: data_providers; Type: TABLE DATA; Schema: lists; Owner: admin
--



--
-- Name: seq_id_blacklists; Type: SEQUENCE SET; Schema: lists; Owner: admin
--

SELECT pg_catalog.setval('lists.seq_id_blacklists', 1, false);


--
-- Name: seq_id_data_lists; Type: SEQUENCE SET; Schema: lists; Owner: admin
--

SELECT pg_catalog.setval('lists.seq_id_data_lists', 1, false);


--
-- Name: seq_id_data_providers; Type: SEQUENCE SET; Schema: lists; Owner: admin
--

SELECT pg_catalog.setval('lists.seq_id_data_providers', 1, false);


--
-- Data for Name: auto_responders; Type: TABLE DATA; Schema: production; Owner: admin
--



--
-- Data for Name: headers; Type: TABLE DATA; Schema: production; Owner: admin
--



--
-- Data for Name: mta_processes; Type: TABLE DATA; Schema: production; Owner: admin
--



--
-- Data for Name: mta_processes_ips; Type: TABLE DATA; Schema: production; Owner: admin
--



--
-- Name: seq_id_auto_responders; Type: SEQUENCE SET; Schema: production; Owner: admin
--

SELECT pg_catalog.setval('production.seq_id_auto_responders', 1, false);


--
-- Name: seq_id_mta_processes; Type: SEQUENCE SET; Schema: production; Owner: admin
--

SELECT pg_catalog.setval('production.seq_id_mta_processes', 1, false);


--
-- Name: seq_id_mta_processes_ips; Type: SEQUENCE SET; Schema: production; Owner: admin
--

SELECT pg_catalog.setval('production.seq_id_mta_processes_ips', 1, false);


--
-- Name: seq_id_smtp_processes; Type: SEQUENCE SET; Schema: production; Owner: admin
--

SELECT pg_catalog.setval('production.seq_id_smtp_processes', 1, false);


--
-- Name: seq_id_smtp_processes_users; Type: SEQUENCE SET; Schema: production; Owner: admin
--

SELECT pg_catalog.setval('production.seq_id_smtp_processes_users', 1, false);


--
-- Name: seq_id_teams; Type: SEQUENCE SET; Schema: production; Owner: admin
--

SELECT pg_catalog.setval('production.seq_id_teams', 1, false);


--
-- Name: seq_id_teams_authorisations; Type: SEQUENCE SET; Schema: production; Owner: admin
--

SELECT pg_catalog.setval('production.seq_id_teams_authorisations', 1, false);


--
-- Data for Name: smtp_processes; Type: TABLE DATA; Schema: production; Owner: admin
--



--
-- Data for Name: smtp_processes_users; Type: TABLE DATA; Schema: production; Owner: admin
--



--
-- Data for Name: teams; Type: TABLE DATA; Schema: production; Owner: admin
--



--
-- Data for Name: teams_authorisations; Type: TABLE DATA; Schema: production; Owner: admin
--



--
-- Name: clicks c_pk_id_clicks; Type: CONSTRAINT; Schema: actions; Owner: admin
--

ALTER TABLE ONLY actions.clicks
    ADD CONSTRAINT c_pk_id_clicks PRIMARY KEY (id);


--
-- Name: leads c_pk_id_leads; Type: CONSTRAINT; Schema: actions; Owner: admin
--

ALTER TABLE ONLY actions.leads
    ADD CONSTRAINT c_pk_id_leads PRIMARY KEY (id);


--
-- Name: opens c_pk_id_opens; Type: CONSTRAINT; Schema: actions; Owner: admin
--

ALTER TABLE ONLY actions.opens
    ADD CONSTRAINT c_pk_id_opens PRIMARY KEY (id);


--
-- Name: optouts c_pk_id_optouts; Type: CONSTRAINT; Schema: actions; Owner: admin
--

ALTER TABLE ONLY actions.optouts
    ADD CONSTRAINT c_pk_id_optouts PRIMARY KEY (id);


--
-- Name: unsubscribes c_pk_id_unsubscribes; Type: CONSTRAINT; Schema: actions; Owner: admin
--

ALTER TABLE ONLY actions.unsubscribes
    ADD CONSTRAINT c_pk_id_unsubscribes PRIMARY KEY (id);


--
-- Name: atlantic_accounts c_pk_id_atlantic_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.atlantic_accounts
    ADD CONSTRAINT c_pk_id_atlantic_accounts PRIMARY KEY (id);


--
-- Name: atlantic_instances c_pk_id_atlantic_instances; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.atlantic_instances
    ADD CONSTRAINT c_pk_id_atlantic_instances PRIMARY KEY (id);


--
-- Name: atlantic_processes c_pk_id_atlantic_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.atlantic_processes
    ADD CONSTRAINT c_pk_id_atlantic_processes PRIMARY KEY (id);


--
-- Name: audit_logs c_pk_id_audit_logs; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.audit_logs
    ADD CONSTRAINT c_pk_id_audit_logs PRIMARY KEY (id);


--
-- Name: aws_accounts c_pk_id_aws_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.aws_accounts
    ADD CONSTRAINT c_pk_id_aws_accounts PRIMARY KEY (id);


--
-- Name: aws_accounts_processes c_pk_id_aws_accounts_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.aws_accounts_processes
    ADD CONSTRAINT c_pk_id_aws_accounts_processes PRIMARY KEY (id);


--
-- Name: aws_instances c_pk_id_aws_instances; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.aws_instances
    ADD CONSTRAINT c_pk_id_aws_instances PRIMARY KEY (id);


--
-- Name: aws_processes c_pk_id_aws_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.aws_processes
    ADD CONSTRAINT c_pk_id_aws_processes PRIMARY KEY (id);


--
-- Name: digital_ocean_accounts c_pk_id_digital_ocean_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.digital_ocean_accounts
    ADD CONSTRAINT c_pk_id_digital_ocean_accounts PRIMARY KEY (id);


--
-- Name: digital_ocean_droplets c_pk_id_digital_ocean_instances; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.digital_ocean_droplets
    ADD CONSTRAINT c_pk_id_digital_ocean_instances PRIMARY KEY (id);


--
-- Name: digital_ocean_processes c_pk_id_digital_ocean_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.digital_ocean_processes
    ADD CONSTRAINT c_pk_id_digital_ocean_processes PRIMARY KEY (id);


--
-- Name: domains c_pk_id_domains; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.domains
    ADD CONSTRAINT c_pk_id_domains PRIMARY KEY (id);


--
-- Name: godaddy_accounts c_pk_id_godaddy_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.godaddy_accounts
    ADD CONSTRAINT c_pk_id_godaddy_accounts PRIMARY KEY (id);


--
-- Name: hetzner_accounts c_pk_id_hetzner_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.hetzner_accounts
    ADD CONSTRAINT c_pk_id_hetzner_accounts PRIMARY KEY (id);


--
-- Name: hetzner_instances c_pk_id_hetzner_instances; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.hetzner_instances
    ADD CONSTRAINT c_pk_id_hetzner_instances PRIMARY KEY (id);


--
-- Name: hetzner_processes c_pk_id_hetzner_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.hetzner_processes
    ADD CONSTRAINT c_pk_id_hetzner_processes PRIMARY KEY (id);


--
-- Name: isps c_pk_id_isps; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.isps
    ADD CONSTRAINT c_pk_id_isps PRIMARY KEY (id);


--
-- Name: linode_accounts c_pk_id_linode_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.linode_accounts
    ADD CONSTRAINT c_pk_id_linode_accounts PRIMARY KEY (id);


--
-- Name: linode_instances c_pk_id_linode_instances; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.linode_instances
    ADD CONSTRAINT c_pk_id_linode_instances PRIMARY KEY (id);


--
-- Name: linode_processes c_pk_id_linode_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.linode_processes
    ADD CONSTRAINT c_pk_id_linode_processes PRIMARY KEY (id);


--
-- Name: mailboxes c_pk_id_mailboxes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.mailboxes
    ADD CONSTRAINT c_pk_id_mailboxes PRIMARY KEY (id);


--
-- Name: management_servers c_pk_id_management_servers; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.management_servers
    ADD CONSTRAINT c_pk_id_management_servers PRIMARY KEY (id);


--
-- Name: mta_servers c_pk_id_mta_servers; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.mta_servers
    ADD CONSTRAINT c_pk_id_mta_servers PRIMARY KEY (id);


--
-- Name: namecheap_accounts c_pk_id_namecheap_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.namecheap_accounts
    ADD CONSTRAINT c_pk_id_namecheap_accounts PRIMARY KEY (id);


--
-- Name: namecom_accounts c_pk_id_namecom_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.namecom_accounts
    ADD CONSTRAINT c_pk_id_namecom_accounts PRIMARY KEY (id);


--
-- Name: permissions c_pk_id_permissions; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.permissions
    ADD CONSTRAINT c_pk_id_permissions PRIMARY KEY (id);


--
-- Name: pmta_commands_history c_pk_id_pmta_commands_history; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.pmta_commands_history
    ADD CONSTRAINT c_pk_id_pmta_commands_history PRIMARY KEY (id);


--
-- Name: pmta_processes c_pk_id_pmta_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.pmta_processes
    ADD CONSTRAINT c_pk_id_pmta_processes PRIMARY KEY (id);


--
-- Name: proxy_servers c_pk_id_proxy_servers; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.proxy_servers
    ADD CONSTRAINT c_pk_id_proxy_servers PRIMARY KEY (id);


--
-- Name: roles c_pk_id_roles; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.roles
    ADD CONSTRAINT c_pk_id_roles PRIMARY KEY (id);


--
-- Name: scaleway_accounts c_pk_id_scaleway_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.scaleway_accounts
    ADD CONSTRAINT c_pk_id_scaleway_accounts PRIMARY KEY (id);


--
-- Name: scaleway_instances c_pk_id_scaleway_instances; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.scaleway_instances
    ADD CONSTRAINT c_pk_id_scaleway_instances PRIMARY KEY (id);


--
-- Name: scaleway_processes c_pk_id_scaleway_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.scaleway_processes
    ADD CONSTRAINT c_pk_id_scaleway_processes PRIMARY KEY (id);


--
-- Name: servers_providers c_pk_id_servers_providers; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.servers_providers
    ADD CONSTRAINT c_pk_id_servers_providers PRIMARY KEY (id);


--
-- Name: servers_vmtas c_pk_id_servers_vmtas; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.servers_vmtas
    ADD CONSTRAINT c_pk_id_servers_vmtas PRIMARY KEY (id);


--
-- Name: smtp_servers c_pk_id_smtp_servers; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.smtp_servers
    ADD CONSTRAINT c_pk_id_smtp_servers PRIMARY KEY (id);


--
-- Name: smtp_users c_pk_id_smtp_users; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.smtp_users
    ADD CONSTRAINT c_pk_id_smtp_users PRIMARY KEY (id);


--
-- Name: subdomain_names c_pk_id_subdomain_names; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.subdomain_names
    ADD CONSTRAINT c_pk_id_subdomain_names PRIMARY KEY (id);


--
-- Name: users c_pk_id_users; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.users
    ADD CONSTRAINT c_pk_id_users PRIMARY KEY (id);


--
-- Name: users_roles c_pk_id_users_roles; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.users_roles
    ADD CONSTRAINT c_pk_id_users_roles PRIMARY KEY (id);


--
-- Name: vultr_accounts c_pk_id_vultr_accounts; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.vultr_accounts
    ADD CONSTRAINT c_pk_id_vultr_accounts PRIMARY KEY (id);


--
-- Name: vultr_instances c_pk_id_vultr_instances; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.vultr_instances
    ADD CONSTRAINT c_pk_id_vultr_instances PRIMARY KEY (id);


--
-- Name: vultr_processes c_pk_id_vultr_processes; Type: CONSTRAINT; Schema: admin; Owner: admin
--

ALTER TABLE ONLY admin.vultr_processes
    ADD CONSTRAINT c_pk_id_vultr_processes PRIMARY KEY (id);


--
-- Name: affiliate_networks c_pk_id_affiliate_networks; Type: CONSTRAINT; Schema: affiliate; Owner: admin
--

ALTER TABLE ONLY affiliate.affiliate_networks
    ADD CONSTRAINT c_pk_id_affiliate_networks PRIMARY KEY (id);


--
-- Name: creatives c_pk_id_creatives; Type: CONSTRAINT; Schema: affiliate; Owner: admin
--

ALTER TABLE ONLY affiliate.creatives
    ADD CONSTRAINT c_pk_id_creatives PRIMARY KEY (id);


--
-- Name: from_names c_pk_id_from_names; Type: CONSTRAINT; Schema: affiliate; Owner: admin
--

ALTER TABLE ONLY affiliate.from_names
    ADD CONSTRAINT c_pk_id_from_names PRIMARY KEY (id);


--
-- Name: links c_pk_id_links; Type: CONSTRAINT; Schema: affiliate; Owner: admin
--

ALTER TABLE ONLY affiliate.links
    ADD CONSTRAINT c_pk_id_links PRIMARY KEY (id);


--
-- Name: offers c_pk_id_offers; Type: CONSTRAINT; Schema: affiliate; Owner: admin
--

ALTER TABLE ONLY affiliate.offers
    ADD CONSTRAINT c_pk_id_offers PRIMARY KEY (id);


--
-- Name: subjects c_pk_id_subjects; Type: CONSTRAINT; Schema: affiliate; Owner: admin
--

ALTER TABLE ONLY affiliate.subjects
    ADD CONSTRAINT c_pk_id_subjects PRIMARY KEY (id);


--
-- Name: suppressions c_pk_id_suppressions; Type: CONSTRAINT; Schema: affiliate; Owner: admin
--

ALTER TABLE ONLY affiliate.suppressions
    ADD CONSTRAINT c_pk_id_suppressions PRIMARY KEY (id);


--
-- Name: verticals c_pk_id_verticals; Type: CONSTRAINT; Schema: affiliate; Owner: admin
--

ALTER TABLE ONLY affiliate.verticals
    ADD CONSTRAINT c_pk_id_verticals PRIMARY KEY (id);


--
-- Name: blacklists c_pk_id_blacklists; Type: CONSTRAINT; Schema: lists; Owner: admin
--

ALTER TABLE ONLY lists.blacklists
    ADD CONSTRAINT c_pk_id_blacklists PRIMARY KEY (id);


--
-- Name: data_lists c_pk_id_data_lists; Type: CONSTRAINT; Schema: lists; Owner: admin
--

ALTER TABLE ONLY lists.data_lists
    ADD CONSTRAINT c_pk_id_data_lists PRIMARY KEY (id);


--
-- Name: data_providers c_pk_id_data_providers; Type: CONSTRAINT; Schema: lists; Owner: admin
--

ALTER TABLE ONLY lists.data_providers
    ADD CONSTRAINT c_pk_id_data_providers PRIMARY KEY (id);


--
-- Name: auto_responders c_pk_id_auto_responders; Type: CONSTRAINT; Schema: production; Owner: admin
--

ALTER TABLE ONLY production.auto_responders
    ADD CONSTRAINT c_pk_id_auto_responders PRIMARY KEY (id);


--
-- Name: mta_processes c_pk_id_mta_processes; Type: CONSTRAINT; Schema: production; Owner: admin
--

ALTER TABLE ONLY production.mta_processes
    ADD CONSTRAINT c_pk_id_mta_processes PRIMARY KEY (id);


--
-- Name: mta_processes_ips c_pk_id_mta_processes_ips; Type: CONSTRAINT; Schema: production; Owner: admin
--

ALTER TABLE ONLY production.mta_processes_ips
    ADD CONSTRAINT c_pk_id_mta_processes_ips PRIMARY KEY (id);


--
-- Name: smtp_processes c_pk_id_smtp_processes; Type: CONSTRAINT; Schema: production; Owner: admin
--

ALTER TABLE ONLY production.smtp_processes
    ADD CONSTRAINT c_pk_id_smtp_processes PRIMARY KEY (id);


--
-- Name: smtp_processes_users c_pk_id_smtp_processes_users; Type: CONSTRAINT; Schema: production; Owner: admin
--

ALTER TABLE ONLY production.smtp_processes_users
    ADD CONSTRAINT c_pk_id_smtp_processes_users PRIMARY KEY (id);


--
-- Name: teams c_pk_id_teams; Type: CONSTRAINT; Schema: production; Owner: admin
--

ALTER TABLE ONLY production.teams
    ADD CONSTRAINT c_pk_id_teams PRIMARY KEY (id);


--
-- Name: teams_authorisations c_pk_id_teams_authorisations; Type: CONSTRAINT; Schema: production; Owner: admin
--

ALTER TABLE ONLY production.teams_authorisations
    ADD CONSTRAINT c_pk_id_teams_authorisations PRIMARY KEY (id);


--
-- Name: headers headers_pkey; Type: CONSTRAINT; Schema: production; Owner: admin
--

ALTER TABLE ONLY production.headers
    ADD CONSTRAINT headers_pkey PRIMARY KEY (id);


--
-- Name: actions_clicks_idx; Type: INDEX; Schema: actions; Owner: admin
--

CREATE INDEX actions_clicks_idx ON actions.clicks USING btree (id, process_id, process_type, user_production_id, user_full_name, vmta_id, smtp_user_id, affiliate_network_id, offer_production_id, list_id, client_id);


--
-- Name: actions_leads_idx; Type: INDEX; Schema: actions; Owner: admin
--

CREATE INDEX actions_leads_idx ON actions.leads USING btree (id, process_id, process_type, user_production_id, user_full_name, vmta_id, smtp_user_id, affiliate_network_id, offer_production_id, list_id, client_id);


--
-- Name: actions_opens_idx; Type: INDEX; Schema: actions; Owner: admin
--

CREATE INDEX actions_opens_idx ON actions.opens USING btree (id, process_id, process_type, user_production_id, user_full_name, vmta_id, smtp_user_id, affiliate_network_id, offer_production_id, list_id, client_id);


--
-- Name: actions_optouts_idx; Type: INDEX; Schema: actions; Owner: admin
--

CREATE INDEX actions_optouts_idx ON actions.optouts USING btree (id, process_id, process_type, user_production_id, user_full_name, vmta_id, smtp_user_id, affiliate_network_id, offer_production_id, list_id, client_id);


--
-- Name: actions_unsubscribes_idx; Type: INDEX; Schema: actions; Owner: admin
--

CREATE INDEX actions_unsubscribes_idx ON actions.unsubscribes USING btree (id, process_id, process_type, user_production_id, user_full_name, vmta_id, smtp_user_id, affiliate_network_id, offer_production_id, list_id, client_id);


--
-- Name: admin_atlantic_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_atlantic_accounts_idx ON admin.atlantic_accounts USING btree (id, status);

ALTER TABLE admin.atlantic_accounts CLUSTER ON admin_atlantic_accounts_idx;


--
-- Name: admin_atlantic_instances_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_atlantic_instances_idx ON admin.atlantic_instances USING btree (id, status, name, instance_id, account_id, mta_server_id);

ALTER TABLE admin.atlantic_instances CLUSTER ON admin_atlantic_instances_idx;


--
-- Name: admin_atlantic_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_atlantic_processes_idx ON admin.atlantic_processes USING btree (id, status, process_id, account_id);


--
-- Name: admin_audit_logs_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_audit_logs_idx ON admin.audit_logs USING btree (id, action_by);

ALTER TABLE admin.audit_logs CLUSTER ON admin_audit_logs_idx;


--
-- Name: admin_aws_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_aws_accounts_idx ON admin.aws_accounts USING btree (id, status);

ALTER TABLE admin.aws_accounts CLUSTER ON admin_aws_accounts_idx;


--
-- Name: admin_aws_accounts_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_aws_accounts_processes_idx ON admin.aws_accounts_processes USING btree (id, status, process_id, account_id);


--
-- Name: admin_aws_instances_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_aws_instances_idx ON admin.aws_instances USING btree (id, status, name, account_id, mta_server_id);

ALTER TABLE admin.aws_instances CLUSTER ON admin_aws_instances_idx;


--
-- Name: admin_aws_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_aws_processes_idx ON admin.aws_processes USING btree (id, status, process_id, account_id);


--
-- Name: admin_digital_ocean_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_digital_ocean_accounts_idx ON admin.digital_ocean_accounts USING btree (id, status);

ALTER TABLE admin.digital_ocean_accounts CLUSTER ON admin_digital_ocean_accounts_idx;


--
-- Name: admin_digital_ocean_instances_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_digital_ocean_instances_idx ON admin.digital_ocean_droplets USING btree (id, status, name, account_id, mta_server_id);

ALTER TABLE admin.digital_ocean_droplets CLUSTER ON admin_digital_ocean_instances_idx;


--
-- Name: admin_digital_ocean_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_digital_ocean_processes_idx ON admin.digital_ocean_processes USING btree (id, status, process_id, account_id);


--
-- Name: admin_domains_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_domains_idx ON admin.domains USING btree (id, account_id, status);

ALTER TABLE admin.domains CLUSTER ON admin_domains_idx;


--
-- Name: admin_godaddy_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_godaddy_accounts_idx ON admin.godaddy_accounts USING btree (id, status);

ALTER TABLE admin.godaddy_accounts CLUSTER ON admin_godaddy_accounts_idx;


--
-- Name: admin_hetzner_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_hetzner_accounts_idx ON admin.hetzner_accounts USING btree (id, status);

ALTER TABLE admin.hetzner_accounts CLUSTER ON admin_hetzner_accounts_idx;


--
-- Name: admin_hetzner_instances_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_hetzner_instances_idx ON admin.hetzner_instances USING btree (id, status, name, instance_id, account_id, mta_server_id);

ALTER TABLE admin.hetzner_instances CLUSTER ON admin_hetzner_instances_idx;


--
-- Name: admin_hetzner_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_hetzner_processes_idx ON admin.hetzner_processes USING btree (id, status, process_id, account_id);


--
-- Name: admin_isps_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_isps_idx ON admin.isps USING btree (id, status);

ALTER TABLE admin.isps CLUSTER ON admin_isps_idx;


--
-- Name: admin_linode_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_linode_accounts_idx ON admin.linode_accounts USING btree (id, status);

ALTER TABLE admin.linode_accounts CLUSTER ON admin_linode_accounts_idx;


--
-- Name: admin_linode_instances_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_linode_instances_idx ON admin.linode_instances USING btree (id, status, name, instance_id, account_id, mta_server_id);

ALTER TABLE admin.linode_instances CLUSTER ON admin_linode_instances_idx;


--
-- Name: admin_linode_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_linode_processes_idx ON admin.linode_processes USING btree (id, status, process_id, account_id);


--
-- Name: admin_mailboxes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_mailboxes_idx ON admin.mailboxes USING btree (id, status, account_id, domain_id);

ALTER TABLE admin.mailboxes CLUSTER ON admin_mailboxes_idx;


--
-- Name: admin_management_servers_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_management_servers_idx ON admin.management_servers USING btree (id, provider_id, status);

ALTER TABLE admin.management_servers CLUSTER ON admin_management_servers_idx;


--
-- Name: admin_mta_servers_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_mta_servers_idx ON admin.mta_servers USING btree (id, provider_id, status);

ALTER TABLE admin.mta_servers CLUSTER ON admin_mta_servers_idx;


--
-- Name: admin_namecheap_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_namecheap_accounts_idx ON admin.namecheap_accounts USING btree (id, status);

ALTER TABLE admin.namecheap_accounts CLUSTER ON admin_namecheap_accounts_idx;


--
-- Name: admin_namecom_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_namecom_accounts_idx ON admin.namecom_accounts USING btree (id, status);

ALTER TABLE admin.namecom_accounts CLUSTER ON admin_namecom_accounts_idx;


--
-- Name: admin_permissions_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_permissions_idx ON admin.permissions USING btree (id, role_id);

ALTER TABLE admin.permissions CLUSTER ON admin_permissions_idx;


--
-- Name: admin_pmta_commands_history_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_pmta_commands_history_idx ON admin.pmta_commands_history USING btree (id, server_id, user_id);

ALTER TABLE admin.pmta_commands_history CLUSTER ON admin_pmta_commands_history_idx;


--
-- Name: admin_pmta_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_pmta_processes_idx ON admin.pmta_processes USING btree (id, provider_id, server_id, server_name, user_full_name, pause_wait, resume_wait);

ALTER TABLE admin.pmta_processes CLUSTER ON admin_pmta_processes_idx;


--
-- Name: admin_proxy_servers_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_proxy_servers_idx ON admin.proxy_servers USING btree (id, mta_server_id, status);

ALTER TABLE admin.proxy_servers CLUSTER ON admin_proxy_servers_idx;


--
-- Name: admin_roles_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_roles_idx ON admin.roles USING btree (id, status);

ALTER TABLE admin.roles CLUSTER ON admin_roles_idx;


--
-- Name: admin_scaleway_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_scaleway_accounts_idx ON admin.scaleway_accounts USING btree (id, status);

ALTER TABLE admin.scaleway_accounts CLUSTER ON admin_scaleway_accounts_idx;


--
-- Name: admin_scaleway_instances_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_scaleway_instances_idx ON admin.scaleway_instances USING btree (id, status, name, instance_id, account_id, mta_server_id);

ALTER TABLE admin.scaleway_instances CLUSTER ON admin_scaleway_instances_idx;


--
-- Name: admin_scaleway_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_scaleway_processes_idx ON admin.scaleway_processes USING btree (id, status, process_id, account_id);

ALTER TABLE admin.scaleway_processes CLUSTER ON admin_scaleway_processes_idx;


--
-- Name: admin_servers_providers_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_servers_providers_idx ON admin.servers_providers USING btree (id, status);

ALTER TABLE admin.servers_providers CLUSTER ON admin_servers_providers_idx;


--
-- Name: admin_servers_vmtas_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_servers_vmtas_idx ON admin.servers_vmtas USING btree (id, mta_server_id, isp_id, status);

ALTER TABLE admin.servers_vmtas CLUSTER ON admin_servers_vmtas_idx;


--
-- Name: admin_smtp_servers_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_smtp_servers_idx ON admin.smtp_servers USING btree (id, provider_id, status);

ALTER TABLE admin.smtp_servers CLUSTER ON admin_smtp_servers_idx;


--
-- Name: admin_smtp_users_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_smtp_users_idx ON admin.smtp_users USING btree (id, smtp_server_id, status);

ALTER TABLE admin.smtp_users CLUSTER ON admin_smtp_users_idx;


--
-- Name: admin_subdomain_names_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_subdomain_names_idx ON admin.subdomain_names USING btree (id);

ALTER TABLE admin.subdomain_names CLUSTER ON admin_subdomain_names_idx;


--
-- Name: admin_users_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_users_idx ON admin.users USING btree (id, production_id, status);

ALTER TABLE admin.users CLUSTER ON admin_users_idx;


--
-- Name: admin_users_roles_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_users_roles_idx ON admin.users_roles USING btree (id, user_id, role_id);

ALTER TABLE admin.users_roles CLUSTER ON admin_users_roles_idx;


--
-- Name: admin_vultr_accounts_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_vultr_accounts_idx ON admin.vultr_accounts USING btree (id, status);

ALTER TABLE admin.vultr_accounts CLUSTER ON admin_vultr_accounts_idx;


--
-- Name: admin_vultr_instances_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_vultr_instances_idx ON admin.vultr_instances USING btree (id, status, name, instance_id, account_id, mta_server_id);

ALTER TABLE admin.vultr_instances CLUSTER ON admin_vultr_instances_idx;


--
-- Name: admin_vultr_processes_idx; Type: INDEX; Schema: admin; Owner: admin
--

CREATE INDEX admin_vultr_processes_idx ON admin.vultr_processes USING btree (id, status, process_id, account_id);

ALTER TABLE admin.vultr_processes CLUSTER ON admin_vultr_processes_idx;


--
-- Name: affiliate_affiliate_networks_idx; Type: INDEX; Schema: affiliate; Owner: admin
--

CREATE INDEX affiliate_affiliate_networks_idx ON affiliate.affiliate_networks USING btree (id, status, affiliate_id);

ALTER TABLE affiliate.affiliate_networks CLUSTER ON affiliate_affiliate_networks_idx;


--
-- Name: affiliate_creatives_idx; Type: INDEX; Schema: affiliate; Owner: admin
--

CREATE INDEX affiliate_creatives_idx ON affiliate.creatives USING btree (id, status, affiliate_network_id, offer_id);

ALTER TABLE affiliate.creatives CLUSTER ON affiliate_creatives_idx;


--
-- Name: affiliate_from_names_idx; Type: INDEX; Schema: affiliate; Owner: admin
--

CREATE INDEX affiliate_from_names_idx ON affiliate.from_names USING btree (id, status, affiliate_network_id, offer_id);

ALTER TABLE affiliate.from_names CLUSTER ON affiliate_from_names_idx;


--
-- Name: affiliate_links_idx; Type: INDEX; Schema: affiliate; Owner: admin
--

CREATE INDEX affiliate_links_idx ON affiliate.links USING btree (id, status, affiliate_network_id, offer_id, creative_id);

ALTER TABLE affiliate.links CLUSTER ON affiliate_links_idx;


--
-- Name: affiliate_offers_idx; Type: INDEX; Schema: affiliate; Owner: admin
--

CREATE INDEX affiliate_offers_idx ON affiliate.offers USING btree (id, status, affiliate_network_id, production_id);


--
-- Name: affiliate_subjects_idx; Type: INDEX; Schema: affiliate; Owner: admin
--

CREATE INDEX affiliate_subjects_idx ON affiliate.subjects USING btree (id, status, affiliate_network_id, offer_id);

ALTER TABLE affiliate.subjects CLUSTER ON affiliate_subjects_idx;


--
-- Name: affiliate_suppressions_idx; Type: INDEX; Schema: affiliate; Owner: admin
--

CREATE INDEX affiliate_suppressions_idx ON affiliate.suppressions USING btree (id, status, process_id, affiliate_network_id, offer_id, lists_ids);


--
-- Name: affiliate_verticals_idx; Type: INDEX; Schema: affiliate; Owner: admin
--

CREATE INDEX affiliate_verticals_idx ON affiliate.verticals USING btree (id, status);

ALTER TABLE affiliate.verticals CLUSTER ON affiliate_verticals_idx;


--
-- Name: lists_blacklists_idx; Type: INDEX; Schema: lists; Owner: admin
--

CREATE INDEX lists_blacklists_idx ON lists.blacklists USING btree (id, status, process_id);

ALTER TABLE lists.blacklists CLUSTER ON lists_blacklists_idx;


--
-- Name: lists_data_lists_idx; Type: INDEX; Schema: lists; Owner: admin
--

CREATE INDEX lists_data_lists_idx ON lists.data_lists USING btree (id, status, data_provider_id, isp_id);

ALTER TABLE lists.data_lists CLUSTER ON lists_data_lists_idx;


--
-- Name: lists_data_providers_idx; Type: INDEX; Schema: lists; Owner: admin
--

CREATE INDEX lists_data_providers_idx ON lists.data_providers USING btree (id, status);

ALTER TABLE lists.data_providers CLUSTER ON lists_data_providers_idx;


--
-- Name: production_auto_responders_idx; Type: INDEX; Schema: production; Owner: admin
--

CREATE INDEX production_auto_responders_idx ON production.auto_responders USING btree (id, status, type);

ALTER TABLE production.auto_responders CLUSTER ON production_auto_responders_idx;


--
-- Name: production_mta_processes_idx; Type: INDEX; Schema: production; Owner: admin
--

CREATE INDEX production_mta_processes_idx ON production.mta_processes USING btree (id, status, process_type);

ALTER TABLE production.mta_processes CLUSTER ON production_mta_processes_idx;


--
-- Name: production_mta_processes_ips_idx; Type: INDEX; Schema: production; Owner: admin
--

CREATE INDEX production_mta_processes_ips_idx ON production.mta_processes_ips USING btree (id, process_id, server_vmta_id);

ALTER TABLE production.mta_processes_ips CLUSTER ON production_mta_processes_ips_idx;


--
-- Name: production_smtp_processes_idx; Type: INDEX; Schema: production; Owner: admin
--

CREATE INDEX production_smtp_processes_idx ON production.smtp_processes USING btree (id, status, process_type);

ALTER TABLE production.smtp_processes CLUSTER ON production_smtp_processes_idx;


--
-- Name: production_smtp_processes_users_idx; Type: INDEX; Schema: production; Owner: admin
--

CREATE INDEX production_smtp_processes_users_idx ON production.smtp_processes_users USING btree (id, process_id, smtp_user_id);

ALTER TABLE production.smtp_processes_users CLUSTER ON production_smtp_processes_users_idx;


--
-- Name: production_teams_authorisations_idx; Type: INDEX; Schema: production; Owner: admin
--

CREATE INDEX production_teams_authorisations_idx ON production.teams_authorisations USING btree (id, team_id, team_member_id);

ALTER TABLE production.teams_authorisations CLUSTER ON production_teams_authorisations_idx;


--
-- Name: production_teams_idx; Type: INDEX; Schema: production; Owner: admin
--

CREATE INDEX production_teams_idx ON production.teams USING btree (id, status);

ALTER TABLE production.teams CLUSTER ON production_teams_idx;


--
-- PostgreSQL database dump complete
--

