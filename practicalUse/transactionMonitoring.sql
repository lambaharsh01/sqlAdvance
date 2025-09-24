-- MySQL TRANSACTION MONITORING FOR LOCKS

1. this query lists all currently running InnoDB transactions in MySQL 
2. showing transaction info (columns) and how long the session has been active
3. effectively letting you monitor active and potentially long-running transactions

SELECT 
    trx.trx_id,
    trx.trx_state,
    trx.trx_started,
    trx.trx_mysql_thread_id,
    trx.trx_query,
    p.USER AS thread_user,
    p.HOST AS thread_host,
    p.DB AS db_name,
    p.COMMAND AS command,
    p.TIME AS time_elapsed
FROM information_schema.innodb_trx trx
JOIN information_schema.processlist p
  ON trx.trx_mysql_thread_id = p.ID
WHERE trx.trx_state = 'RUNNING';

