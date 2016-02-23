-- set datetime precision --

ALTER TABLE ACT_HI_CASEINST
  MODIFY COLUMN CREATE_TIME_ datetime(3) not null;

ALTER TABLE ACT_HI_CASEINST
  MODIFY COLUMN CLOSE_TIME_ datetime(3);

ALTER TABLE ACT_HI_CASEACTINST
  MODIFY COLUMN CREATE_TIME_ datetime(3) not null;

ALTER TABLE ACT_HI_CASEACTINST
  MODIFY COLUMN END_TIME_ datetime(3);

ALTER TABLE ACT_HI_DECINST
  MODIFY COLUMN EVAL_TIME_ datetime(3) not null;

ALTER TABLE ACT_RU_TASK
  MODIFY COLUMN DUE_DATE_ datetime(3);

ALTER TABLE ACT_RU_TASK
  MODIFY COLUMN FOLLOW_UP_DATE_ datetime(3);

ALTER TABLE ACT_HI_PROCINST
  MODIFY COLUMN START_TIME_ datetime(3) not null;

ALTER TABLE ACT_HI_PROCINST
  MODIFY COLUMN END_TIME_ datetime(3);

ALTER TABLE ACT_HI_ACTINST
  MODIFY COLUMN START_TIME_ datetime(3) not null;

ALTER TABLE ACT_HI_ACTINST
  MODIFY COLUMN END_TIME_ datetime(3);

ALTER TABLE ACT_HI_TASKINST
  MODIFY COLUMN START_TIME_ datetime(3) not null;

ALTER TABLE ACT_HI_TASKINST
  MODIFY COLUMN END_TIME_ datetime(3);

ALTER TABLE ACT_HI_TASKINST
  MODIFY COLUMN DUE_DATE_ datetime(3);

ALTER TABLE ACT_HI_TASKINST
  MODIFY COLUMN FOLLOW_UP_DATE_ datetime(3);

ALTER TABLE ACT_HI_DETAIL
  MODIFY COLUMN TIME_ datetime(3) not null;

ALTER TABLE ACT_HI_COMMENT
  MODIFY COLUMN TIME_ datetime(3) not null;

-- set timestamp precision --

ALTER TABLE ACT_RE_DEPLOYMENT
  MODIFY COLUMN DEPLOY_TIME_ timestamp(3);

ALTER TABLE ACT_RU_JOB
  MODIFY COLUMN LOCK_EXP_TIME_ timestamp(3) NULL;

ALTER TABLE ACT_RU_JOB
  MODIFY COLUMN DUEDATE_ timestamp(3) NULL;

ALTER TABLE ACT_RU_TASK
  MODIFY COLUMN CREATE_TIME_ timestamp(3);

ALTER TABLE ACT_RU_EVENT_SUBSCR
  MODIFY COLUMN CREATED_ timestamp(3) NOT NULL;

ALTER TABLE ACT_RU_INCIDENT
  MODIFY COLUMN INCIDENT_TIMESTAMP_ timestamp(3) NOT NULL;

ALTER TABLE ACT_RU_METER_LOG
  MODIFY COLUMN TIMESTAMP_ timestamp(3) NOT NULL;

ALTER TABLE ACT_RU_EXT_TASK
  MODIFY COLUMN LOCK_EXP_TIME_ timestamp(3) NULL;

ALTER TABLE ACT_HI_OP_LOG
  MODIFY COLUMN TIMESTAMP_ timestamp(3) NOT NULL;

ALTER TABLE ACT_HI_INCIDENT
  MODIFY COLUMN CREATE_TIME_ timestamp(3) NOT NULL;

ALTER TABLE ACT_HI_INCIDENT
  MODIFY COLUMN END_TIME_ timestamp(3) NULL;

ALTER TABLE ACT_HI_JOB_LOG
  MODIFY COLUMN TIMESTAMP_ timestamp(3) NOT NULL;

ALTER TABLE ACT_HI_JOB_LOG
  MODIFY COLUMN JOB_DUEDATE_ timestamp(3) NULL;

-- tenant id --

ALTER TABLE ACT_RE_DEPLOYMENT
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_DEPLOYMENT_TENANT_ID on ACT_RE_DEPLOYMENT(TENANT_ID_);

ALTER TABLE ACT_RE_PROCDEF
  ADD TENANT_ID_ varchar(64);

ALTER TABLE ACT_RE_PROCDEF
   DROP INDEX ACT_UNIQ_PROCDEF;

create index ACT_IDX_PROCDEF_TENANT_ID ON ACT_RE_PROCDEF(TENANT_ID_);

ALTER TABLE ACT_RU_EXECUTION
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_EXEC_TENANT_ID on ACT_RU_EXECUTION(TENANT_ID_);

ALTER TABLE ACT_RU_TASK
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_TASK_TENANT_ID on ACT_RU_TASK(TENANT_ID_);

ALTER TABLE ACT_RU_VARIABLE
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_VARIABLE_TENANT_ID on ACT_RU_VARIABLE(TENANT_ID_);

ALTER TABLE ACT_RU_EVENT_SUBSCR
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_EVENT_SUBSCR_TENANT_ID on ACT_RU_EVENT_SUBSCR(TENANT_ID_);

ALTER TABLE ACT_RU_JOB
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_JOB_TENANT_ID on ACT_RU_JOB(TENANT_ID_);

ALTER TABLE ACT_RU_JOBDEF
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_JOBDEF_TENANT_ID on ACT_RU_JOBDEF(TENANT_ID_);

ALTER TABLE ACT_RU_INCIDENT
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_INC_TENANT_ID on ACT_RU_INCIDENT(TENANT_ID_); 

ALTER TABLE ACT_RU_EXT_TASK
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_EXT_TASK_TENANT_ID on ACT_RU_EXT_TASK(TENANT_ID_); 

ALTER TABLE ACT_RE_DECISION_DEF
       DROP INDEX ACT_UNIQ_DECISION_DEF;

ALTER TABLE ACT_RE_DECISION_DEF
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_DEC_DEF_TENANT_ID on ACT_RE_DECISION_DEF(TENANT_ID_);

ALTER TABLE ACT_RE_CASE_DEF
       DROP INDEX ACT_UNIQ_CASE_DEF;

ALTER TABLE ACT_RE_CASE_DEF
  ADD TENANT_ID_ varchar(64);

create index ACT_IDX_CASE_DEF_TENANT_ID on ACT_RE_CASE_DEF(TENANT_ID_);

-- user on historic decision instance --

ALTER TABLE ACT_HI_DECINST
  ADD USER_ID_ varchar(255);