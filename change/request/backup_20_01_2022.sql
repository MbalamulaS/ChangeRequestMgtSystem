--
-- PostgreSQL database dump
--

-- Dumped from database version 10.17
-- Dumped by pg_dump version 10.17

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities (
    id bigint NOT NULL,
    activity_code character varying(255),
    activity_desc character varying(255),
    day integer,
    activity_remark character varying(255),
    start_date timestamp(0) without time zone,
    end_date timestamp(0) without time zone,
    approved_budget double precision,
    lead_agency character varying(255),
    responsible_person character varying(255),
    target_id integer,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.activities OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: activityprogress_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activityprogress_logs (
    id bigint NOT NULL,
    activityprogress_id integer NOT NULL,
    from_user_id integer NOT NULL,
    from_progress_level integer NOT NULL,
    to_progress_level integer NOT NULL,
    approved_status character varying(50),
    remark character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.activityprogress_logs OWNER TO postgres;

--
-- Name: activityprogress_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activityprogress_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activityprogress_logs_id_seq OWNER TO postgres;

--
-- Name: activityprogress_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activityprogress_logs_id_seq OWNED BY public.activityprogress_logs.id;


--
-- Name: activityprogresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activityprogresses (
    id bigint NOT NULL,
    activity_id integer NOT NULL,
    milestone_id integer NOT NULL,
    planned_target character varying(100),
    actual_target character varying(100),
    progress_level character varying(100),
    remark_level_0 text,
    remark_level_1 text,
    remark_level_2 text,
    remark_level_3 text,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.activityprogresses OWNER TO postgres;

--
-- Name: activityprogresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activityprogresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activityprogresses_id_seq OWNER TO postgres;

--
-- Name: activityprogresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activityprogresses_id_seq OWNED BY public.activityprogresses.id;


--
-- Name: contract_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract_progress (
    id bigint NOT NULL,
    contract_id integer,
    amount_disbursed double precision,
    remark character varying(255),
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    date_disbursed timestamp(0) without time zone
);


ALTER TABLE public.contract_progress OWNER TO postgres;

--
-- Name: contract_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contract_progress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_progress_id_seq OWNER TO postgres;

--
-- Name: contract_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contract_progress_id_seq OWNED BY public.contract_progress.id;


--
-- Name: contractattachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contractattachments (
    id integer NOT NULL,
    activity_id integer NOT NULL,
    title character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contractattachments OWNER TO postgres;

--
-- Name: contractattachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contractattachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractattachments_id_seq OWNER TO postgres;

--
-- Name: contractattachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contractattachments_id_seq OWNED BY public.contractattachments.id;


--
-- Name: contracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracts (
    id bigint NOT NULL,
    activity_id integer,
    contract_type character varying(255) NOT NULL,
    contract_title character varying(255),
    contract_amount double precision,
    advanced_payment double precision,
    signed_date timestamp(0) without time zone,
    commencement_date timestamp(0) without time zone,
    completion_date timestamp(0) without time zone,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.contracts OWNER TO postgres;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_id_seq OWNER TO postgres;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    activityprogress_id integer NOT NULL,
    title character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: funddisbursements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funddisbursements (
    id bigint NOT NULL,
    activity_id integer NOT NULL,
    milestone_id integer NOT NULL,
    fund_allocated double precision,
    fund_received double precision,
    fund_spent double precision,
    progress_status character varying(30),
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.funddisbursements OWNER TO postgres;

--
-- Name: funddisbursements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.funddisbursements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funddisbursements_id_seq OWNER TO postgres;

--
-- Name: funddisbursements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funddisbursements_id_seq OWNED BY public.funddisbursements.id;


--
-- Name: gfs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gfs (
    id bigint NOT NULL,
    gfs_code character varying(255) NOT NULL,
    gfs_desc character varying(255) NOT NULL,
    unit character varying(255) NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.gfs OWNER TO postgres;

--
-- Name: gfs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gfs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gfs_id_seq OWNER TO postgres;

--
-- Name: gfs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gfs_id_seq OWNED BY public.gfs.id;


--
-- Name: indicators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indicators (
    id bigint NOT NULL,
    activity_id integer NOT NULL,
    indicator text,
    indicator_desc text,
    target character varying(100),
    means_of_verification character varying(255),
    remarks text,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.indicators OWNER TO postgres;

--
-- Name: indicators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_id_seq OWNER TO postgres;

--
-- Name: indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indicators_id_seq OWNED BY public.indicators.id;


--
-- Name: institutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutions (
    id bigint NOT NULL,
    inst_name character varying(50) NOT NULL,
    vote_code integer,
    sub_vote_no integer,
    vote_name character varying(50),
    sub_vote_name character varying(50),
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.institutions OWNER TO postgres;

--
-- Name: institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institutions_id_seq OWNER TO postgres;

--
-- Name: institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institutions_id_seq OWNED BY public.institutions.id;


--
-- Name: maintasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintasks (
    id bigint NOT NULL,
    maintask_desc character varying(255) NOT NULL,
    activity_id integer NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.maintasks OWNER TO postgres;

--
-- Name: maintasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maintasks_id_seq OWNER TO postgres;

--
-- Name: maintasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintasks_id_seq OWNED BY public.maintasks.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: milestones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.milestones (
    id bigint NOT NULL,
    milestone_name character varying(100) NOT NULL,
    month character varying(100) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.milestones OWNER TO postgres;

--
-- Name: milestones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.milestones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milestones_id_seq OWNER TO postgres;

--
-- Name: milestones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.milestones_id_seq OWNED BY public.milestones.id;


--
-- Name: objectives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.objectives (
    id bigint NOT NULL,
    objective_code character varying(255) NOT NULL,
    objective_desc character varying(255) NOT NULL,
    institution_id integer NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.objectives OWNER TO postgres;

--
-- Name: objectives_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.objectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objectives_id_seq OWNER TO postgres;

--
-- Name: objectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.objectives_id_seq OWNED BY public.objectives.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    permission_code character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    id bigint NOT NULL,
    activity_id integer NOT NULL,
    gfs_id integer NOT NULL,
    unit_cost double precision NOT NULL,
    unit_count integer NOT NULL,
    day integer NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_id_seq OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    role_title character varying(50) NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: rolespermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolespermissions (
    id bigint NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.rolespermissions OWNER TO postgres;

--
-- Name: rolespermissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rolespermissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rolespermissions_id_seq OWNER TO postgres;

--
-- Name: rolespermissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rolespermissions_id_seq OWNED BY public.rolespermissions.id;


--
-- Name: subtasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subtasks (
    id bigint NOT NULL,
    subtask_desc character varying(255) NOT NULL,
    maintask_id integer NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.subtasks OWNER TO postgres;

--
-- Name: subtasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subtasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subtasks_id_seq OWNER TO postgres;

--
-- Name: subtasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subtasks_id_seq OWNED BY public.subtasks.id;


--
-- Name: targets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targets (
    id bigint NOT NULL,
    target_code character varying(255) NOT NULL,
    target_desc character varying(255) NOT NULL,
    objective_id integer NOT NULL,
    created_by character varying(100),
    updated_by character varying(50),
    deleted_by character varying(50),
    status boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.targets OWNER TO postgres;

--
-- Name: targets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targets_id_seq OWNER TO postgres;

--
-- Name: targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.targets_id_seq OWNED BY public.targets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    institution_id integer NOT NULL,
    role_id integer NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    status boolean DEFAULT false NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: view_activity_by_institution_id; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_activity_by_institution_id AS
 SELECT o.institution_id,
    a.id AS activity_id,
    a.activity_code,
    a.activity_desc,
    a.approved_budget
   FROM ((public.activities a
     JOIN public.targets t ON ((a.target_id = t.id)))
     JOIN public.objectives o ON ((t.objective_id = o.id)))
  ORDER BY a.id;


ALTER TABLE public.view_activity_by_institution_id OWNER TO postgres;

--
-- Name: view_activity_progress_milestone; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_activity_progress_milestone AS
 SELECT a.id,
    a.activity_id,
    a.milestone_id,
    m.milestone_name,
    a.planned_target,
    a.actual_target,
    a.progress_level,
    a.remark_level_0,
    a.remark_level_1,
    a.remark_level_2,
    a.remark_level_3,
    m.month
   FROM (public.activityprogresses a
     JOIN public.milestones m ON ((a.milestone_id = m.id)))
  ORDER BY a.activity_id, a.milestone_id;


ALTER TABLE public.view_activity_progress_milestone OWNER TO postgres;

--
-- Name: view_funddisbursement_milestone; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_funddisbursement_milestone AS
 SELECT f.id,
    f.activity_id,
    f.milestone_id,
    m.milestone_name,
    f.fund_received,
    f.fund_spent,
    m.month,
    f.progress_status,
    f.fund_allocated
   FROM (public.funddisbursements f
     JOIN public.milestones m ON ((f.milestone_id = m.id)))
  ORDER BY f.activity_id, f.milestone_id;


ALTER TABLE public.view_funddisbursement_milestone OWNER TO postgres;

--
-- Name: view_lastmilstone_overal_target; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_lastmilstone_overal_target AS
 SELECT a.activity_id,
    a.milestone_id AS last_milestone_id,
    a.actual_target,
    i.target
   FROM (public.activityprogresses a
     JOIN public.indicators i ON ((a.activity_id = i.activity_id)))
  WHERE ((a.actual_target IS NOT NULL) AND ((a.progress_level)::text = '3'::text))
  ORDER BY a.milestone_id DESC;


ALTER TABLE public.view_lastmilstone_overal_target OWNER TO postgres;

--
-- Name: view_lastmilstone_overal_target_calc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_lastmilstone_overal_target_calc AS
 SELECT view_lastmilstone_overal_target.activity_id,
    max(view_lastmilstone_overal_target.last_milestone_id) AS last_milestone_id,
    max((view_lastmilstone_overal_target.actual_target)::text) AS actual_target,
    max((view_lastmilstone_overal_target.target)::text) AS activity_target
   FROM public.view_lastmilstone_overal_target
  GROUP BY view_lastmilstone_overal_target.activity_id;


ALTER TABLE public.view_lastmilstone_overal_target_calc OWNER TO postgres;

--
-- Name: view_total_funds; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_total_funds AS
 SELECT f.activity_id,
    sum(f.fund_allocated) AS total_fund_allocated,
    sum(f.fund_received) AS total_fund_received,
    sum(f.fund_spent) AS total_fund_spent
   FROM public.funddisbursements f
  WHERE ((f.progress_status)::text = '3'::text)
  GROUP BY f.activity_id;


ALTER TABLE public.view_total_funds OWNER TO postgres;

--
-- Name: view_total_funds_activities; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_total_funds_activities AS
 SELECT t.activity_id AS id,
    o.institution_id,
    a.activity_code,
    a.approved_budget,
    t.total_fund_allocated,
    t.total_fund_received,
    t.total_fund_spent,
    a.activity_desc,
    a.activity_remark
   FROM (((public.view_total_funds t
     JOIN public.activities a ON ((t.activity_id = a.id)))
     JOIN public.targets g ON ((a.target_id = g.id)))
     JOIN public.objectives o ON ((g.objective_id = o.id)));


ALTER TABLE public.view_total_funds_activities OWNER TO postgres;

--
-- Name: view_report_activity_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_report_activity_summary AS
 SELECT t.id,
    t.institution_id,
    t.activity_code,
    t.approved_budget,
    t.total_fund_allocated,
    t.total_fund_received,
    t.total_fund_spent,
    t.activity_desc,
    t.activity_remark,
    l.activity_id,
    l.last_milestone_id,
    l.actual_target,
    l.activity_target
   FROM (public.view_total_funds_activities t
     JOIN public.view_lastmilstone_overal_target_calc l ON ((t.id = l.activity_id)));


ALTER TABLE public.view_report_activity_summary OWNER TO postgres;

--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: activityprogress_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activityprogress_logs ALTER COLUMN id SET DEFAULT nextval('public.activityprogress_logs_id_seq'::regclass);


--
-- Name: activityprogresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activityprogresses ALTER COLUMN id SET DEFAULT nextval('public.activityprogresses_id_seq'::regclass);


--
-- Name: contract_progress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_progress ALTER COLUMN id SET DEFAULT nextval('public.contract_progress_id_seq'::regclass);


--
-- Name: contractattachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contractattachments ALTER COLUMN id SET DEFAULT nextval('public.contractattachments_id_seq'::regclass);


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: funddisbursements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funddisbursements ALTER COLUMN id SET DEFAULT nextval('public.funddisbursements_id_seq'::regclass);


--
-- Name: gfs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gfs ALTER COLUMN id SET DEFAULT nextval('public.gfs_id_seq'::regclass);


--
-- Name: indicators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicators ALTER COLUMN id SET DEFAULT nextval('public.indicators_id_seq'::regclass);


--
-- Name: institutions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions ALTER COLUMN id SET DEFAULT nextval('public.institutions_id_seq'::regclass);


--
-- Name: maintasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintasks ALTER COLUMN id SET DEFAULT nextval('public.maintasks_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: milestones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.milestones ALTER COLUMN id SET DEFAULT nextval('public.milestones_id_seq'::regclass);


--
-- Name: objectives id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objectives ALTER COLUMN id SET DEFAULT nextval('public.objectives_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: rolespermissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolespermissions ALTER COLUMN id SET DEFAULT nextval('public.rolespermissions_id_seq'::regclass);


--
-- Name: subtasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtasks ALTER COLUMN id SET DEFAULT nextval('public.subtasks_id_seq'::regclass);


--
-- Name: targets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targets ALTER COLUMN id SET DEFAULT nextval('public.targets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities (id, activity_code, activity_desc, day, activity_remark, start_date, end_date, approved_budget, lead_agency, responsible_person, target_id, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
6	JO1D02	To develop (coding) Accommodation Services in Tanzania by invloving 8 Staff for 55 days each by June 2022	55	\N	2021-12-01 00:00:00	2022-01-31 00:00:00	72800000	MNRT	HICT	10	\N	\N	\N	t	2022-01-20 00:45:50	\N	\N
5	JO1D01	To facilitate 8 Staff for  27 days  on the review and improve of System User Specification Requirements and System design by June 2022	27	Need fund on time	2021-10-01 00:00:00	2021-11-30 00:00:00	38690000	MNRT	HICT	10	\N	\N	\N	t	2022-01-20 00:43:21	2022-01-19 22:22:16	\N
\.


--
-- Data for Name: activityprogress_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activityprogress_logs (id, activityprogress_id, from_user_id, from_progress_level, to_progress_level, approved_status, remark, created_at, updated_at, deleted_at) FROM stdin;
110	34	8	0	1	approved	Okay	2022-01-20 01:17:22	\N	\N
111	35	8	0	1	approved	Okay	2022-01-20 01:17:29	\N	\N
112	34	4	1	2	approved	Okay	2022-01-20 01:19:02	\N	\N
113	35	4	1	2	approved	Okay	2022-01-20 01:19:23	\N	\N
114	34	6	2	3	approved	Approved	2022-01-20 01:20:43	\N	\N
115	35	6	2	3	approved	Approved	2022-01-20 01:20:59	\N	\N
116	37	7	0	1	approved	Okay	2022-01-20 19:23:28	\N	\N
117	38	7	0	1	approved	Good	2022-01-20 19:23:54	\N	\N
118	39	7	0	1	approved	Lack of fund	2022-01-20 19:24:17	\N	\N
119	37	4	1	2	approved	Okay	2022-01-20 19:24:52	\N	\N
120	38	4	1	2	approved	Okay	2022-01-20 19:25:05	\N	\N
121	39	4	1	2	approved	Approved	2022-01-20 19:25:15	\N	\N
122	37	6	2	3	approved	Approved	2022-01-20 19:33:04	\N	\N
123	38	6	2	3	approved	Approved	2022-01-20 19:33:12	\N	\N
\.


--
-- Data for Name: activityprogresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activityprogresses (id, activity_id, milestone_id, planned_target, actual_target, progress_level, remark_level_0, remark_level_1, remark_level_2, remark_level_3, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
36	5	3	3	\N	\N	\N	\N	\N	\N	9	\N	\N	f	2022-01-19 21:59:02	2022-01-19 21:59:02	\N
34	5	1	1	1	3	Okay	Okay	Approved	\N	9	6	\N	f	2022-01-19 21:58:34	2022-01-20 01:20:42	\N
35	5	2	2	1	3	Okay	Okay	Approved	\N	9	6	\N	f	2022-01-19 21:58:50	2022-01-20 01:20:58	\N
40	6	4	3	\N	\N	\N	\N	\N	\N	7	\N	\N	f	2022-01-20 16:20:24	2022-01-20 16:20:24	\N
39	6	3	2	1	2	Lack of fund	Approved	\N	\N	7	4	\N	f	2022-01-20 16:20:16	2022-01-20 19:25:14	\N
37	6	1	1	1	3	Okay	Okay	Approved	\N	7	6	\N	f	2022-01-20 16:19:57	2022-01-20 19:33:03	\N
38	6	2	1	1	3	Good	Okay	Approved	\N	7	6	\N	f	2022-01-20 16:20:07	2022-01-20 19:33:12	\N
\.


--
-- Data for Name: contract_progress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contract_progress (id, contract_id, amount_disbursed, remark, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at, date_disbursed) FROM stdin;
15	21	10000000	Key supplied	8	\N	\N	f	2022-01-19 22:44:22	2022-01-19 22:44:22	\N	2022-01-16 00:00:00
\.


--
-- Data for Name: contractattachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contractattachments (id, activity_id, title, path, created_at, updated_at) FROM stdin;
19	6	TANZANIA TOURIST BOARD-TTB.pdf	public/FrontEndAngular/src/assets/uploads/TANZANIA TOURIST BOARD-TTB.pdf	2022-01-19 22:43:19	2022-01-19 22:43:19
20	6	Mwongozo wa Maandalizi ya Mpango na Bajeti ya Serikali wa Mwaka 2021-22.pdf	public/FrontEndAngular/src/assets/uploads/Mwongozo wa Maandalizi ya Mpango na Bajeti ya Serikali wa Mwaka 2021-22.pdf	2022-01-19 22:44:23	2022-01-19 22:44:23
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracts (id, activity_id, contract_type, contract_title, contract_amount, advanced_payment, signed_date, commencement_date, completion_date, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
21	6	Goods	Purchase of customer care application	20000000	0	2022-01-02 00:00:00	2022-01-09 00:00:00	2022-01-16 00:00:00	null	\N	\N	f	2022-01-19 22:43:18	2022-01-19 22:43:18	\N
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, activityprogress_id, title, path, created_at, updated_at) FROM stdin;
50	34	Taarifa ya utekelezaji mradi wa COVID-19 (4) (1).xlsx	public/FrontEndAngular/src/assets/uploads/Taarifa ya utekelezaji mradi wa COVID-19 (4) (1).xlsx	2022-01-19 22:16:20	2022-01-19 22:16:20
51	34	print_transfer_invoice_214.pdf	public/FrontEndAngular/src/assets/uploads/print_transfer_invoice_214.pdf	2022-01-19 22:16:20	2022-01-19 22:16:20
52	35	invoice_240 (1).pdf	public/FrontEndAngular/src/assets/uploads/invoice_240 (1).pdf	2022-01-19 22:17:05	2022-01-19 22:17:05
53	35	invoice_240.pdf	public/FrontEndAngular/src/assets/uploads/invoice_240.pdf	2022-01-19 22:17:06	2022-01-19 22:17:06
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: funddisbursements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funddisbursements (id, activity_id, milestone_id, fund_allocated, fund_received, fund_spent, progress_status, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
4	5	1	4000000	4000000	4000000	3	9	\N	\N	t	2022-01-20 00:59:56	2022-01-19 22:15:01	\N
5	5	2	4000000	3000000	3000000	3	9	\N	\N	t	2022-01-20 01:00:06	2022-01-19 22:15:24	\N
6	5	3	4000000	3500000	\N	3	9	\N	\N	t	2022-01-20 01:00:23	2022-01-19 22:15:40	\N
10	6	4	2000000	\N	\N	3	7	\N	\N	t	2022-01-20 19:21:17	\N	\N
7	6	1	2000000	1500000	1500000	3	7	\N	\N	t	2022-01-20 19:20:50	2022-01-20 16:22:34	\N
8	6	2	2000000	2000000	2000000	3	7	\N	\N	t	2022-01-20 19:20:58	2022-01-20 16:22:51	\N
9	6	3	2000000	1800000	1600000	3	7	\N	\N	t	2022-01-20 19:21:08	2022-01-20 16:23:14	\N
\.


--
-- Data for Name: gfs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gfs (id, gfs_code, gfs_desc, unit, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
1	22010105	Per Diem - Domestic	Person	\N	\N	\N	t	2021-12-01 00:00:00	\N	\N
2	22003102	Fuel	Ltr	\N	\N	\N	t	2021-12-09 00:00:00	\N	\N
3	22014104	Food and refreshment	Person	\N	\N	\N	t	2012-12-09 00:00:00	\N	\N
4	123213	fdsdf	sdfasdfas	null	\N	\N	t	2021-12-24 20:11:10	2021-12-24 17:11:26	2021-12-24 17:11:26
5	123213	fdsdf	sdfasdfas	null	\N	\N	t	2021-12-24 20:11:10	2021-12-24 17:11:31	2021-12-24 17:11:31
\.


--
-- Data for Name: indicators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indicators (id, activity_id, indicator, indicator_desc, target, means_of_verification, remarks, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
5	5	Number of document versions	Number of document versions	12	Report	\N	9	\N	\N	t	2022-01-20 00:58:16	\N	\N
6	6	Number of modules	Number of modules	10	Report	Ten module to be developed	7	\N	\N	t	2022-01-20 19:19:49	\N	\N
\.


--
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institutions (id, inst_name, vote_code, sub_vote_no, vote_name, sub_vote_name, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
1	HICT	69	1008	MNRT	HICT	\N	\N	\N	f	2021-12-06 00:00:00	\N	\N
2	TANAPA	69	1012	MNRT	TANAPA	\N	\N	\N	f	2021-12-06 00:00:00	\N	\N
3	TAWA	69	1124	MNRT	TAWA	\N	\N	\N	f	2021-12-06 00:00:00	\N	\N
4	DPP	69	1054	MNRT	DPP	\N	\N	\N	f	2021-12-06 00:00:00	\N	\N
5	FTI	69	1040	MNRT	FTI	\N	\N	\N	t	2021-12-10 00:00:00	\N	\N
6	TAWIRI	69	12313	MNRT	TAWIRI	\N	\N	\N	t	2021-12-10 12:47:52	\N	\N
7	MNRT	69	69	MNRT	MNRT	\N	\N	\N	t	2022-01-20 01:48:43	\N	\N
\.


--
-- Data for Name: maintasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintasks (id, maintask_desc, activity_id, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2021_12_01_185502_create_institutions_table	2
6	2021_12_01_204623_create_roles_table	2
7	2021_12_06_200749_create_objectives_table	3
8	2021_12_07_152913_create_targets_table	3
10	2021_12_08_112633_create_maintasks_table	4
11	2021_12_08_123522_create_subtasks_table	4
15	2014_10_12_000000_create_users_table	8
16	2021_12_09_070557_create_gfs_table	9
24	2021_12_09_143601_create_milestones_table	14
32	2021_12_12_091033_create_resources_table	17
33	2021_12_14_045930_create_permissions_table	18
35	2021_12_14_070452_create_rolespermissions_table	19
36	2021_12_12_081357_create_indicators_table	20
37	2021_12_19_080125_create_activityprogress_logs_table	20
38	2021_12_20_072524_create_attachments_table	20
39	2021_12_10_041145_create_activityprogresses_table	21
40	2021_12_11_063950_create_view_activity_progress_milestone	22
41	2021_12_24_151255_create_documents_table	23
48	2021_12_07_184217_create_activities_table	26
49	2021_12_09_121851_create_activity_view	27
50	2022_01_11_053332_create_contracts_table	28
52	2022_01_11_082036_create_contract_progress_table	30
53	2022_01_11_073024_create_contractattachments_table	31
54	2021_12_10_051620_create_funddisbursements_table	32
55	2022_01_05_133321_create_view_total_funds	32
56	2022_01_05_140002_create_view_total_funds_activities	32
57	2022_01_05_145648_create_view_lastmilstone_overal_target	33
58	2022_01_05_145733_create_view_lastmilstone_overal_target_calc	33
59	2022_01_05_151821_create_view_report_activity_summary	33
60	2022_01_19_100644_rename_contract_id_in_contractattachments	33
61	2022_01_19_140226_add_date_disbursed_to_contract_progress	34
62	2022_01_03_084159_create_view_funddisbursement_milestone	35
\.


--
-- Data for Name: milestones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.milestones (id, milestone_name, month, start_date, end_date, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
1	Week 1	Nov	2021-11-01	2021-11-07	\N	\N	\N	t	2021-12-10 16:17:04	\N	\N
2	Week 2	Nov	2021-11-08	2021-11-14	\N	\N	\N	t	2021-12-11 07:50:57	\N	\N
3	Week 3	Nov	2021-11-15	2021-11-21	\N	\N	\N	t	2021-12-11 07:51:23	\N	\N
4	Week 4	Nov	2021-11-22	2021-11-28	\N	\N	\N	t	2021-12-11 09:48:31	\N	\N
5	Week 5	Dec	2021-11-29	2021-12-05	\N	\N	\N	t	2021-12-11 09:50:25	\N	\N
6	Week 6	Dec	2021-12-06	2021-12-12	\N	\N	\N	t	2021-12-11 10:10:24	\N	\N
7	Week 7	Dec	2021-12-13	2021-12-19	\N	\N	\N	t	2021-12-11 10:10:42	\N	\N
8	Week 8	Dec	2021-12-20	2021-12-26	\N	\N	\N	t	2021-12-11 10:11:48	\N	\N
9	Week 9	Jan	2021-12-27	2022-01-02	\N	\N	\N	t	2021-12-11 10:12:39	2022-01-11 15:30:30	2022-01-11 15:30:30
\.


--
-- Data for Name: objectives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.objectives (id, objective_code, objective_desc, institution_id, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
27	J	Ministerial capacity to deliver services strengthened	1	ICT M & E Officer	\N	\N	t	2022-01-20 00:40:01	\N	\N
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
willy@gmail.com	gtq5jrQN9Cidc6XfufwqyhAugIeanHGRP6JyORwXS930lpF7JWGPdZbL7ACpmXVtV0kHTzjLpF210dI6	2021-12-07 14:08:53
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, permission_code, description, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
1	approvemilestonelevel1	Able to approve a milestone leve 1	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
2	approvemilestonelevel2	Able to approve a milestone leve 2	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
7	addresources	add resources	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
3	approvemilestonelevel3	Able to approve a milestone leve 3	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
4	superadmin	Super Admin	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
8	viewchecklist	Can view checklist	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
5	reportactivityprogress	Can add/update actual progress	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
6	viewactivityprogress	View activity progress	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
10	registeruser	Can register user	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
11	rolesandpermissons	Can roles and permissions	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
9	manageusersrolespermissions	Can register user and assign role/permission	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
12	systemsetup	Can setup system	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
13	reportconsolidation	Report consolidation	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
14	institutionadmin	Institution/Department admin	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
15	viewchecklistddp	DPP viewcheck list	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
16	addfunddisbursement	Add fund disbursement	\N	\N	\N	t	2021-12-14 00:00:00	\N	\N
17	reportcontract	Can report contract	\N	\N	\N	t	2022-01-20 00:00:00	\N	\N
18	viewcontract	Can view contract	\N	\N	\N	t	2022-01-20 00:00:00	\N	\N
19	addgfscode	Can add GFS	\N	\N	\N	t	2022-01-20 00:00:00	\N	\N
20	setupmilestone	Can setup milestones	\N	\N	\N	t	2022-01-20 00:00:00	\N	\N
21	addinstitution	Can add institution	\N	\N	\N	t	2022-01-20 00:00:00	\N	\N
22	viewadmindashboard	View Admin dashboard	\N	\N	\N	t	2022-01-20 00:00:00	\N	\N
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	1	token	501faf88a53914a365d33c63c1e0225a588f0acc1eb8aff3d119870a33970077	["*"]	\N	2021-12-01 18:37:52	2021-12-01 18:37:52
2	App\\Models\\User	1	token	e9ecb95a030376fa1a53a3b666ae22360ecdff7fb71b8096f42312f2bac0bb9b	["*"]	\N	2021-12-03 15:29:38	2021-12-03 15:29:38
3	App\\Models\\User	1	token	4eb963715811407d53773831dbc32b32b1d71dc691fea7a118dd76f37a946c66	["*"]	\N	2021-12-03 15:29:50	2021-12-03 15:29:50
4	App\\Models\\User	1	token	38cc0de4e311e4536838b0818a41fbb0c80f68e7f589cecc1343f36db24d3297	["*"]	\N	2021-12-03 15:29:53	2021-12-03 15:29:53
5	App\\Models\\User	1	token	daa9aa781175125d6849cad2ceba69aca87d20bfbbdadb84bf29e17b44eecaff	["*"]	\N	2021-12-03 15:29:59	2021-12-03 15:29:59
6	App\\Models\\User	1	token	c9311ec7613f8000d1dee1999210798432256d2b2f6d4fed3326254c91c994d2	["*"]	\N	2021-12-03 15:30:57	2021-12-03 15:30:57
7	App\\Models\\User	2	token	5589832e2020e94c90ca7f9b4c3b0aa3c2ac3790d02dd19da8e8f366895cf68f	["*"]	\N	2021-12-03 17:02:42	2021-12-03 17:02:42
8	App\\Models\\User	1	token	e022513e707ba69d8526b85adbc2807078fe491a707deafe2383c5a8eb0710d8	["*"]	\N	2021-12-03 17:02:57	2021-12-03 17:02:57
9	App\\Models\\User	1	token	5c271342fd7a39f5b7b9c1f7108a9660f749c9a880dd2d4e254cf76e74df41ca	["*"]	\N	2021-12-03 17:04:59	2021-12-03 17:04:59
10	App\\Models\\User	1	token	e6ae41902aded5026cf52935a74317502d42a4f963ce2dd7c133a953b3d8cdd3	["*"]	\N	2021-12-03 17:06:16	2021-12-03 17:06:16
11	App\\Models\\User	1	token	4f3b8814dbd0bfcf42bac1e26801fa25038f7ca602419e9954bb55eb08f42523	["*"]	\N	2021-12-03 17:09:26	2021-12-03 17:09:26
12	App\\Models\\User	1	token	a17d3247dca6abbb9633fc02c2636c4602ae670191f0975676156edc86481481	["*"]	\N	2021-12-03 17:10:37	2021-12-03 17:10:37
13	App\\Models\\User	2	token	532ef76bbbbc896f92e9f28c702dbd68547601d583dc64c38f6815ef77e75704	["*"]	\N	2021-12-03 17:20:07	2021-12-03 17:20:07
14	App\\Models\\User	1	token	71a9c2b07f1eec296a4d7b8c8e3d3fcf64f868216c3e0cd918f3ff13bc626320	["*"]	\N	2021-12-03 17:39:29	2021-12-03 17:39:29
15	App\\Models\\User	1	token	7c04d662b0b823643eb99809679f2c3735808093a91a1201c81b0e1640771f5c	["*"]	\N	2021-12-03 17:48:15	2021-12-03 17:48:15
16	App\\Models\\User	1	token	ed2694fa268ac493f809c4247d96f5d64d05c4feaa15dabc9508e33777ce6c0c	["*"]	\N	2021-12-03 17:49:23	2021-12-03 17:49:23
17	App\\Models\\User	2	token	b402f60678fa68299a17eb51c49f424fc9a1ceaac9eb6a6381b653ed29c3a19e	["*"]	\N	2021-12-03 17:50:06	2021-12-03 17:50:06
18	App\\Models\\User	1	token	fe822d33b50f2f47691d771b69f71a20dab50a3ba64fbb0abc1a227d2d9f9015	["*"]	\N	2021-12-03 17:51:17	2021-12-03 17:51:17
19	App\\Models\\User	2	token	a9460e61bc9de46ab1f2218696ccb9e26e953a9668a43e1952a59c168f771c2a	["*"]	\N	2021-12-04 12:13:16	2021-12-04 12:13:16
20	App\\Models\\User	1	token	bde28780e06376d65678759822caaf4ae56d697405414ad5edd0629e617a1d12	["*"]	\N	2021-12-04 12:22:52	2021-12-04 12:22:52
21	App\\Models\\User	1	token	6bc702a0d6df2ba24d3031166d67ff12ca9c65ae8cec987bb3881bc40febe0f0	["*"]	\N	2021-12-04 12:22:53	2021-12-04 12:22:53
22	App\\Models\\User	1	token	695605a40c0d2c17199221ce56ef3c5e1c2586ea29c1f99e2a353a792402b0f8	["*"]	\N	2021-12-04 12:22:53	2021-12-04 12:22:53
23	App\\Models\\User	1	token	53709f7fc7fd6bdeedb8a065d6c5e3744d896cb93646761406be80b5358ea077	["*"]	\N	2021-12-04 12:22:54	2021-12-04 12:22:54
24	App\\Models\\User	1	token	b0eeae350350a40437f0b5fe9c2cb29d0ce1888a3e1ff60622f2c905d1a1c515	["*"]	\N	2021-12-04 12:22:55	2021-12-04 12:22:55
25	App\\Models\\User	1	token	00c99e4eb6a2004fef4514295eec1dcd2b3721de10d1bd64bffedfa90f6b508d	["*"]	\N	2021-12-04 12:22:55	2021-12-04 12:22:55
26	App\\Models\\User	1	token	af73b22a6f022595af38a05ab5389924f930617666a1a7b0ffcd00b46a5d89af	["*"]	\N	2021-12-04 12:23:58	2021-12-04 12:23:58
27	App\\Models\\User	2	token	4e07f2496ed3577da4aa6e0268068cdfef74d3a05386d560e922e01b19f6311e	["*"]	\N	2021-12-04 12:24:54	2021-12-04 12:24:54
28	App\\Models\\User	1	token	5f8c81c5df7cce7174a48ad5b2fa107316607fc252de214ccaec3dc9cb0b8c34	["*"]	\N	2021-12-04 12:25:41	2021-12-04 12:25:41
29	App\\Models\\User	1	token	58b79651acdd0885d48d899bf4e56977cb9241dda1952b73234e94961330c630	["*"]	\N	2021-12-04 15:05:06	2021-12-04 15:05:06
30	App\\Models\\User	2	token	d373268cdc52b3d618abe64a36e48ab6d89260049caa65ade71cb417e378fc73	["*"]	\N	2021-12-06 07:55:06	2021-12-06 07:55:06
31	App\\Models\\User	2	token	0ece2a0ec07f572c9258d970d05ce05e7e96bd174343779b905a28d9016b6b66	["*"]	\N	2021-12-06 07:55:08	2021-12-06 07:55:08
32	App\\Models\\User	2	token	684ae7d565dcd587bc195c131b37beab971220879a6849ced815c26b1ebc17f7	["*"]	\N	2021-12-06 08:01:25	2021-12-06 08:01:25
33	App\\Models\\User	1	token	9cf536d0e7b8287102bb39fb09b57a966d842d615a0284bfbb9946b6e1fd6524	["*"]	\N	2021-12-06 08:07:10	2021-12-06 08:07:10
34	App\\Models\\User	6	token	cdd6a4081939c5a2f7bba7337b3cb2ea768a58169f8c54c31ffd2ce2ab32d8b4	["*"]	\N	2021-12-06 08:08:38	2021-12-06 08:08:38
35	App\\Models\\User	6	token	6fe4cc7a3b8665339082f285ee9f1e2e4dff2793c2d8a1cc8aad72e9d902e7f5	["*"]	\N	2021-12-06 09:20:49	2021-12-06 09:20:49
36	App\\Models\\User	1	token	2a3a31d3640c7e5d326f86925d86d376686b7281413b5ecfdb065c2b74721e65	["*"]	\N	2021-12-06 09:21:59	2021-12-06 09:21:59
37	App\\Models\\User	7	token	24bd1f5acfee864b033d4d9ee91b2b94f7721556a9cd86b093b72da04049252f	["*"]	\N	2021-12-06 09:43:34	2021-12-06 09:43:34
38	App\\Models\\User	1	token	f9297597c42904bcfebe61c9bdf5cf20303a1446d2001a3a5119fe394714360a	["*"]	\N	2021-12-06 09:45:24	2021-12-06 09:45:24
39	App\\Models\\User	1	token	a7a1a277d22005ac7d43d1b0dbeed42334c178de41cdaff7f9ec25ab85c61917	["*"]	\N	2021-12-06 10:50:52	2021-12-06 10:50:52
40	App\\Models\\User	1	token	0873c74eb92d3619f0dcded25ce307a17887aac725f20fd563783d3bad983aba	["*"]	\N	2021-12-06 11:58:48	2021-12-06 11:58:48
41	App\\Models\\User	1	token	ca3bc816c9c04d9f8315240e8cb84378ba8cc2a032c6da188959ef4544974289	["*"]	\N	2021-12-06 14:53:50	2021-12-06 14:53:50
42	App\\Models\\User	1	token	04d6347d651d27f7b9835e021a9ee0d0f504da27c99cf8928d9a468cf50ecd1c	["*"]	\N	2021-12-07 07:10:37	2021-12-07 07:10:37
43	App\\Models\\User	2	token	d5b810ab62cc8ad3c5f7123fd384d1dd88155d44c3f83445b76b70dc025d1cb5	["*"]	\N	2021-12-07 07:11:41	2021-12-07 07:11:41
44	App\\Models\\User	1	token	9a7bfefe4daca340d6d5e46ea5fe5ec4734fd372cd5ce550f2bab7a8b900901e	["*"]	\N	2021-12-07 07:19:54	2021-12-07 07:19:54
45	App\\Models\\User	1	token	3eb7b27a09f7f5920313ba379e87e04bf6df5035c60d05693d48e4617dc2c2cc	["*"]	\N	2021-12-07 08:20:25	2021-12-07 08:20:25
46	App\\Models\\User	1	token	9124d8e80bdf330e3aecd4719ecd5b1be8a9abe3c6e86a277429433586d3a71d	["*"]	\N	2021-12-07 14:06:13	2021-12-07 14:06:13
47	App\\Models\\User	1	token	7dd6b36b7674f747ba7a74cb0b15170216c442fcb57a4f0de72efed41d246b51	["*"]	\N	2021-12-07 16:36:31	2021-12-07 16:36:31
48	App\\Models\\User	1	token	a6861a3825aa18502479106c90915d737d823b154f14b30f7009ba6ee931ab61	["*"]	\N	2021-12-07 20:06:24	2021-12-07 20:06:24
49	App\\Models\\User	1	token	ca6a26c95ad4ce5595a51918cb79f28d875b9840d38be36dea4a0e1374815dff	["*"]	\N	2021-12-07 20:15:16	2021-12-07 20:15:16
50	App\\Models\\User	1	token	6a35e309cfa50ddd25d454bfdf4c7be70e06b5b302790344b6cbd4a4caa13884	["*"]	\N	2021-12-07 21:31:55	2021-12-07 21:31:55
51	App\\Models\\User	1	token	1270256af6b560f80f8c8aec080c93389461253e2e76d7dc166f14d34ee76661	["*"]	\N	2021-12-07 21:56:49	2021-12-07 21:56:49
52	App\\Models\\User	1	token	6b259842c058a22c47da0115cf70f05b9a42bb56242443b7ddd7e1649a9f089b	["*"]	\N	2021-12-08 07:52:30	2021-12-08 07:52:30
53	App\\Models\\User	2	token	0210eb323c1c423e3bffdc5a725a090ff3ba98d8217f0813e67baf28f47edfa2	["*"]	\N	2021-12-08 10:04:57	2021-12-08 10:04:57
54	App\\Models\\User	1	token	269f16db8d67391d5481b85595605195aad77d50e7e206f83dd1730d93a7fee5	["*"]	\N	2021-12-08 10:28:21	2021-12-08 10:28:21
55	App\\Models\\User	2	token	da94c2e1e45332868eff988da567a1c5e48607c5858ab456b6afb17c16686194	["*"]	\N	2021-12-08 10:37:43	2021-12-08 10:37:43
56	App\\Models\\User	1	token	a52981161184b7d5b9a8c66ac65980c66e7f1838364bdb125c88fe73b3f742e2	["*"]	\N	2021-12-08 10:45:41	2021-12-08 10:45:41
57	App\\Models\\User	1	token	f889351b879e4c42cdc0a2f92965ee336435f229a1de351ee262254f5b621dff	["*"]	\N	2021-12-09 07:35:41	2021-12-09 07:35:41
58	App\\Models\\User	1	token	9af1dfe173da1c3155c83769ce281f4e2fca2e153cb93aca5fb3aa0fff38eee3	["*"]	\N	2021-12-09 12:39:46	2021-12-09 12:39:46
59	App\\Models\\User	1	token	18caf253e686f959e918086bc7d45c4b7cf1a0bb24fa7b1e20d79ddddcef7015	["*"]	\N	2021-12-09 16:24:52	2021-12-09 16:24:52
60	App\\Models\\User	1	token	ef06a49a79e2dbe5acd9552b06ed872db7bfc81cfabb30610281637a4b238b1f	["*"]	\N	2021-12-10 11:38:34	2021-12-10 11:38:34
61	App\\Models\\User	1	token	5a1ccc450b8c2e54c836a6c2d57b85a2c647695c5259ac21dca630bfb310f4bd	["*"]	\N	2021-12-11 09:52:01	2021-12-11 09:52:01
62	App\\Models\\User	1	token	6304a074aa5a45174c11e8094e6dd00e7d81de1aee1e1528018fa74d4141c0f0	["*"]	\N	2021-12-12 07:28:59	2021-12-12 07:28:59
63	App\\Models\\User	1	token	e1613315e3b66a42b0283048325d65da9f6b4cb35eb9071078cc4c44b995b4ef	["*"]	\N	2021-12-12 08:09:59	2021-12-12 08:09:59
64	App\\Models\\User	1	token	1d70da294f6cbd94a09a3e7e4b49629cc8d6e5df730ba64c22b12e285e878e66	["*"]	\N	2021-12-12 08:10:59	2021-12-12 08:10:59
65	App\\Models\\User	1	token	1dd0ae77406b0f02ab130eedec3af5dbb26cd1bca820dc8a1f172d1a7f1a1dd4	["*"]	\N	2021-12-12 15:49:18	2021-12-12 15:49:18
66	App\\Models\\User	1	token	b36d490e033f8fd1c0dfcc37b5f34351cf832c1cb5410d15e7c923b8ee36ee03	["*"]	\N	2021-12-12 19:24:13	2021-12-12 19:24:13
67	App\\Models\\User	3	token	8b4cada437fcc708e75f46820592701358d4dc2c39518c643bbd78986efe96f9	["*"]	\N	2021-12-13 09:16:24	2021-12-13 09:16:24
68	App\\Models\\User	1	token	9a87de8a4d5d3d4a28265ec9bfcd8f8207f4b7e07cc2cd992fe27c10ec98cdc0	["*"]	\N	2021-12-13 09:31:14	2021-12-13 09:31:14
69	App\\Models\\User	3	token	da8f4b2ed55a3d52d1a9bbeca50dc3b32abf43811c999680f05cb09ee528de21	["*"]	\N	2021-12-13 09:40:15	2021-12-13 09:40:15
70	App\\Models\\User	1	token	d563138d70303fbfd17652f5f106c224ed0ac12c8db4c3ef5569f9b4e41eb7ca	["*"]	\N	2021-12-13 09:42:39	2021-12-13 09:42:39
71	App\\Models\\User	4	token	1e96c2a9295534bc921a8be0ef1f4e4b6255b5114d600b9a5a6d55397defdc5a	["*"]	\N	2021-12-13 09:44:42	2021-12-13 09:44:42
72	App\\Models\\User	1	token	e5162cfdb5a1fd4e7c21f711027c563cbc88b03c95acb03dbb70ff498950bbd2	["*"]	\N	2021-12-13 10:03:35	2021-12-13 10:03:35
73	App\\Models\\User	1	token	9c566397db9ee0f8a52261c911b4e785f2eec63ba4a3b9ddc892c56024e62155	["*"]	\N	2021-12-13 10:08:00	2021-12-13 10:08:00
74	App\\Models\\User	1	token	52e0ab64ac7b7ba65bae051e6e3b42315baa11d11bc13cb5a120cc942f74650b	["*"]	\N	2021-12-13 10:16:28	2021-12-13 10:16:28
75	App\\Models\\User	1	token	bb4005b452d1c320e91fbcacdd89b53bd34299509c8b80de3670bc92408abbee	["*"]	\N	2021-12-13 10:23:35	2021-12-13 10:23:35
76	App\\Models\\User	1	token	499c9670bc0dcfd36a79512fa875d4221bd72fcd8dce58775a334274032920cc	["*"]	\N	2021-12-13 10:28:40	2021-12-13 10:28:40
77	App\\Models\\User	4	token	95dc6dbd2617cc21a641d349b632b19b6184bb42186d8515b6937d70e694fda0	["*"]	\N	2021-12-13 18:23:18	2021-12-13 18:23:18
78	App\\Models\\User	1	token	2683b18d19b3b9d72ed47c2a801b92b18192f0a6eccccb4925717f8eb4964312	["*"]	\N	2021-12-13 18:24:57	2021-12-13 18:24:57
79	App\\Models\\User	6	token	967c183036090daf1dc9227785b12891cd93943d46f651605f0de0bea058d9de	["*"]	\N	2021-12-13 18:33:08	2021-12-13 18:33:08
80	App\\Models\\User	4	token	535ceb258facfe6d612e544fed498da6fb1dde8d9198b6a2cabb75c119b0854b	["*"]	\N	2021-12-13 20:29:29	2021-12-13 20:29:29
81	App\\Models\\User	1	token	19481a046612db38cb8afcfc0dd731917051a3ea6da4d47a9ffeda5b15eb674c	["*"]	\N	2021-12-13 20:31:45	2021-12-13 20:31:45
82	App\\Models\\User	6	token	3b6bbea4d1b51bfa6f843d4ca560d9b8c4f6cd4e9ff08a6426d92aef0f79cb9f	["*"]	\N	2021-12-14 06:17:20	2021-12-14 06:17:20
83	App\\Models\\User	4	token	36b9556148dd24c37c0bc9f0de0b235696a21ecf2bd1beae73b7d40fcb042db1	["*"]	\N	2021-12-14 06:21:29	2021-12-14 06:21:29
84	App\\Models\\User	1	token	8079a178e0974b8ce7a86f677a1d3ea9faef811c9c3fa8a1723a9feb8f37ca64	["*"]	\N	2021-12-14 07:04:20	2021-12-14 07:04:20
85	App\\Models\\User	6	token	df90ada5b8a078c0687e70e7de84402fc4735ac80c02e6b8726c04b3315eb255	["*"]	\N	2021-12-14 19:52:32	2021-12-14 19:52:32
86	App\\Models\\User	1	token	1e0477166de2df2babc5544237390b27a48f6c6420d6e33925bfc0d439303db3	["*"]	\N	2021-12-14 20:00:51	2021-12-14 20:00:51
87	App\\Models\\User	6	token	8adfc50da25527fb2351bf7ac650abf9b45b13f2d36b42790ec3640ad7851505	["*"]	\N	2021-12-14 20:03:49	2021-12-14 20:03:49
88	App\\Models\\User	1	token	e701b3f04db6fd7f8b680c9881840e47a99392090fe5cf77af6a11d43704694a	["*"]	\N	2021-12-14 20:21:46	2021-12-14 20:21:46
89	App\\Models\\User	6	token	e0ae31b762d6b1abb9f722e5a5c4b86f45debecd6c774b9b54f13a617c39e7e3	["*"]	\N	2021-12-16 06:06:43	2021-12-16 06:06:43
90	App\\Models\\User	1	token	d7870287008c86d1696739ebfa9661be712c18393d008c6354a675563912e91b	["*"]	\N	2021-12-16 06:07:48	2021-12-16 06:07:48
91	App\\Models\\User	4	token	7b1e2646539b97120be709edab640784c32e0e36ca8b597e18e7c0765092557f	["*"]	\N	2021-12-16 06:09:22	2021-12-16 06:09:22
92	App\\Models\\User	6	token	80fd35ba3c34c9057952d8a9b8fd551cca8f30b4739410a91329ba280ef3fc61	["*"]	\N	2021-12-16 06:10:58	2021-12-16 06:10:58
93	App\\Models\\User	1	token	a95c5844af9876aa9bf1d27f6f375901af8962b636d343ceb38eace3a55f3c27	["*"]	\N	2021-12-16 06:15:26	2021-12-16 06:15:26
94	App\\Models\\User	1	token	0207ecdda4341d216e980d37c376a41eb5d903249b298cfeeb0794d3910dbd0c	["*"]	\N	2021-12-19 07:38:16	2021-12-19 07:38:16
95	App\\Models\\User	1	token	9f4df4ba62e1e78383e12fd65a88a3fc6fb43d01a68b745c34245b5281f3e6ab	["*"]	\N	2021-12-19 12:23:09	2021-12-19 12:23:09
96	App\\Models\\User	1	token	e6f8b210e2abbea2506bc01c4ec28c04457c80ecffdaa5909bdd9e2f6c9e2239	["*"]	\N	2021-12-20 05:57:55	2021-12-20 05:57:55
97	App\\Models\\User	1	token	51c57847112f3d99a67d862831e22e3aec5801af823b358605610d58f8be7cff	["*"]	\N	2021-12-20 07:29:56	2021-12-20 07:29:56
98	App\\Models\\User	6	token	1ddd9f5b7a33fea7ddea9e692fccae66da4531808399fbb168b0469c8794c5e0	["*"]	\N	2021-12-20 07:31:15	2021-12-20 07:31:15
99	App\\Models\\User	1	token	fa8340cb3751b280aa1d8807a6ab1370a1f910ae6db783beaa49f42d148e51b8	["*"]	\N	2021-12-20 07:34:41	2021-12-20 07:34:41
100	App\\Models\\User	6	token	18a7ee2889036c6c31d270f8a080ae04e36231f0c934457302df42d8ce295b9f	["*"]	\N	2021-12-20 07:36:14	2021-12-20 07:36:14
101	App\\Models\\User	1	token	e99ff8c045769329242010d855d09d2916627e40f34e387563f7e6b95d3398aa	["*"]	\N	2021-12-20 07:37:39	2021-12-20 07:37:39
102	App\\Models\\User	4	token	9a7c35408ddfaaff96fc6d55d6ded1c60dd04ddfb6a22564daed2b863aaa62e4	["*"]	\N	2021-12-20 07:40:15	2021-12-20 07:40:15
103	App\\Models\\User	6	token	2efc000232db34d05d7280482c1e392556ed927d9b75c23b6ef3892c706949bb	["*"]	\N	2021-12-20 07:42:10	2021-12-20 07:42:10
104	App\\Models\\User	1	token	a7e7804881b036c6f2ad602bb13d551b970a55360af7b91e99746449369d7bd2	["*"]	\N	2021-12-20 07:46:43	2021-12-20 07:46:43
105	App\\Models\\User	1	token	a1542d499f0173d5ccdfde7c0db201751d2461acedb66ed23745a0b6941651ef	["*"]	\N	2021-12-23 07:52:38	2021-12-23 07:52:38
106	App\\Models\\User	1	token	48e668287d36cf2a3cb5dad6b75360abc00075c1b48b6f330bc1c01423589954	["*"]	\N	2021-12-24 01:32:48	2021-12-24 01:32:48
107	App\\Models\\User	1	token	6ff96ebe52a38c7a70a9fbe9e9e1b5e0f4b18e8a084802848794f948e4d72ded	["*"]	\N	2021-12-24 03:47:48	2021-12-24 03:47:48
140	App\\Models\\User	1	token	cfeeb2b5bcf21b55e9a9d262e6083e27bf38dea3cd2211b75d6b4bdaab6d709a	["*"]	\N	2021-12-24 10:49:00	2021-12-24 10:49:00
141	App\\Models\\User	1	token	8ae67b9227940d2ca4f23c824cd32834d06743a39b2a5f2e2f385499985a782e	["*"]	\N	2021-12-24 11:40:07	2021-12-24 11:40:07
142	App\\Models\\User	1	token	4bea5392289e2e0dfc0835baf993ee00730a3aa92b87db65b95add13b335cadb	["*"]	\N	2021-12-24 11:41:36	2021-12-24 11:41:36
143	App\\Models\\User	1	token	d2abc6a321d3c75eeff2b9294a04c014169bf883ad65689139fa7862b79fe34f	["*"]	\N	2021-12-24 12:23:11	2021-12-24 12:23:11
144	App\\Models\\User	4	token	f079d619da30e9ff99815de7a968fac6cf291926229c22922b94d3cd466b6f65	["*"]	\N	2021-12-24 13:09:11	2021-12-24 13:09:11
145	App\\Models\\User	6	token	bcb5a920824caa158623436a2d85429f1b289af00c0926245fd427a8e6ab12a7	["*"]	\N	2021-12-24 13:30:27	2021-12-24 13:30:27
146	App\\Models\\User	1	token	fdb3a0c966b82d5af058193c53643a796c63c13a3f91f22e62feb73d101cb765	["*"]	\N	2021-12-24 13:40:44	2021-12-24 13:40:44
147	App\\Models\\User	4	token	683723484738664276fd3a9c4935074ce547d0e0f6a9e884f73b5841047aae75	["*"]	\N	2021-12-24 14:39:47	2021-12-24 14:39:47
148	App\\Models\\User	6	token	fa948197177ed743f78906b022e4273335477fb4f17af76297cdf3d885bf1e12	["*"]	\N	2021-12-24 14:41:44	2021-12-24 14:41:44
149	App\\Models\\User	1	token	cadbd783689570bdec3700f10e39fb996d18d16e59023fca2aabf9f82059d041	["*"]	\N	2021-12-24 14:43:00	2021-12-24 14:43:00
150	App\\Models\\User	4	token	bd542dc79b687f62e61a3b38263e15d081d21bbd176b66432de338ae41c9620d	["*"]	\N	2021-12-24 14:44:40	2021-12-24 14:44:40
151	App\\Models\\User	4	token	e34de99fde0d67abaa531c64f078e17d71c5cb63a141ce73460d00f3b30edaa7	["*"]	\N	2021-12-24 14:44:41	2021-12-24 14:44:41
152	App\\Models\\User	6	token	10eaa93a3ba7e4bf3a0e365f9c52ef6d92258e7e146dcef830f628a7fd89c2b6	["*"]	\N	2021-12-24 14:46:12	2021-12-24 14:46:12
153	App\\Models\\User	6	token	febaccb4fd97bd480e64f1865206d449a3485e1d2519dc43ccea1140a4dfbe32	["*"]	\N	2021-12-24 14:46:12	2021-12-24 14:46:12
154	App\\Models\\User	4	token	920e0a283bbf986ee9a95ebeee7a8081adbf9582a78a2020a6f89fd9bb681e57	["*"]	\N	2021-12-24 14:47:22	2021-12-24 14:47:22
155	App\\Models\\User	4	token	2e90bc0807808fe5cc607680d2fd50c557d3a10abb43b45e1abe0f8449a70360	["*"]	\N	2021-12-24 14:47:22	2021-12-24 14:47:22
156	App\\Models\\User	1	token	45b6fff43131b193e1acc9e09b73d9447367bb9b8df52bf9c3acc58994b44176	["*"]	\N	2021-12-24 14:49:01	2021-12-24 14:49:01
157	App\\Models\\User	1	token	0dff855431e3f8e7ce808dfcf6e467187135c47f8d551d9fe9f60993b07c9b2b	["*"]	\N	2021-12-24 14:49:02	2021-12-24 14:49:02
158	App\\Models\\User	4	token	62aee8181bf0762b5a9f05c321703721571e217b00ce56f68f05af7e7f193478	["*"]	\N	2021-12-24 15:02:06	2021-12-24 15:02:06
159	App\\Models\\User	4	token	edf6a11c93f3af08781d531e75a637d7a53d4af7e302b85a0a65f700dd2f365d	["*"]	\N	2021-12-24 15:02:06	2021-12-24 15:02:06
160	App\\Models\\User	6	token	8231234404543990194aeb579268755e4ae974e4164bab9338e5dff196bed2f2	["*"]	\N	2021-12-24 15:03:17	2021-12-24 15:03:17
161	App\\Models\\User	1	token	1aed79020d6511aef655983e24cfcabd0ae0bdf86186bc95d2d63b1d6fc88b86	["*"]	\N	2021-12-24 15:07:01	2021-12-24 15:07:01
162	App\\Models\\User	4	token	d92767240ea34bc21f68a1cf441546cf94ecf7f32c35e422e29cb5d03be89cba	["*"]	\N	2021-12-24 17:30:22	2021-12-24 17:30:22
163	App\\Models\\User	1	token	51d1d18437d6000a2b6da26b4a00405a966828129ad5aad7fd2d07a63727f227	["*"]	\N	2021-12-24 17:33:31	2021-12-24 17:33:31
164	App\\Models\\User	4	token	be4b1d0b784d00706bc7316e4c62f7928e662d00472fe72084ec81ba875dd276	["*"]	\N	2021-12-24 17:42:24	2021-12-24 17:42:24
165	App\\Models\\User	1	token	10c0d8f8428ab1ddf7257cfb13b714728c39dd637c12a13235ad7dd6d408a365	["*"]	\N	2021-12-24 17:43:00	2021-12-24 17:43:00
166	App\\Models\\User	4	token	9bffd4971018c96b5a5f721692facf7ac36c7df5b2233a8ee9cd22349ad1f8fa	["*"]	\N	2021-12-24 17:49:27	2021-12-24 17:49:27
167	App\\Models\\User	1	token	f774c92ea98eb6a3157993bd2d5bb0a64d85e251844fd4caa76247afe494a990	["*"]	\N	2021-12-24 17:50:28	2021-12-24 17:50:28
168	App\\Models\\User	4	token	50c7ef7cff6692f3604c8a8cff48ba6abd0eba651b25eed1f347d7489058fdaa	["*"]	\N	2021-12-24 20:16:28	2021-12-24 20:16:28
169	App\\Models\\User	1	token	71ca610ea08394dee47e8de0c4e645cf2b349b7e4ed30984da15348fafdc834e	["*"]	\N	2021-12-24 20:17:22	2021-12-24 20:17:22
170	App\\Models\\User	4	token	e31d5378000362a63392c76480de7dd7154c88f969e20d9cddff074c6d50341c	["*"]	\N	2021-12-24 20:18:31	2021-12-24 20:18:31
171	App\\Models\\User	6	token	504715c425153103945b3642fb5178e03768a700ad62d411f27adaa2d8cf05a1	["*"]	\N	2021-12-26 07:40:00	2021-12-26 07:40:00
172	App\\Models\\User	1	token	d4a45327509758624f3f9b52bdf39b99da7098c638cfbac9aba2cf3da45cd6cf	["*"]	\N	2021-12-26 09:08:55	2021-12-26 09:08:55
173	App\\Models\\User	7	token	0e496d8f1e08f6e2bef7aeecb1e937fcf3b83c29d8c10882031bda0fc7193647	["*"]	\N	2021-12-26 10:58:39	2021-12-26 10:58:39
174	App\\Models\\User	8	token	587b1eefed854e4e214a6283e15f91ea7c0ad6eea12eaaabccdf62648abfc353	["*"]	\N	2021-12-26 11:01:51	2021-12-26 11:01:51
175	App\\Models\\User	4	token	6b339fffcec9277be669d4b9039f3bd737a61a7f8f9eb3fe491d1f7a87f0b14a	["*"]	\N	2021-12-26 11:10:33	2021-12-26 11:10:33
176	App\\Models\\User	7	token	11bd0598a67ec052be373c042bc59451c6dcc127a1e75c2cdb4be96aa9066314	["*"]	\N	2021-12-26 11:11:21	2021-12-26 11:11:21
177	App\\Models\\User	8	token	f746c8e6f55329efc3ff69699e471f2d4e0bfd7d5710bbd4d7305cac7e2c1d34	["*"]	\N	2021-12-26 11:16:00	2021-12-26 11:16:00
178	App\\Models\\User	4	token	d9ae4739b349e1553f627d3fec876af8aa9e640eabd210d6d46180c5d392fa2c	["*"]	\N	2021-12-26 11:17:44	2021-12-26 11:17:44
179	App\\Models\\User	8	token	b70eef9f01554f14d3c51095ee2ef528b04bd3b80d1ec7359bef887aff6a4e5a	["*"]	\N	2021-12-26 11:19:01	2021-12-26 11:19:01
180	App\\Models\\User	8	token	fb67e51ced2ce19b54ed271d772de9fbf941dadeba8cedafd4eac3520f8f86da	["*"]	\N	2021-12-26 11:23:19	2021-12-26 11:23:19
181	App\\Models\\User	4	token	1a5e423ef07b002801de2b390e190625f7fa2852faf97b93e816b0ec302adcee	["*"]	\N	2021-12-26 11:24:46	2021-12-26 11:24:46
182	App\\Models\\User	7	token	810726dd7c12ab845926ed82b392e98f2f4018e8460ba2ce10d2c5a8c6383add	["*"]	\N	2021-12-26 11:25:28	2021-12-26 11:25:28
183	App\\Models\\User	4	token	f9f798747bb61c6cf5ed8063f86f1cbea4609814e920394981457cd944c9070f	["*"]	\N	2021-12-26 11:26:23	2021-12-26 11:26:23
184	App\\Models\\User	7	token	27c8d54e2cc7b4dd04779d8eaae65e9c86f2ee47858e12801d798647d2881369	["*"]	\N	2021-12-26 11:26:50	2021-12-26 11:26:50
185	App\\Models\\User	4	token	722dc1af9f6b6070df4c01b006a6e1ec462910859ee561ff241814c42bc8339d	["*"]	\N	2021-12-26 11:27:23	2021-12-26 11:27:23
186	App\\Models\\User	7	token	6d3574dd3763ae235eba2e56f2a15e7a7b7567ce5f7e8bfadc7624ebabf7856e	["*"]	\N	2021-12-26 11:28:22	2021-12-26 11:28:22
187	App\\Models\\User	6	token	f20a8ea1b6e9975ed5200cf8b763fdf163f48bd624ad938074fe8d3b695f94e4	["*"]	\N	2021-12-26 11:30:55	2021-12-26 11:30:55
188	App\\Models\\User	7	token	a5e2c1cc0fe6805e1ac9d7c25bf73c73c1141a0c8c5bccd435f582feb325a270	["*"]	\N	2021-12-26 11:36:24	2021-12-26 11:36:24
189	App\\Models\\User	6	token	add2d54d2280ac74f6eb2dd43ccb73b2d9b6540adde82bcc92b46a6e952efcbb	["*"]	\N	2021-12-26 11:37:30	2021-12-26 11:37:30
190	App\\Models\\User	7	token	115bc70533164446d44dcad560bbca8184098014ef97939d1437c26ddcd14388	["*"]	\N	2021-12-26 11:38:50	2021-12-26 11:38:50
191	App\\Models\\User	6	token	75b39b44bac9e700ab0dad5b6388bd75cda20acaf63c17de7ce8c5ebf5b40991	["*"]	\N	2021-12-26 11:40:14	2021-12-26 11:40:14
192	App\\Models\\User	7	token	239a12bba2f8f325b51bc33cab2ef6c330b7c69871a681649b7b1d02c4ae958c	["*"]	\N	2021-12-26 11:52:22	2021-12-26 11:52:22
193	App\\Models\\User	8	token	5147eefcb6c5a4fbaec8b4d1ce058b4370d0ade6bcb72593439b1f4ee1892603	["*"]	\N	2021-12-26 12:01:13	2021-12-26 12:01:13
194	App\\Models\\User	7	token	2215b22397b4ad49579fcb5599a92ec2eb9b56fe63637b6f5aac4dfbfdc1ffa3	["*"]	\N	2021-12-26 12:03:34	2021-12-26 12:03:34
195	App\\Models\\User	1	token	ec0591562a2e0dfbe26899c7d1344e66c0b5d98982b41985cc6d1efb2082535c	["*"]	\N	2021-12-26 12:07:24	2021-12-26 12:07:24
196	App\\Models\\User	9	token	0c4ef18c5481be6aa454ab5377125b171e8aa6fcaba68f3054e24ac471d636ed	["*"]	\N	2021-12-26 12:08:43	2021-12-26 12:08:43
197	App\\Models\\User	7	token	812a075017d41883b5168c10f126278a7a20affeee465964dc417d7526690629	["*"]	\N	2021-12-26 12:09:27	2021-12-26 12:09:27
198	App\\Models\\User	1	token	6dfa96f92acd6412bd961bc5c6bf6c386f8ecfc64b89c3b5694ece66556e4719	["*"]	\N	2021-12-26 12:10:19	2021-12-26 12:10:19
199	App\\Models\\User	8	token	a075f0f7a22093f2cb3401264c0dfbc4e61924484c0c2b0ef48a043ae8b3c973	["*"]	\N	2021-12-26 12:18:05	2021-12-26 12:18:05
200	App\\Models\\User	7	token	bb750316e1e135b45a9193099758fa018948d4241970905cd94b8a1a05314ec9	["*"]	\N	2021-12-26 12:24:49	2021-12-26 12:24:49
201	App\\Models\\User	8	token	1cf726db615d47d737e4bd2d9b87ed70c5c86395d29e24e41ef02082c228c618	["*"]	\N	2021-12-26 12:25:26	2021-12-26 12:25:26
202	App\\Models\\User	9	token	913e3ce8cf39a3305247ad8cda38f914535019dd737a6b42283dbb16622b6943	["*"]	\N	2021-12-26 12:25:55	2021-12-26 12:25:55
203	App\\Models\\User	6	token	1a0ae28efe70cedc5d02bf674714da341787fb2822614f944a09da67a1efd72a	["*"]	\N	2021-12-26 12:26:27	2021-12-26 12:26:27
204	App\\Models\\User	8	token	9e20a2a88cce4479a0ae715f88ddf66ea05753d1e7ecd72581790ad50cef5ecc	["*"]	\N	2021-12-26 13:40:19	2021-12-26 13:40:19
205	App\\Models\\User	7	token	457e001b24e1f8e0a0167b50c3f0af6022e21ef74552acb16192a3ce5ad764e9	["*"]	\N	2021-12-26 15:06:43	2021-12-26 15:06:43
206	App\\Models\\User	10	token	24dae42c0ea2597dac1a78fa54d967a2c0abef5b85c5defb84f536dfea931c55	["*"]	\N	2021-12-26 15:19:42	2021-12-26 15:19:42
207	App\\Models\\User	7	token	94a4fe628770b51f086fa7dfb54782b74005d8d921bacc7ec012bc61f0338a4d	["*"]	\N	2021-12-26 15:22:05	2021-12-26 15:22:05
208	App\\Models\\User	10	token	876586fc6183fc7f60c6e13649d95009266cf789c3943f1b4a26252037037595	["*"]	\N	2021-12-26 15:41:21	2021-12-26 15:41:21
209	App\\Models\\User	10	token	3667a0842b0ddfa3af68bb598bb41c8c4fc290bc35e68816bdc327ed90334863	["*"]	\N	2021-12-26 18:55:35	2021-12-26 18:55:35
210	App\\Models\\User	12	token	e9703a5a4d7d310b540a09b7c3cbf325ca7df87a44d846a1988bef551bca2d3a	["*"]	\N	2021-12-26 19:18:54	2021-12-26 19:18:54
211	App\\Models\\User	10	token	22c509256ec7858cf37953291ae7102cfc22739176ba50ee89b47e4999508b5b	["*"]	\N	2021-12-26 19:23:36	2021-12-26 19:23:36
212	App\\Models\\User	14	token	de3e945daefe08d72a935d72f9ebdf71573e9974dab5a61d90bca7e768263a2a	["*"]	\N	2021-12-26 19:25:19	2021-12-26 19:25:19
213	App\\Models\\User	13	token	7b6073460dac7a79fa8cf35788df368fd8be3391dc4fc8cc11020dc1d96ef93f	["*"]	\N	2021-12-26 19:26:19	2021-12-26 19:26:19
214	App\\Models\\User	6	token	ed1518012eead84bce068a7ebeed90233b8f3ac1e53c72219f68774f4d3b9e32	["*"]	\N	2021-12-26 19:27:24	2021-12-26 19:27:24
215	App\\Models\\User	6	token	e42d3e404fae4dcdb65fc9f5413c247b57941b3003f23a134c60c24810edf52c	["*"]	\N	2021-12-26 19:27:25	2021-12-26 19:27:25
216	App\\Models\\User	10	token	225c68957fc35c867f0cd594375c34e7f6d4edee9018963b831b8e57c4f68e42	["*"]	\N	2021-12-27 05:41:25	2021-12-27 05:41:25
217	App\\Models\\User	7	token	2432b88b9ebed8af2c1f94e38b58645176fbcfb8f2de08d1bca757cb854a6198	["*"]	\N	2021-12-27 05:42:11	2021-12-27 05:42:11
218	App\\Models\\User	10	token	59a0af2e3b09c11b156d582499efeaa363a70ad174e453099a5e141785d1f222	["*"]	\N	2021-12-27 05:59:18	2021-12-27 05:59:18
219	App\\Models\\User	7	token	cbdd7578cced168d640f70a127fa6b40df2b453d9e81243ba6ce759cac994ca6	["*"]	\N	2021-12-27 06:01:50	2021-12-27 06:01:50
220	App\\Models\\User	7	token	d60e5506e0f4381b3a121682e1af6e6c452cef524ef9b8d089b61ca00873a246	["*"]	\N	2021-12-27 06:01:51	2021-12-27 06:01:51
221	App\\Models\\User	10	token	ccd413ce09dba1365955c91ad034ff8f2ff18b1207ba71e5607488ee6177f4ce	["*"]	\N	2021-12-27 06:02:30	2021-12-27 06:02:30
222	App\\Models\\User	13	token	9b9e86d8c8cd6e64e125c0833e458145284214976fdcbefa74efc99520dfbe8b	["*"]	\N	2021-12-27 06:04:22	2021-12-27 06:04:22
223	App\\Models\\User	6	token	3199517416b61647044f0d846ae0666eeae7462c1d7254b6b1293b039d6ddd7c	["*"]	\N	2021-12-27 06:16:13	2021-12-27 06:16:13
224	App\\Models\\User	4	token	1562847895cfc267cf9c8cae4f3b402116357af135298b2f8bf6b4a49fe292fb	["*"]	\N	2021-12-27 06:33:48	2021-12-27 06:33:48
225	App\\Models\\User	6	token	9e0a808e794d263e2b41810cba249c80a6850618158dab3e85ee557a66fbc1ce	["*"]	\N	2021-12-27 06:35:41	2021-12-27 06:35:41
226	App\\Models\\User	7	token	956180bdf7f2433dbd572829dd0b349497e8d783a900f8b529f59dc1ec85e0b2	["*"]	\N	2021-12-27 06:39:12	2021-12-27 06:39:12
227	App\\Models\\User	6	token	7338167b17d62db46a325566665678a51c6ac824d55df0440cb74f472132c8d5	["*"]	\N	2021-12-27 06:39:58	2021-12-27 06:39:58
228	App\\Models\\User	4	token	4e01dd836e1d8c5851b2b0a40e6834d5c5c4f72b8b04068c66165c35347d7c56	["*"]	\N	2021-12-27 06:43:47	2021-12-27 06:43:47
229	App\\Models\\User	6	token	b88c8e3b1a8b204a06ee2b346cfa404d37999f68e68b8f844c2ec2e42b3ca40d	["*"]	\N	2021-12-27 06:50:58	2021-12-27 06:50:58
230	App\\Models\\User	4	token	89895d552e4c95c3a26a82521d8ae6f6bf531712987ae4d8f9e94e40be485184	["*"]	\N	2021-12-27 06:52:21	2021-12-27 06:52:21
231	App\\Models\\User	6	token	d7a1cf039c1d2063014b98f81094d5857be36916b2962bf35facdaa7f3ca3ad1	["*"]	\N	2021-12-27 06:56:08	2021-12-27 06:56:08
232	App\\Models\\User	13	token	4a6075c6387721e265132921060a1af448789812d5c05bc22ab2bf557e7c013d	["*"]	\N	2021-12-27 06:58:02	2021-12-27 06:58:02
233	App\\Models\\User	7	token	24d1761c424300a0c7e56aebac5113f99bec94943911aeebfc057ada3a142b9f	["*"]	\N	2021-12-27 06:58:38	2021-12-27 06:58:38
234	App\\Models\\User	15	token	7a690bf033d88265b6d5fefd432a7feffde8b9c0513d8dfaf6526b3dffd0e3b5	["*"]	\N	2021-12-27 06:59:48	2021-12-27 06:59:48
235	App\\Models\\User	17	token	d34a6c57b97dd6842c5d0b352ee69815f6ee907b1e8a2188310130adfbad515f	["*"]	\N	2021-12-27 07:01:27	2021-12-27 07:01:27
236	App\\Models\\User	15	token	65dfc88b5fc63fbbd4cb09e9bd3e6c917aae6b855ff4b244cfafc26fcb63aea6	["*"]	\N	2021-12-27 07:04:26	2021-12-27 07:04:26
237	App\\Models\\User	18	token	87d3bdea40089e391084888fe93e7b1de226cc6693b8826f405330d0cfc17495	["*"]	\N	2021-12-27 07:05:24	2021-12-27 07:05:24
238	App\\Models\\User	15	token	c6d70f09d223ad999feb9b76a9ed66c4fb3f4896caf21d2b8c38e331bf141a0f	["*"]	\N	2021-12-27 07:06:23	2021-12-27 07:06:23
239	App\\Models\\User	19	token	aa096ee0722c4c74d688a1e6084b6073c402cc7190099f7a892c7c3baa913201	["*"]	\N	2021-12-27 07:07:17	2021-12-27 07:07:17
240	App\\Models\\User	6	token	77010448b9f1e28072cbe985d53a583b40f125f39b98d4328ff51c8bf21c0b1b	["*"]	\N	2021-12-27 07:08:07	2021-12-27 07:08:07
241	App\\Models\\User	19	token	8eec84e34782d058e948825a36d02b386df6657a089e0ea77f59a1e9384169c8	["*"]	\N	2021-12-27 07:09:42	2021-12-27 07:09:42
242	App\\Models\\User	7	token	32cff9e6edd01c30cff9c1472d415ae01bcbc2c4759fb53e04a415d5c105557a	["*"]	\N	2021-12-27 08:14:21	2021-12-27 08:14:21
243	App\\Models\\User	20	token	c18d8da310b2c63282c8760a2f8fd7d9a427b07c560566464429d9decc17403d	["*"]	\N	2021-12-27 08:22:46	2021-12-27 08:22:46
244	App\\Models\\User	7	token	563f0a36b3774699203eb97080b22c3354b8d9fa145f7dfe3f4424dc07746c3b	["*"]	\N	2021-12-27 08:23:57	2021-12-27 08:23:57
245	App\\Models\\User	20	token	b07a477011bc10f7c933838677b4320071e51088b271b707ca8d858780902d82	["*"]	\N	2021-12-27 08:24:53	2021-12-27 08:24:53
246	App\\Models\\User	7	token	05fdef65f58973b1d72df714d9c813292676ee496cbf5fbee6b35b83db5c3b53	["*"]	\N	2021-12-27 08:31:20	2021-12-27 08:31:20
247	App\\Models\\User	23	token	4874d1af37c73d75ebc0b6e28d4ae34a23ecd4d49192d992ea80dd4114002856	["*"]	\N	2021-12-27 08:40:30	2021-12-27 08:40:30
248	App\\Models\\User	21	token	839551d5763d6b39c87089ede18e01aa5a2b473f14f64ecbc6eef27c18202d6f	["*"]	\N	2021-12-27 08:56:25	2021-12-27 08:56:25
249	App\\Models\\User	22	token	664997537532c3facdcfb15a5a4d0b1f005e4fa341feb9e689eaf34fc3b21d83	["*"]	\N	2021-12-27 09:02:16	2021-12-27 09:02:16
250	App\\Models\\User	6	token	d0fa8dbacd8a2759462385f4c2327bda99d8645a6a7fc46c9927748c63c86ece	["*"]	\N	2021-12-27 09:03:58	2021-12-27 09:03:58
251	App\\Models\\User	22	token	167588dbe3aa9f010ee814eb8bb969b6c8cc3fabf7940cbb6c796d7e9e2f82c9	["*"]	\N	2021-12-27 09:10:25	2021-12-27 09:10:25
252	App\\Models\\User	21	token	fd54be27380b4f33082cb66dc9e71b53f41cce0865685499d19f77901679969f	["*"]	\N	2021-12-27 09:12:23	2021-12-27 09:12:23
253	App\\Models\\User	22	token	471556c8d0f91a31136196737bc9ca91f96deb09f83b35f20d055dc940bcf27c	["*"]	\N	2021-12-27 09:14:56	2021-12-27 09:14:56
254	App\\Models\\User	6	token	a1bee0883c8f6a4c83b980623635ae8d213f824272aa8ef570f589a7aec27b0d	["*"]	\N	2021-12-27 09:16:47	2021-12-27 09:16:47
255	App\\Models\\User	22	token	694b9b96aa57975bc1486196e29a4f6142cc7311fb95e6c831eff0ac054773ac	["*"]	\N	2021-12-27 22:13:21	2021-12-27 22:13:21
256	App\\Models\\User	8	token	8af712ca2047d4c5e30219c819e9fb76d9a232c5341830504d2a3af72f1e2fbc	["*"]	\N	2021-12-27 22:24:39	2021-12-27 22:24:39
257	App\\Models\\User	7	token	0ac21febd8baf6df6da19724d023df879ab04e47c326e3e129f824235fa50ae1	["*"]	\N	2021-12-27 22:32:26	2021-12-27 22:32:26
258	App\\Models\\User	4	token	db4eabb4317d6395586dd949bf8e233e3afbd5df530a30f9ad2e22733befc932	["*"]	\N	2021-12-28 06:43:07	2021-12-28 06:43:07
259	App\\Models\\User	7	token	92ef6dc8c1c7c057bba3dadad9cb6995bfe2392aa915850e7d23179f7cdc54fe	["*"]	\N	2021-12-28 06:45:46	2021-12-28 06:45:46
260	App\\Models\\User	4	token	1c4d29e7ad6b026e615adf90c5bc274697ba722da6f5c8488edc6179b238b181	["*"]	\N	2021-12-28 20:05:11	2021-12-28 20:05:11
261	App\\Models\\User	6	token	d4efbdc7343ba9f46ddc54a9b198d759deb45248b34ba2b00c51c21f5f57afe5	["*"]	\N	2021-12-28 20:28:14	2021-12-28 20:28:14
262	App\\Models\\User	4	token	d5e8aa31d636667c812c9f1531324e14531569430f0251ac9c3ca4aebc9af452	["*"]	\N	2021-12-28 20:30:42	2021-12-28 20:30:42
263	App\\Models\\User	8	token	66a1929bfe130fba9782615ec33d633c78b2552ab9e9755b18d0239c53f786b1	["*"]	\N	2021-12-28 20:31:43	2021-12-28 20:31:43
264	App\\Models\\User	4	token	cec3e141f0641b2da10fb8b3cbb4d07c5cd40b14e39c3c5a18f1eb80fc01a569	["*"]	\N	2021-12-28 21:06:47	2021-12-28 21:06:47
265	App\\Models\\User	6	token	88260d92303056365829fdf17b6080a23133f11664278b39edda0adf450433f8	["*"]	\N	2021-12-28 21:09:06	2021-12-28 21:09:06
266	App\\Models\\User	8	token	356c233b738c8721c0cf8e477c4f571cdd070923f23d27c6e0a19506e4e350ac	["*"]	\N	2021-12-29 05:22:23	2021-12-29 05:22:23
267	App\\Models\\User	6	token	c37831aa3d4af660d3eac015ac8b904d11139ab19872c313cfd4ba4780404f1f	["*"]	\N	2021-12-29 05:23:05	2021-12-29 05:23:05
268	App\\Models\\User	4	token	f5a976a614cea932ddf151bcdfc9b8c056575ee7405de7fd37b86ea9526b2973	["*"]	\N	2021-12-29 05:24:49	2021-12-29 05:24:49
269	App\\Models\\User	8	token	58c8a87ba8ac57290d074f0cc6ea9598e8a9769d996ca69853e8172b129ed432	["*"]	\N	2021-12-29 05:26:34	2021-12-29 05:26:34
270	App\\Models\\User	7	token	886814c72eb15ce79ef5c9cc1f577fc6d707e774e9e77e2679fe8500eef1bfe5	["*"]	\N	2021-12-29 13:11:12	2021-12-29 13:11:12
271	App\\Models\\User	8	token	099d03e9462f6e24c943c7349f32742fd9484bce5412563c2ffd8687b825bc08	["*"]	\N	2021-12-29 13:11:39	2021-12-29 13:11:39
272	App\\Models\\User	9	token	ef1530a383389c552c7bd53c85c50dbc86c622f477ab7f076ff508e5309c8ed3	["*"]	\N	2021-12-30 08:59:18	2021-12-30 08:59:18
273	App\\Models\\User	8	token	3a331dc4870dbaa49e355ee5aab226c5bc9b877c7750ba49bc10fbde43603413	["*"]	\N	2021-12-30 09:04:06	2021-12-30 09:04:06
274	App\\Models\\User	4	token	ca08146b1552ab78d0791cb5a2601ba910308b760d1371cae6095a247558227e	["*"]	\N	2021-12-30 09:06:09	2021-12-30 09:06:09
275	App\\Models\\User	9	token	6c1bb590a0803ee5300748b087809e65833ad3ce9a546e6fc4b4b9617c9d13dc	["*"]	\N	2021-12-30 09:14:21	2021-12-30 09:14:21
276	App\\Models\\User	8	token	ea12e9f4867983fe45b4cb7ef8d59255e0df836e37fbf81413b76faa6dc358d5	["*"]	\N	2021-12-30 09:15:27	2021-12-30 09:15:27
277	App\\Models\\User	9	token	8a29db3d7c609d38315cf1c486c862a609791289d266fc3efc11db2e405c0248	["*"]	\N	2021-12-30 09:16:07	2021-12-30 09:16:07
278	App\\Models\\User	4	token	9206b3f418a9e8d5e7424863bb94f90096cd1150f1b14feccdd319b2345efa09	["*"]	\N	2021-12-30 09:26:03	2021-12-30 09:26:03
279	App\\Models\\User	8	token	f1ff3cbc33317514c4ebb65b35a122c96d5f12671d7e33157015fe393d3c4928	["*"]	\N	2021-12-30 09:26:57	2021-12-30 09:26:57
280	App\\Models\\User	4	token	257d35986ecaef60550330ad3bdb8a8bf03f34353877e9f4388560e36266b2c9	["*"]	\N	2021-12-30 12:22:09	2021-12-30 12:22:09
281	App\\Models\\User	8	token	725fa33981b83eea5b80e1e527edeafe29dfb3412644706428ca6b4f9687b1e6	["*"]	\N	2021-12-30 12:40:00	2021-12-30 12:40:00
282	App\\Models\\User	7	token	b8b2775e339b8cbd1278cf5d83008667a9b138af310f1b73944e6d30a5cd2b86	["*"]	\N	2021-12-30 13:47:50	2021-12-30 13:47:50
283	App\\Models\\User	8	token	6f00ad45cd5d97058ef88c8de29a2a50bfeeaa013d200a7a8f8d6e478870d984	["*"]	\N	2021-12-30 15:13:10	2021-12-30 15:13:10
284	App\\Models\\User	4	token	cb437079350ce55773b43b6ace56c64cbb581e1afbc3c8d1d2bcb7f46de8ba4c	["*"]	\N	2021-12-30 15:19:34	2021-12-30 15:19:34
285	App\\Models\\User	8	token	ff8ab0cb53a6beef7ce7191e3d3a9042043321c351cddfcb15612b24a79871ae	["*"]	\N	2022-01-03 10:37:14	2022-01-03 10:37:14
286	App\\Models\\User	4	token	793b8b2cc62789f353b61bd1e734f734b79b3c32c16eea179aadf1b4454b451b	["*"]	\N	2022-01-03 12:47:02	2022-01-03 12:47:02
287	App\\Models\\User	8	token	53c3a4660b8e2dbf9fe019d738d1b13f673c6a630ec1836a1be45f69a00d437d	["*"]	\N	2022-01-03 12:48:00	2022-01-03 12:48:00
288	App\\Models\\User	7	token	0032be891f36b37ac4e374989736e48a75d390c6a1407beb57240d4d6da179bf	["*"]	\N	2022-01-03 13:55:42	2022-01-03 13:55:42
289	App\\Models\\User	14	token	3c7bb72690b9f6d094b19841ed966c53ca06bd56ce3e622711661fff19cc9e5b	["*"]	\N	2022-01-03 14:38:25	2022-01-03 14:38:25
290	App\\Models\\User	7	token	1d320176a210933b01d9c3e0fb4aeba7a5a1310893c3d7bd81f52a4584847618	["*"]	\N	2022-01-03 14:42:14	2022-01-03 14:42:14
291	App\\Models\\User	10	token	d0a53e8ea07d2f00803b11fa928d5874a5ecb724cb94504148d763ee20d6e03b	["*"]	\N	2022-01-03 14:43:34	2022-01-03 14:43:34
292	App\\Models\\User	7	token	cdde7ce457d0becc5acc913c1ad825788aaff9e2a6762ce7f7c775d47faa91e3	["*"]	\N	2022-01-03 14:45:23	2022-01-03 14:45:23
293	App\\Models\\User	6	token	4bb8e482af7e9be56aa36cb1a867aaf4d53e5da77c1bdc33bbc49423673771b4	["*"]	\N	2022-01-03 15:39:43	2022-01-03 15:39:43
294	App\\Models\\User	7	token	9e619b2a5e5ca91d29e9e1657a71743bfc999afd35e0b398304233a1e9fa8844	["*"]	\N	2022-01-03 19:09:52	2022-01-03 19:09:52
295	App\\Models\\User	14	token	c1d0113ed767b90e393727dd9817f6cca8f4654844677fb780c64ed8912455a2	["*"]	\N	2022-01-03 22:48:11	2022-01-03 22:48:11
296	App\\Models\\User	10	token	ff929127ec128657d18395114b301f5dc7d004dc4c0bf9d4f3a1be7567b9b27e	["*"]	\N	2022-01-03 22:48:51	2022-01-03 22:48:51
297	App\\Models\\User	7	token	eaf92b0688009b8daefefe9886d905b378db34c089c16fb19ea9db9243dc164e	["*"]	\N	2022-01-04 05:59:29	2022-01-04 05:59:29
298	App\\Models\\User	10	token	254196d8d74ecb45235008e7185da8bcf23d6be4aaf4f444e46d779f05f342cc	["*"]	\N	2022-01-04 06:00:59	2022-01-04 06:00:59
299	App\\Models\\User	9	token	0f1a43c8a5581da829a056fb7eb91dab515547e3f4cc0173a5cbbd4e8e288579	["*"]	\N	2022-01-04 06:25:12	2022-01-04 06:25:12
300	App\\Models\\User	8	token	f4d6b70560331e92344d9a403d39eccb6894518622fa66accc3c88fa6a5a9b7a	["*"]	\N	2022-01-04 06:26:15	2022-01-04 06:26:15
301	App\\Models\\User	9	token	c5e39d10f60161a6957f16446884e559186890dbfcacec930edda396c40af6aa	["*"]	\N	2022-01-04 07:29:19	2022-01-04 07:29:19
302	App\\Models\\User	8	token	009ff58d85cabbb8e9175282780a76617c9333607e400086306c455cecf16e8f	["*"]	\N	2022-01-04 07:33:36	2022-01-04 07:33:36
303	App\\Models\\User	4	token	c3e181e3ff6674ea97d8cef04e0745dc55a020908b3a3ccdd3ae062ce2a3e662	["*"]	\N	2022-01-04 07:45:54	2022-01-04 07:45:54
304	App\\Models\\User	6	token	4cc09b65c447330caf899d15e58705e79b5f90f933a3a29899c8c4dd9a1c21d4	["*"]	\N	2022-01-04 07:47:12	2022-01-04 07:47:12
305	App\\Models\\User	8	token	e8500748ff5f4ffa1d993c3bf3f89c8f66c120899b9345baf86fa6de7e07fd36	["*"]	\N	2022-01-04 09:15:05	2022-01-04 09:15:05
306	App\\Models\\User	6	token	75b4c72f0dde5d2c48cc37438a2016ed7e79eb7ab965421c0132ae04c7eb4ace	["*"]	\N	2022-01-04 09:30:24	2022-01-04 09:30:24
307	App\\Models\\User	9	token	f69cddbcc1a7ebed7779d4d71844e794169f47a252c6d06208711374fc52c7d1	["*"]	\N	2022-01-04 09:39:53	2022-01-04 09:39:53
308	App\\Models\\User	8	token	82af9247115bf0005f1341d2605d0dd7872ffe17be1a4f0b6b8505334a759f5b	["*"]	\N	2022-01-04 09:46:18	2022-01-04 09:46:18
309	App\\Models\\User	9	token	9086f6054649c5b0cf77f0fe2fb8ba186ee561a09af9560c1b2cd13fe7f8b704	["*"]	\N	2022-01-04 12:53:21	2022-01-04 12:53:21
310	App\\Models\\User	8	token	7a91dbe15d0d6ba4d057f553b55d53673921f316258bdaa82a4569973f9f86fa	["*"]	\N	2022-01-04 13:06:38	2022-01-04 13:06:38
311	App\\Models\\User	9	token	d3b0ce74fc2cb61ebd26d704f7ae515846b83b02ec5723c23cc8490200337bff	["*"]	\N	2022-01-04 13:15:40	2022-01-04 13:15:40
312	App\\Models\\User	8	token	3ef9ff8cad19645e4ea4a8850d729e0bbf8ea34466aefda056a042bbf12916e7	["*"]	\N	2022-01-04 13:24:24	2022-01-04 13:24:24
313	App\\Models\\User	4	token	262aff5a838236069b3cea62169b1bc6e0466bb45db15f091e53c31e5e3ccb24	["*"]	\N	2022-01-04 14:24:31	2022-01-04 14:24:31
314	App\\Models\\User	6	token	c4d9f7ca8365df04c9740b12be314e32b68929fff30d5444b893c6a7c98b07ec	["*"]	\N	2022-01-04 14:25:41	2022-01-04 14:25:41
315	App\\Models\\User	8	token	9978f02ac1c90ac63b388043c4854dc537cfd4d5816e77267bfc15403a1ff8c7	["*"]	\N	2022-01-04 14:27:55	2022-01-04 14:27:55
316	App\\Models\\User	4	token	0768007231cb333fdb486c8dfb683d79ba272dda1eb6d32183400cba7ae94030	["*"]	\N	2022-01-04 14:29:46	2022-01-04 14:29:46
317	App\\Models\\User	6	token	a526e8ba526ff7547181851e083e2b58a204f17db1093857c1dea3d9400dcf94	["*"]	\N	2022-01-04 14:38:03	2022-01-04 14:38:03
318	App\\Models\\User	8	token	fed4d6d66e2101a29efd1079cbefa625bd040227ba1b3a684d996c2052d0cfb4	["*"]	\N	2022-01-05 07:43:04	2022-01-05 07:43:04
319	App\\Models\\User	9	token	9dfe9431f1d13aea12faa4ce0c9c97d51c565a121380b8bf180808c1d9602c6d	["*"]	\N	2022-01-05 07:44:35	2022-01-05 07:44:35
320	App\\Models\\User	9	token	d69b748841551ad81f0d82f4b96958aa71194c0b13c1681c15dff8b6c3dc4bcf	["*"]	\N	2022-01-05 08:50:31	2022-01-05 08:50:31
321	App\\Models\\User	9	token	f6d3b4b49ea900cf8ddb8fccf3e14e759f93b703a3dfb706d1cc35777e55caf6	["*"]	\N	2022-01-05 08:58:58	2022-01-05 08:58:58
322	App\\Models\\User	8	token	e59bfab9756f26d6d71fd1181cc431abb10f349e49df0e847669fa308270b9e6	["*"]	\N	2022-01-05 09:26:17	2022-01-05 09:26:17
323	App\\Models\\User	4	token	bc4d1463ca74d64260e7ab4c87f50d8f7907d03e94deb2e95f5dc9650a748f2d	["*"]	\N	2022-01-05 09:44:49	2022-01-05 09:44:49
324	App\\Models\\User	6	token	dc409e1f9580dcf052296287ae5a34e86d5649869fa9cad7b1d9017fa203e589	["*"]	\N	2022-01-05 09:47:00	2022-01-05 09:47:00
325	App\\Models\\User	6	token	199441f9e41e34c4ed3f5fbcee827e23e9217ed8ba26b3331e3d34034023a968	["*"]	\N	2022-01-05 18:40:57	2022-01-05 18:40:57
326	App\\Models\\User	6	token	3e79953fa880744641fcc84600f06c311eba88f83dd027b9034a83ec6ae3a1a7	["*"]	\N	2022-01-05 21:09:46	2022-01-05 21:09:46
327	App\\Models\\User	4	token	2766c1342b2c2d503582c9c888855fb7d6b6d4828901679beb56de0fbb3fe7e0	["*"]	\N	2022-01-06 05:51:58	2022-01-06 05:51:58
328	App\\Models\\User	6	token	dfa3ec88f67bffd64335e7af37b1d2bcbf31210d565cf50778ef515f33e21df3	["*"]	\N	2022-01-06 06:58:16	2022-01-06 06:58:16
329	App\\Models\\User	13	token	40ca4b295edf36ad1205c1bce0ae32a002c82c5ac51d4d4fe694203eea3a4111	["*"]	\N	2022-01-06 06:59:20	2022-01-06 06:59:20
330	App\\Models\\User	4	token	5c6c0b47796abe091bc1aed0c8591fbb2682534a754ec0db58cf2976741a109e	["*"]	\N	2022-01-06 07:00:26	2022-01-06 07:00:26
331	App\\Models\\User	8	token	f97500e4197c4cde38f8d2d18c4d5ed899a85c90f82e880b381412a4b1c43146	["*"]	\N	2022-01-06 07:18:05	2022-01-06 07:18:05
332	App\\Models\\User	9	token	da97f9aaa422b82d32095c6550dd7886930eb7fcb58a008d37f10089f4b7b4ad	["*"]	\N	2022-01-06 08:49:13	2022-01-06 08:49:13
333	App\\Models\\User	12	token	c0475ad40b26b58361c906f327b2e9461a222b8b94c0f1322d818c229f0acadf	["*"]	\N	2022-01-06 08:52:06	2022-01-06 08:52:06
334	App\\Models\\User	14	token	ea29657d802e95f622aec549a9e908f860ef7453ffdbbd1d7a010a034e9d6874	["*"]	\N	2022-01-06 09:02:10	2022-01-06 09:02:10
335	App\\Models\\User	13	token	fd9111b1a29fbf3823ecd110507cac87bf0f52758bb72b876200489e56f348d8	["*"]	\N	2022-01-06 09:06:48	2022-01-06 09:06:48
336	App\\Models\\User	6	token	b0feea831cc9e36d2a0b45e66e54b7968f122bc09fce7205337ece051456b5d5	["*"]	\N	2022-01-06 09:08:43	2022-01-06 09:08:43
337	App\\Models\\User	4	token	7768d325dbf30c0948006f1902e487fc315398c62c7ece1b7f50ec3ce63f4163	["*"]	\N	2022-01-06 09:31:41	2022-01-06 09:31:41
338	App\\Models\\User	13	token	dd6cd7024cf76b551cdda2269b88703b7f018b81ce2dd490472ecb949711fd6a	["*"]	\N	2022-01-06 09:32:45	2022-01-06 09:32:45
339	App\\Models\\User	12	token	9de83e8f469da28a8206162e78f5f43253fe04c34d5bf6097fe6cc04865df947	["*"]	\N	2022-01-06 09:39:44	2022-01-06 09:39:44
340	App\\Models\\User	14	token	5d436dd3f7a649fa1427dd51829f189ef8336b3a26d8e66b8ff942abb94a9dd5	["*"]	\N	2022-01-06 09:48:17	2022-01-06 09:48:17
341	App\\Models\\User	13	token	eb564a1ed60bf66ed8f28fa863fb13602dfdf25641935f6198799920e6716aea	["*"]	\N	2022-01-06 09:56:31	2022-01-06 09:56:31
342	App\\Models\\User	14	token	157527b64ddfd109a708d05c0ed40bf519b471af65ff8f5bbf86e872670bdff3	["*"]	\N	2022-01-06 09:58:53	2022-01-06 09:58:53
343	App\\Models\\User	4	token	3f41a168aed22176bed15e23cc93f5bb3d2112fa65cb931486c4d319f8e16aad	["*"]	\N	2022-01-07 05:51:18	2022-01-07 05:51:18
344	App\\Models\\User	6	token	27101371ae733ccd3161015fcfa225cb2c474f831ba95ecfc68051a20e99bfbc	["*"]	\N	2022-01-11 05:49:42	2022-01-11 05:49:42
345	App\\Models\\User	4	token	d32eb444e413e50c85d0457fb4fb0709b566203d23b4a22e97c1cd73d3eb11f7	["*"]	\N	2022-01-11 08:04:42	2022-01-11 08:04:42
346	App\\Models\\User	4	token	6856e6b845595f21353b837ff3a9a0182494a6a7cbbfdc7a3baef86ca7e9cfbf	["*"]	\N	2022-01-11 08:07:48	2022-01-11 08:07:48
347	App\\Models\\User	7	token	e07a53c0d730d153e26a95d958f04d55bc8a1fbde0ac0f55df8e4b11df211d03	["*"]	\N	2022-01-11 10:31:55	2022-01-11 10:31:55
348	App\\Models\\User	7	token	78de68a3a393a31b445dacac1285013ad45fe05b40dfb9d3f5b0874150ae96c0	["*"]	\N	2022-01-11 10:34:48	2022-01-11 10:34:48
349	App\\Models\\User	7	token	e853c43a569e67d6a41aa8702bd0d6eb876bda907fe3b7c4b3ee6218002d01a6	["*"]	\N	2022-01-11 10:35:04	2022-01-11 10:35:04
350	App\\Models\\User	6	token	17cc3707dd62102c8864e3e8d0a2a4aea3ce5329d307c42873a40ddeaa76b3fe	["*"]	\N	2022-01-11 10:36:54	2022-01-11 10:36:54
351	App\\Models\\User	7	token	d60a7c647552a97f340b2430b384deba396f57ce7a11ce716c5cb02cc4257878	["*"]	\N	2022-01-11 10:40:10	2022-01-11 10:40:10
352	App\\Models\\User	7	token	e5511a15227d98b9c224af7742761744bda4b46d1c1a155fd08e94b17f4a2a65	["*"]	\N	2022-01-11 11:50:01	2022-01-11 11:50:01
353	App\\Models\\User	7	token	c2eaf7276872c9b9a990eda9023f8dff1fbbcda363359139ac076b797a157fb4	["*"]	\N	2022-01-11 12:38:50	2022-01-11 12:38:50
354	App\\Models\\User	6	token	33c9c5f81993e8acab24b1d4bd2078a22e47cb66da8d4c69eb6c462ab06a27be	["*"]	\N	2022-01-11 13:41:07	2022-01-11 13:41:07
355	App\\Models\\User	7	token	b1f50f936d2a838cdd83564e170e6dfac57878d9fa24e1c655101b657a03bd9c	["*"]	\N	2022-01-11 13:41:57	2022-01-11 13:41:57
356	App\\Models\\User	6	token	6a3a380c6ee27570a12e349010941f807f181c04a038bb6d996ad2f9dd52f56d	["*"]	\N	2022-01-11 13:46:21	2022-01-11 13:46:21
357	App\\Models\\User	8	token	b769fb83b653fe57fc9ec715eb794418d96dcc8ac9ee014f1a1528c319660c9e	["*"]	\N	2022-01-11 13:47:02	2022-01-11 13:47:02
358	App\\Models\\User	7	token	59a29fc3db7396d866f33e9d7400e2043d8f0b85aca838ff331ab48c9212c04b	["*"]	\N	2022-01-11 14:44:22	2022-01-11 14:44:22
359	App\\Models\\User	7	token	375589b4dadb04d40c8822d47ae664b1608e8192298c1a1d6ef45c15189cf52a	["*"]	\N	2022-01-11 15:33:06	2022-01-11 15:33:06
360	App\\Models\\User	1	token	dd0ec8a1bdeb4e32c92d6ee065351ec942e47c472c1fe963c21b1cf347947692	["*"]	\N	2022-01-11 15:34:35	2022-01-11 15:34:35
361	App\\Models\\User	9	token	fad446c7b82a95cb8a2d2d3135a8ebb6e9803892a38abaf4da27ec3b78b4b607	["*"]	\N	2022-01-11 15:40:00	2022-01-11 15:40:00
362	App\\Models\\User	8	token	4e4b96c8e5433b23eba09e1ee6fb22a38f7f30ab450c89ae9db353309ca053a5	["*"]	\N	2022-01-11 15:48:01	2022-01-11 15:48:01
363	App\\Models\\User	4	token	2bab12bf37246eb091f33c2c203b3a472c010888b64fb6f4702950aeca463410	["*"]	\N	2022-01-11 15:53:30	2022-01-11 15:53:30
364	App\\Models\\User	6	token	4b80003311356a84e7eff3f3fe764a97af41313444253f1f30bd73c70b6831bf	["*"]	\N	2022-01-11 15:56:17	2022-01-11 15:56:17
365	App\\Models\\User	8	token	718eb41f8751481fdc89195770f3fb1c573e8f23fb9828c46bb8cb5b9c1833d4	["*"]	\N	2022-01-11 17:41:58	2022-01-11 17:41:58
366	App\\Models\\User	7	token	e259e6f868f813fee221273fe933a0c4a5a7ca35fa5a1e3449be97fcc134baa3	["*"]	\N	2022-01-11 19:13:27	2022-01-11 19:13:27
367	App\\Models\\User	7	token	61f8caeab94bd57f645fd2d2e613adaa9bec4ad29c35f69b782615ac191abcba	["*"]	\N	2022-01-14 09:03:25	2022-01-14 09:03:25
368	App\\Models\\User	7	token	3b03bb8b7d90da389f20d7a2814ef39ccdfb5a9f4ac9d04b6afe33de55eab64e	["*"]	\N	2022-01-17 13:00:19	2022-01-17 13:00:19
369	App\\Models\\User	7	token	86b9a4462e3357e67c09db24bb98820086103288809efc6eae3719cbca630093	["*"]	\N	2022-01-17 15:15:46	2022-01-17 15:15:46
370	App\\Models\\User	7	token	f6e49a1a1b15b50e44fb1e4d3a9307b06cf3213758537fbdd72b9b65a7f63293	["*"]	\N	2022-01-17 15:15:49	2022-01-17 15:15:49
371	App\\Models\\User	7	token	5c13cb8c606c5eeba0ebc7d90b552681051c74d8eb327ab886fe448398b5391d	["*"]	\N	2022-01-17 15:15:53	2022-01-17 15:15:53
372	App\\Models\\User	7	token	f3317ac226c0bc1e41dcedc510e3ee8f08141c9dcf35cbf6464e34a60653f81e	["*"]	\N	2022-01-17 15:15:56	2022-01-17 15:15:56
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (id, activity_id, gfs_id, unit_cost, unit_count, day, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
1	4	1	100000	5	10	null	\N	\N	t	2022-01-19 19:46:21	\N	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role_title, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
1	Admin	\N	\N	\N	t	2021-12-06 00:00:00	\N	\N
2	Focal Person	\N	\N	\N	t	2021-12-06 00:00:00	\N	\N
4	M & E Officer	\N	\N	\N	t	2021-12-06 00:00:00	\N	\N
3	Executive	\N	\N	\N	t	2021-12-06 00:00:00	\N	\N
5	Head of Department	\N	\N	\N	t	2021-12-06 00:00:00	\N	\N
6	Head of Institution	\N	\N	\N	t	2012-12-06 00:00:00	\N	\N
7	DPP	\N	\N	\N	t	2021-12-06 00:00:00	\N	\N
9	Super Admin	\N	\N	\N	t	2021-12-12 00:00:00	2021-12-26 07:58:44	2021-12-26 07:58:44
8	Super Admin	\N	\N	\N	t	2021-12-12 00:00:00	2021-12-26 08:02:15	2021-12-26 08:02:15
11	Super Admin	\N	\N	\N	t	2021-12-12 00:00:00	2021-12-26 08:05:22	2021-12-26 08:05:22
10	Super Admin	\N	\N	\N	t	2021-12-12 00:00:00	2021-12-26 08:05:26	2021-12-26 08:05:26
12	Super Admin	\N	\N	\N	t	2021-12-26 11:05:34	\N	\N
\.


--
-- Data for Name: rolespermissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolespermissions (id, role_id, permission_id, created_by, updated_by, deleted_by, created_at, updated_at, deleted_at) FROM stdin;
1	2	2	\N	\N	\N	2021-12-20 13:39:19	2021-12-20 13:40:17	2021-12-20 13:40:17
2	2	3	\N	\N	\N	2021-12-20 13:39:19	2021-12-20 13:40:17	2021-12-20 13:40:17
3	2	4	\N	\N	\N	2021-12-20 13:39:19	2021-12-20 13:40:17	2021-12-20 13:40:17
6	1	1	\N	\N	\N	2021-12-20 14:03:17	2021-12-20 14:05:14	2021-12-20 14:05:14
4	2	3	\N	\N	\N	2021-12-20 13:40:17	2021-12-20 14:05:50	2021-12-20 14:05:50
5	2	4	\N	\N	\N	2021-12-20 13:40:17	2021-12-20 14:05:50	2021-12-20 14:05:50
7	1	3	\N	\N	\N	2021-12-20 14:05:14	2021-12-20 14:11:17	2021-12-20 14:11:17
8	1	1	\N	\N	\N	2021-12-20 14:05:14	2021-12-20 14:11:17	2021-12-20 14:11:17
9	2	3	\N	\N	\N	2021-12-20 14:05:50	2021-12-20 14:15:54	2021-12-20 14:15:54
10	2	5	\N	\N	\N	2021-12-20 14:05:50	2021-12-20 14:15:54	2021-12-20 14:15:54
11	2	4	\N	\N	\N	2021-12-20 14:05:50	2021-12-20 14:15:54	2021-12-20 14:15:54
15	2	3	\N	\N	\N	2021-12-20 14:15:54	2021-12-20 14:15:54	2021-12-20 14:15:54
16	2	5	\N	\N	\N	2021-12-20 14:15:54	2021-12-20 14:15:54	2021-12-20 14:15:54
17	2	6	\N	\N	\N	2021-12-20 14:15:54	2021-12-20 14:15:54	2021-12-20 14:15:54
18	2	4	\N	\N	\N	2021-12-20 14:15:54	2021-12-20 14:15:54	2021-12-20 14:15:54
12	1	3	\N	\N	\N	2021-12-20 14:11:17	2021-12-20 14:16:29	2021-12-20 14:16:29
13	1	4	\N	\N	\N	2021-12-20 14:11:17	2021-12-20 14:16:29	2021-12-20 14:16:29
14	1	1	\N	\N	\N	2021-12-20 14:11:17	2021-12-20 14:16:29	2021-12-20 14:16:29
19	2	3	\N	\N	\N	2021-12-20 14:15:54	2021-12-20 14:16:29	2021-12-20 14:16:29
20	2	5	\N	\N	\N	2021-12-20 14:15:54	2021-12-20 14:16:29	2021-12-20 14:16:29
21	2	6	\N	\N	\N	2021-12-20 14:15:54	2021-12-20 14:16:29	2021-12-20 14:16:29
22	2	4	\N	\N	\N	2021-12-20 14:15:54	2021-12-20 14:16:29	2021-12-20 14:16:29
24	1	1	\N	\N	\N	2021-12-20 14:21:18	2021-12-20 14:22:49	2021-12-20 14:22:49
25	1	3	\N	\N	\N	2021-12-20 14:21:18	2021-12-20 14:22:49	2021-12-20 14:22:49
28	1	1	\N	\N	\N	2021-12-20 14:22:49	2021-12-20 14:23:01	2021-12-20 14:23:01
29	1	5	\N	\N	\N	2021-12-20 14:22:49	2021-12-20 14:23:01	2021-12-20 14:23:01
30	1	3	\N	\N	\N	2021-12-20 14:22:49	2021-12-20 14:23:01	2021-12-20 14:23:01
31	1	1	\N	\N	\N	2021-12-20 14:23:01	2021-12-24 13:03:55	2021-12-24 13:03:55
32	1	3	\N	\N	\N	2021-12-20 14:23:01	2021-12-24 13:03:55	2021-12-24 13:03:55
35	6	1	\N	\N	\N	2021-12-24 13:06:08	2021-12-24 13:06:08	2021-12-24 13:06:08
36	6	1	\N	\N	\N	2021-12-24 13:06:08	2021-12-24 13:06:08	2021-12-24 13:06:08
38	7	3	\N	\N	\N	2021-12-24 13:07:04	2021-12-24 13:07:04	2021-12-24 13:07:04
39	7	3	\N	\N	\N	2021-12-24 13:07:04	2021-12-24 13:07:04	2021-12-24 13:07:04
40	7	3	\N	\N	\N	2021-12-24 13:07:04	2021-12-24 13:32:41	2021-12-24 13:32:41
41	7	2	\N	\N	\N	2021-12-24 13:32:41	2021-12-24 13:32:41	2021-12-24 13:32:41
42	7	2	\N	\N	\N	2021-12-24 13:32:41	2021-12-24 13:32:41	2021-12-24 13:32:41
43	7	2	\N	\N	\N	2021-12-24 13:32:41	2021-12-24 13:35:46	2021-12-24 13:35:46
33	1	1	\N	\N	\N	2021-12-24 13:03:55	2021-12-24 14:52:42	2021-12-24 14:52:42
45	1	5	\N	\N	\N	2021-12-24 14:52:42	2021-12-24 14:52:42	2021-12-24 14:52:42
46	1	1	\N	\N	\N	2021-12-24 14:52:42	2021-12-24 14:52:42	2021-12-24 14:52:42
44	7	2	\N	\N	\N	2021-12-24 13:35:46	2021-12-26 07:48:59	2021-12-26 07:48:59
49	7	3	\N	\N	\N	2021-12-26 07:49:34	2021-12-26 07:49:34	2021-12-26 07:49:34
26	2	4	\N	\N	\N	2021-12-20 14:22:13	2021-12-26 07:50:33	2021-12-26 07:50:33
27	2	6	\N	\N	\N	2021-12-20 14:22:13	2021-12-26 07:50:33	2021-12-26 07:50:33
51	2	5	\N	\N	\N	2021-12-26 07:50:33	2021-12-26 07:50:33	2021-12-26 07:50:33
52	2	6	\N	\N	\N	2021-12-26 07:50:33	2021-12-26 07:50:33	2021-12-26 07:50:33
50	7	3	\N	\N	\N	2021-12-26 07:49:34	2021-12-26 07:50:54	2021-12-26 07:50:54
55	7	2	\N	\N	\N	2021-12-26 07:50:54	2021-12-26 07:50:54	2021-12-26 07:50:54
56	7	2	\N	\N	\N	2021-12-26 07:50:54	2021-12-26 07:52:19	2021-12-26 07:52:19
57	7	2	\N	\N	\N	2021-12-26 07:52:44	2021-12-26 07:53:05	2021-12-26 07:53:05
58	7	2	\N	\N	\N	2021-12-26 07:53:05	2021-12-26 07:53:44	2021-12-26 07:53:44
59	7	1	\N	\N	\N	2021-12-26 07:53:05	2021-12-26 07:53:44	2021-12-26 07:53:44
62	12	4	\N	\N	\N	2021-12-26 08:05:57	2021-12-26 08:05:57	2021-12-26 08:05:57
47	1	5	\N	\N	\N	2021-12-24 14:52:42	2021-12-26 10:19:06	2021-12-26 10:19:06
48	1	1	\N	\N	\N	2021-12-24 14:52:42	2021-12-26 10:19:06	2021-12-26 10:19:06
64	1	5	\N	\N	\N	2021-12-26 10:19:07	2021-12-26 10:19:07	2021-12-26 10:19:07
65	1	8	\N	\N	\N	2021-12-26 10:19:07	2021-12-26 10:19:07	2021-12-26 10:19:07
66	1	1	\N	\N	\N	2021-12-26 10:19:07	2021-12-26 10:19:07	2021-12-26 10:19:07
67	1	5	\N	\N	\N	2021-12-26 10:19:07	2021-12-26 10:23:31	2021-12-26 10:23:31
68	1	8	\N	\N	\N	2021-12-26 10:19:07	2021-12-26 10:23:31	2021-12-26 10:23:31
69	1	1	\N	\N	\N	2021-12-26 10:19:07	2021-12-26 10:23:31	2021-12-26 10:23:31
70	1	8	\N	\N	\N	2021-12-26 10:23:31	2021-12-26 10:23:32	2021-12-26 10:23:32
71	1	1	\N	\N	\N	2021-12-26 10:23:31	2021-12-26 10:23:32	2021-12-26 10:23:32
72	1	8	\N	\N	\N	2021-12-26 10:23:32	2021-12-26 10:36:00	2021-12-26 10:36:00
73	1	1	\N	\N	\N	2021-12-26 10:23:32	2021-12-26 10:36:00	2021-12-26 10:36:00
74	1	8	\N	\N	\N	2021-12-26 10:36:00	2021-12-26 10:36:00	2021-12-26 10:36:00
75	1	6	\N	\N	\N	2021-12-26 10:36:00	2021-12-26 10:36:00	2021-12-26 10:36:00
76	1	1	\N	\N	\N	2021-12-26 10:36:00	2021-12-26 10:36:00	2021-12-26 10:36:00
77	1	8	\N	\N	\N	2021-12-26 10:36:00	2021-12-26 10:36:34	2021-12-26 10:36:34
78	1	6	\N	\N	\N	2021-12-26 10:36:00	2021-12-26 10:36:34	2021-12-26 10:36:34
79	1	1	\N	\N	\N	2021-12-26 10:36:00	2021-12-26 10:36:34	2021-12-26 10:36:34
80	1	8	\N	\N	\N	2021-12-26 10:36:34	2021-12-26 10:36:34	2021-12-26 10:36:34
81	1	6	\N	\N	\N	2021-12-26 10:36:34	2021-12-26 10:36:34	2021-12-26 10:36:34
82	1	5	\N	\N	\N	2021-12-26 10:36:34	2021-12-26 10:36:34	2021-12-26 10:36:34
83	1	1	\N	\N	\N	2021-12-26 10:36:34	2021-12-26 10:36:34	2021-12-26 10:36:34
84	1	8	\N	\N	\N	2021-12-26 10:36:35	2021-12-26 10:55:54	2021-12-26 10:55:54
85	1	6	\N	\N	\N	2021-12-26 10:36:35	2021-12-26 10:55:54	2021-12-26 10:55:54
86	1	5	\N	\N	\N	2021-12-26 10:36:35	2021-12-26 10:55:54	2021-12-26 10:55:54
87	1	1	\N	\N	\N	2021-12-26 10:36:35	2021-12-26 10:55:54	2021-12-26 10:55:54
34	5	1	\N	\N	\N	2021-12-24 13:05:56	2021-12-26 11:12:13	2021-12-26 11:12:13
94	5	8	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:12:13	2021-12-26 11:12:13
95	5	1	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:12:13	2021-12-26 11:12:13
96	5	6	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:12:13	2021-12-26 11:12:13
97	5	8	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:12:13	2021-12-26 11:12:13
98	5	1	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:12:13	2021-12-26 11:12:13
99	5	6	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:12:13	2021-12-26 11:12:13
37	6	1	\N	\N	\N	2021-12-24 13:06:08	2021-12-26 11:12:30	2021-12-26 11:12:30
103	6	8	\N	\N	\N	2021-12-26 11:12:30	2021-12-26 11:12:31	2021-12-26 11:12:31
100	5	8	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:26:10	2021-12-26 11:26:10
101	5	1	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:26:10	2021-12-26 11:26:10
60	7	1	\N	\N	\N	2021-12-26 07:53:44	2021-12-26 11:37:01	2021-12-26 11:37:01
61	7	2	\N	\N	\N	2021-12-26 07:53:44	2021-12-26 11:37:01	2021-12-26 11:37:01
88	1	8	\N	\N	\N	2021-12-26 10:55:54	2021-12-26 12:06:43	2021-12-26 12:06:43
89	1	6	\N	\N	\N	2021-12-26 10:55:54	2021-12-26 12:06:43	2021-12-26 12:06:43
53	2	5	\N	\N	\N	2021-12-26 07:50:33	2021-12-27 08:39:18	2021-12-27 08:39:18
54	2	6	\N	\N	\N	2021-12-26 07:50:33	2021-12-27 08:39:18	2021-12-27 08:39:18
63	12	4	\N	\N	\N	2021-12-26 08:05:57	2022-01-20 18:08:31	2022-01-20 18:08:31
104	6	1	\N	\N	\N	2021-12-26 11:12:30	2021-12-26 11:12:31	2021-12-26 11:12:31
105	6	6	\N	\N	\N	2021-12-26 11:12:30	2021-12-26 11:12:31	2021-12-26 11:12:31
106	6	8	\N	\N	\N	2021-12-26 11:12:31	2021-12-26 11:12:48	2021-12-26 11:12:48
107	6	1	\N	\N	\N	2021-12-26 11:12:31	2021-12-26 11:12:48	2021-12-26 11:12:48
108	6	6	\N	\N	\N	2021-12-26 11:12:31	2021-12-26 11:12:48	2021-12-26 11:12:48
109	6	8	\N	\N	\N	2021-12-26 11:12:48	2021-12-26 11:12:49	2021-12-26 11:12:49
110	6	1	\N	\N	\N	2021-12-26 11:12:48	2021-12-26 11:12:49	2021-12-26 11:12:49
111	6	6	\N	\N	\N	2021-12-26 11:12:48	2021-12-26 11:12:49	2021-12-26 11:12:49
102	5	6	\N	\N	\N	2021-12-26 11:12:13	2021-12-26 11:26:10	2021-12-26 11:26:10
115	5	8	\N	\N	\N	2021-12-26 11:26:10	2021-12-26 11:27:09	2021-12-26 11:27:09
116	5	1	\N	\N	\N	2021-12-26 11:26:10	2021-12-26 11:27:09	2021-12-26 11:27:09
117	5	5	\N	\N	\N	2021-12-26 11:26:10	2021-12-26 11:27:09	2021-12-26 11:27:09
118	5	6	\N	\N	\N	2021-12-26 11:26:10	2021-12-26 11:27:09	2021-12-26 11:27:09
119	5	1	\N	\N	\N	2021-12-26 11:27:09	2021-12-26 11:28:46	2021-12-26 11:28:46
120	5	5	\N	\N	\N	2021-12-26 11:27:09	2021-12-26 11:28:46	2021-12-26 11:28:46
121	5	6	\N	\N	\N	2021-12-26 11:27:09	2021-12-26 11:28:46	2021-12-26 11:28:46
112	6	8	\N	\N	\N	2021-12-26 11:12:49	2021-12-26 11:29:15	2021-12-26 11:29:15
113	6	1	\N	\N	\N	2021-12-26 11:12:49	2021-12-26 11:29:15	2021-12-26 11:29:15
114	6	6	\N	\N	\N	2021-12-26 11:12:49	2021-12-26 11:29:15	2021-12-26 11:29:15
125	6	8	\N	\N	\N	2021-12-26 11:29:15	2021-12-26 11:29:15	2021-12-26 11:29:15
126	6	1	\N	\N	\N	2021-12-26 11:29:15	2021-12-26 11:29:15	2021-12-26 11:29:15
127	6	6	\N	\N	\N	2021-12-26 11:29:15	2021-12-26 11:29:15	2021-12-26 11:29:15
131	7	8	\N	\N	\N	2021-12-26 11:37:01	2021-12-26 11:39:54	2021-12-26 11:39:54
132	7	2	\N	\N	\N	2021-12-26 11:37:01	2021-12-26 11:39:54	2021-12-26 11:39:54
90	1	5	\N	\N	\N	2021-12-26 10:55:54	2021-12-26 12:06:43	2021-12-26 12:06:43
91	1	10	\N	\N	\N	2021-12-26 10:55:54	2021-12-26 12:06:43	2021-12-26 12:06:43
92	1	11	\N	\N	\N	2021-12-26 10:55:54	2021-12-26 12:06:43	2021-12-26 12:06:43
93	1	1	\N	\N	\N	2021-12-26 10:55:54	2021-12-26 12:06:43	2021-12-26 12:06:43
138	1	6	\N	\N	\N	2021-12-26 12:06:43	2021-12-26 12:09:47	2021-12-26 12:09:47
139	1	10	\N	\N	\N	2021-12-26 12:06:43	2021-12-26 12:09:47	2021-12-26 12:09:47
133	7	8	\N	\N	\N	2021-12-26 11:39:54	2021-12-26 12:25:05	2021-12-26 12:25:05
134	7	2	\N	\N	\N	2021-12-26 11:39:54	2021-12-26 12:25:05	2021-12-26 12:25:05
135	7	6	\N	\N	\N	2021-12-26 11:39:54	2021-12-26 12:25:05	2021-12-26 12:25:05
140	1	6	\N	\N	\N	2021-12-26 12:09:47	2021-12-27 06:02:15	2021-12-27 06:02:15
141	1	10	\N	\N	\N	2021-12-26 12:09:47	2021-12-27 06:02:15	2021-12-27 06:02:15
142	1	12	\N	\N	\N	2021-12-26 12:09:47	2021-12-27 06:02:15	2021-12-27 06:02:15
143	7	8	\N	\N	\N	2021-12-26 12:25:05	2021-12-27 06:39:41	2021-12-27 06:39:41
144	7	2	\N	\N	\N	2021-12-26 12:25:05	2021-12-27 06:39:41	2021-12-27 06:39:41
145	7	6	\N	\N	\N	2021-12-26 12:25:05	2021-12-27 06:39:41	2021-12-27 06:39:41
146	7	13	\N	\N	\N	2021-12-26 12:25:05	2021-12-27 06:39:41	2021-12-27 06:39:41
156	2	5	\N	\N	\N	2021-12-27 08:39:18	2021-12-27 08:39:56	2021-12-27 08:39:56
157	2	1	\N	\N	\N	2021-12-27 08:39:18	2021-12-27 08:39:56	2021-12-27 08:39:56
158	2	6	\N	\N	\N	2021-12-27 08:39:18	2021-12-27 08:39:56	2021-12-27 08:39:56
159	2	5	\N	\N	\N	2021-12-27 08:39:56	2022-01-04 06:00:14	2022-01-04 06:00:14
160	2	6	\N	\N	\N	2021-12-27 08:39:56	2022-01-04 06:00:14	2022-01-04 06:00:14
147	1	14	\N	\N	\N	2021-12-27 06:02:15	2022-01-04 06:00:38	2022-01-04 06:00:38
148	1	6	\N	\N	\N	2021-12-27 06:02:15	2022-01-04 06:00:38	2022-01-04 06:00:38
149	1	10	\N	\N	\N	2021-12-27 06:02:15	2022-01-04 06:00:38	2022-01-04 06:00:38
150	1	12	\N	\N	\N	2021-12-27 06:02:15	2022-01-04 06:00:38	2022-01-04 06:00:38
161	2	5	\N	\N	\N	2022-01-04 06:00:14	2022-01-19 22:35:47	2022-01-19 22:35:47
162	2	6	\N	\N	\N	2022-01-04 06:00:14	2022-01-19 22:35:47	2022-01-19 22:35:47
163	2	16	\N	\N	\N	2022-01-04 06:00:14	2022-01-19 22:35:47	2022-01-19 22:35:47
169	2	5	\N	\N	\N	2022-01-19 22:35:47	2022-01-19 22:35:47	\N
170	2	6	\N	\N	\N	2022-01-19 22:35:47	2022-01-19 22:35:47	\N
171	2	18	\N	\N	\N	2022-01-19 22:35:47	2022-01-19 22:35:47	\N
172	2	17	\N	\N	\N	2022-01-19 22:35:47	2022-01-19 22:35:47	\N
173	2	16	\N	\N	\N	2022-01-19 22:35:47	2022-01-19 22:35:47	\N
136	4	6	\N	\N	\N	2021-12-26 11:54:43	2022-01-19 22:36:21	2022-01-19 22:36:21
137	4	12	\N	\N	\N	2021-12-26 11:54:43	2022-01-19 22:36:21	2022-01-19 22:36:21
174	4	6	\N	\N	\N	2022-01-19 22:36:21	2022-01-19 22:36:21	\N
175	4	12	\N	\N	\N	2022-01-19 22:36:21	2022-01-19 22:36:21	\N
176	4	18	\N	\N	\N	2022-01-19 22:36:21	2022-01-19 22:36:21	\N
122	5	8	\N	\N	\N	2021-12-26 11:28:46	2022-01-19 22:36:37	2022-01-19 22:36:37
123	5	1	\N	\N	\N	2021-12-26 11:28:46	2022-01-19 22:36:37	2022-01-19 22:36:37
124	5	6	\N	\N	\N	2021-12-26 11:28:46	2022-01-19 22:36:37	2022-01-19 22:36:37
177	5	8	\N	\N	\N	2022-01-19 22:36:37	2022-01-19 22:36:37	\N
178	5	1	\N	\N	\N	2022-01-19 22:36:37	2022-01-19 22:36:37	\N
179	5	6	\N	\N	\N	2022-01-19 22:36:37	2022-01-19 22:36:37	\N
180	5	18	\N	\N	\N	2022-01-19 22:36:37	2022-01-19 22:36:37	\N
128	6	8	\N	\N	\N	2021-12-26 11:29:15	2022-01-19 22:37:00	2022-01-19 22:37:00
129	6	1	\N	\N	\N	2021-12-26 11:29:15	2022-01-19 22:37:00	2022-01-19 22:37:00
130	6	6	\N	\N	\N	2021-12-26 11:29:15	2022-01-19 22:37:00	2022-01-19 22:37:00
181	6	8	\N	\N	\N	2022-01-19 22:37:00	2022-01-19 22:37:00	\N
182	6	18	\N	\N	\N	2022-01-19 22:37:00	2022-01-19 22:37:00	\N
183	6	1	\N	\N	\N	2022-01-19 22:37:00	2022-01-19 22:37:00	\N
184	6	6	\N	\N	\N	2022-01-19 22:37:00	2022-01-19 22:37:00	\N
151	7	8	\N	\N	\N	2021-12-27 06:39:41	2022-01-19 22:37:18	2022-01-19 22:37:18
152	7	15	\N	\N	\N	2021-12-27 06:39:41	2022-01-19 22:37:18	2022-01-19 22:37:18
153	7	2	\N	\N	\N	2021-12-27 06:39:41	2022-01-19 22:37:18	2022-01-19 22:37:18
154	7	6	\N	\N	\N	2021-12-27 06:39:41	2022-01-19 22:37:18	2022-01-19 22:37:18
155	7	13	\N	\N	\N	2021-12-27 06:39:41	2022-01-19 22:37:18	2022-01-19 22:37:18
185	7	8	\N	\N	\N	2022-01-19 22:37:18	2022-01-19 22:37:18	\N
186	7	15	\N	\N	\N	2022-01-19 22:37:18	2022-01-19 22:37:18	\N
187	7	2	\N	\N	\N	2022-01-19 22:37:18	2022-01-19 22:37:18	\N
188	7	6	\N	\N	\N	2022-01-19 22:37:18	2022-01-19 22:37:18	\N
189	7	18	\N	\N	\N	2022-01-19 22:37:18	2022-01-19 22:37:18	\N
190	7	13	\N	\N	\N	2022-01-19 22:37:18	2022-01-19 22:37:18	\N
191	3	15	\N	\N	\N	2022-01-19 22:49:43	2022-01-19 22:49:43	\N
192	3	6	\N	\N	\N	2022-01-19 22:49:43	2022-01-19 22:49:43	\N
193	3	18	\N	\N	\N	2022-01-19 22:49:43	2022-01-19 22:49:43	\N
164	1	14	\N	\N	\N	2022-01-04 06:00:38	2022-01-20 13:57:27	2022-01-20 13:57:27
165	1	6	\N	\N	\N	2022-01-04 06:00:38	2022-01-20 13:57:27	2022-01-20 13:57:27
166	1	10	\N	\N	\N	2022-01-04 06:00:38	2022-01-20 13:57:27	2022-01-20 13:57:27
167	1	12	\N	\N	\N	2022-01-04 06:00:38	2022-01-20 13:57:27	2022-01-20 13:57:27
168	1	16	\N	\N	\N	2022-01-04 06:00:38	2022-01-20 13:57:27	2022-01-20 13:57:27
200	12	4	\N	\N	\N	2022-01-20 18:08:31	2022-01-20 18:08:31	\N
201	12	22	\N	\N	\N	2022-01-20 18:08:31	2022-01-20 18:08:31	\N
194	1	14	\N	\N	\N	2022-01-20 13:57:27	2022-01-20 18:08:57	2022-01-20 18:08:57
195	1	6	\N	\N	\N	2022-01-20 13:57:27	2022-01-20 18:08:57	2022-01-20 18:08:57
196	1	10	\N	\N	\N	2022-01-20 13:57:27	2022-01-20 18:08:57	2022-01-20 18:08:57
197	1	12	\N	\N	\N	2022-01-20 13:57:27	2022-01-20 18:08:57	2022-01-20 18:08:57
198	1	16	\N	\N	\N	2022-01-20 13:57:27	2022-01-20 18:08:57	2022-01-20 18:08:57
199	1	18	\N	\N	\N	2022-01-20 13:57:27	2022-01-20 18:08:57	2022-01-20 18:08:57
202	1	14	\N	\N	\N	2022-01-20 18:08:57	2022-01-20 18:08:57	\N
203	1	6	\N	\N	\N	2022-01-20 18:08:57	2022-01-20 18:08:57	\N
204	1	10	\N	\N	\N	2022-01-20 18:08:57	2022-01-20 18:08:57	\N
205	1	12	\N	\N	\N	2022-01-20 18:08:57	2022-01-20 18:08:57	\N
206	1	22	\N	\N	\N	2022-01-20 18:08:57	2022-01-20 18:08:57	\N
207	1	16	\N	\N	\N	2022-01-20 18:08:57	2022-01-20 18:08:57	\N
208	1	18	\N	\N	\N	2022-01-20 18:08:57	2022-01-20 18:08:57	\N
\.


--
-- Data for Name: subtasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subtasks (id, subtask_desc, maintask_id, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: targets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targets (id, target_code, target_desc, objective_id, created_by, updated_by, deleted_by, status, created_at, updated_at, deleted_at) FROM stdin;
10	JO1D	ICT infrastructure and systems developed and maintained by 90 percent by June, 2022	27	ICT M & E Officer	\N	\N	t	2022-01-20 00:41:46	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, institution_id, role_id, email_verified_at, password, status, remember_token, created_at, updated_at, deleted_at) FROM stdin;
2	Willy Maro	willy@gmail.com	2	4	\N	$2y$10$vM9G70dMfy8QveLuKa5p1uLdDh1pL9nRXMVmkJ5h8V0s5shaYad5G	t	\N	2021-12-09 09:21:26	2021-12-09 09:21:26	\N
3	Victor Malamo	vmalamo@gmail.com	2	1	\N	$2y$10$GctQHIccBaLLHdkF76YufuwJ98ZOpDplORA.2FdOUAJEDavDVeymW	t	\N	2021-12-13 09:05:07	2021-12-13 09:05:07	\N
6	DPP	dpp@gmail.com	1	7	\N	$2y$10$ubCOlTaFKFEOaD/VxhJJ2.9cAh4.pUuMPWkAmTY/61UqZuSTE9maS	t	\N	2021-12-13 18:32:46	2021-12-13 18:32:46	\N
7	Super Admin	superadmin@gmail.com	1	12	\N	$2y$10$/CPvJjQhZMRQLNUG5QKd4OEseAgpoaeghAXo35kT3UOPPkGClMxzy	t	\N	2021-12-26 10:57:44	2021-12-26 10:57:44	\N
8	ICT focal Person	ictfocalperson@gmail.com	1	2	\N	$2y$10$Mtjjb.5uE2BhkumMn0VAae7.sLGx/EBn4x6mjYUTVXuase3w.bK0q	t	\N	2021-12-26 11:00:53	2021-12-26 11:00:53	\N
9	ICT M & E Officer	ictmeofficer@gmail.com	1	4	\N	$2y$10$2aExgUUUd33dig7HuSlqQOS4sl0fzo3WWDOgW/gf5oFwrhySHLf2m	t	\N	2021-12-26 12:00:50	2021-12-26 12:00:50	\N
10	Tawa Admin	tawaadmin@gmail.com	3	1	\N	$2y$10$4zXXTivYJUwCshNQY.R5v.6ZgxO5Vh1E3R00WQMxwJiEBE841oap6	t	\N	2021-12-26 15:19:26	2021-12-26 15:19:26	\N
12	TAWA ME Officer	tawameofficer@gmail.com	3	4	\N	$2y$10$QNqyPGjCNa5vc8hvPWKsw.UsjJD8VOqqBP38k2azX56VxIBMRQRO2	t	\N	2021-12-26 18:52:11	2021-12-26 18:52:11	\N
13	TAWA HEAD	tawahead@gmail.com	3	6	\N	$2y$10$OcRJ9RzB8pdsdqJUxvo1oeTLTYbgUBgHKBugPDB.5xFp3uGs6wsmq	t	\N	2021-12-26 19:07:24	2021-12-26 19:07:24	\N
14	TAWA Focal Person	tawafocalperson@gmail.com	3	2	\N	$2y$10$lViEhj2b9R2T/QvZjOXbxuOFKotYGq2U.JOqcetk1LJJT7UMI9U6y	t	\N	2021-12-26 19:24:17	2021-12-26 19:24:17	\N
15	TANAPA Admin	tanapaadmin@gmail.com	2	1	\N	$2y$10$q7RoYvlrXRNeX2/uhWubH.FonlN2mMkvgTha0BLy8ASGtrcFIMDMy	t	\N	2021-12-27 06:59:31	2021-12-27 06:59:31	\N
17	TANAPA M & E Officer	tanapameofficer@gmail.com	2	4	\N	$2y$10$gGNG.pBa2QcQwvahaI0QKeMnopRHC.SYzJwYPlnxdBbTEIuWAoqp6	t	\N	2021-12-27 07:01:17	2021-12-27 07:01:17	\N
18	TANAPA Focal Person	tanapafocalperson@gmail.com	2	2	\N	$2y$10$5FHhs8FBTUmFi3g3r0gnve5UzNP7t/0u6FRCcW7lMcSj6iNzVT34y	t	\N	2021-12-27 07:05:15	2021-12-27 07:05:15	\N
19	TANAPA Head	tanapahead@gmail.com	2	6	\N	$2y$10$OdeqxtOeltzFIl39.jxr1eHf3Oab.cd8Fv0Qpwh3FghFbrgQ2ODPW	t	\N	2021-12-27 07:07:06	2021-12-27 07:07:06	\N
20	FTI Admin	ftiadmin@gmail.com	5	1	\N	$2y$10$uMRS9iew1h8eh0i1nlW0NOUpVtuvm1QeDXACpz.WiUiCCLovaDhbu	t	\N	2021-12-27 08:21:55	2021-12-27 08:21:55	\N
21	FTI Focal Person	ftifocalperson@gmail.com	5	2	\N	$2y$10$FQrdmqIotXmCT8rb6DgOU.AQsyVMoC2KwQX6cdSQM2K7YvtIO9eTa	t	\N	2021-12-27 08:26:34	2021-12-27 08:26:34	\N
22	FTI Head	ftihead@gmail.com	5	6	\N	$2y$10$6M0v6jnnQbkHnk/SyQ8erepKEvafPIYbKCfr7k/pc83gP0gJojVwy	t	\N	2021-12-27 08:27:55	2021-12-27 08:27:55	\N
23	FTI M & E Officer	ftimeofficer@gmail.com	5	4	\N	$2y$10$vzGLebOxI34hJrHssK.NDeCIiAVm3PknRBFkPtWb2Q.RbI/cLoONi	t	\N	2021-12-27 08:29:03	2021-12-27 08:29:03	\N
26	FtiAdmin	ftiadmin2@gmail.com	5	1	\N	$2y$10$WS67IU0xchoFWcA5zpFfjuhcAXRPPbvgnCovExUub01KXSPHvjurC	t	\N	2022-01-19 16:12:55	2022-01-19 16:12:55	\N
1	Emmanuel Maro	maro.emmanuel1@gmail.com	1	1	\N	$2y$10$OaKHBNx45jNYW7Nw7ibckuE1kH7CCBqAjuHdHnfLSXXEyj97hRjSq	t	\N	2021-12-09 09:11:39	2022-01-19 20:26:11	\N
27	Permanent Secretary	ps@gmail.com	7	3	\N	$2y$10$mN2MC9kbUFX1E6wqxEsa6.eMmyIGQguU.ylkpkaucs117zrEVqxI.	t	\N	2022-01-19 22:50:59	2022-01-19 22:50:59	\N
4	ICT Head	icthead@gmail.com	1	5	\N	$2y$10$Bbsv.8msSYu3OwFe1avtje/zwb3RnE9sUOjPgwBlGiIsR0O0/XhBO	t	\N	2021-12-13 09:44:22	2022-01-19 23:36:52	\N
28	ICT Admin	ictadmin@gmail.com	1	1	\N	$2y$10$zZrQJ3U.XxU7GNv8xS4gpOVJUedBACyOnlettI1QO2FypiKV/f4iG	t	\N	2022-01-20 13:31:56	2022-01-20 13:31:56	\N
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_id_seq', 6, true);


--
-- Name: activityprogress_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activityprogress_logs_id_seq', 123, true);


--
-- Name: activityprogresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activityprogresses_id_seq', 40, true);


--
-- Name: contract_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_progress_id_seq', 15, true);


--
-- Name: contractattachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contractattachments_id_seq', 20, true);


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contracts_id_seq', 21, true);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_id_seq', 53, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: funddisbursements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funddisbursements_id_seq', 10, true);


--
-- Name: gfs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gfs_id_seq', 5, true);


--
-- Name: indicators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indicators_id_seq', 6, true);


--
-- Name: institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institutions_id_seq', 7, true);


--
-- Name: maintasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintasks_id_seq', 11, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 62, true);


--
-- Name: milestones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.milestones_id_seq', 14, true);


--
-- Name: objectives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.objectives_id_seq', 27, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 372, true);


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resources_id_seq', 1, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 12, true);


--
-- Name: rolespermissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rolespermissions_id_seq', 208, true);


--
-- Name: subtasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subtasks_id_seq', 8, true);


--
-- Name: targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.targets_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 28, true);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: activityprogress_logs activityprogress_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activityprogress_logs
    ADD CONSTRAINT activityprogress_logs_pkey PRIMARY KEY (id);


--
-- Name: activityprogresses activityprogresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activityprogresses
    ADD CONSTRAINT activityprogresses_pkey PRIMARY KEY (id);


--
-- Name: contract_progress contract_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_progress
    ADD CONSTRAINT contract_progress_pkey PRIMARY KEY (id);


--
-- Name: contractattachments contractattachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contractattachments
    ADD CONSTRAINT contractattachments_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: funddisbursements funddisbursements_activity_id_milestone_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funddisbursements
    ADD CONSTRAINT funddisbursements_activity_id_milestone_id_unique UNIQUE (activity_id, milestone_id);


--
-- Name: funddisbursements funddisbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funddisbursements
    ADD CONSTRAINT funddisbursements_pkey PRIMARY KEY (id);


--
-- Name: gfs gfs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gfs
    ADD CONSTRAINT gfs_pkey PRIMARY KEY (id);


--
-- Name: indicators indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicators
    ADD CONSTRAINT indicators_pkey PRIMARY KEY (id);


--
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (id);


--
-- Name: maintasks maintasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintasks
    ADD CONSTRAINT maintasks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: milestones milestones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT milestones_pkey PRIMARY KEY (id);


--
-- Name: objectives objectives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objectives
    ADD CONSTRAINT objectives_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: rolespermissions rolespermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolespermissions
    ADD CONSTRAINT rolespermissions_pkey PRIMARY KEY (id);


--
-- Name: subtasks subtasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtasks
    ADD CONSTRAINT subtasks_pkey PRIMARY KEY (id);


--
-- Name: targets targets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- PostgreSQL database dump complete
--

