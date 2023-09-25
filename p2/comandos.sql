/* 5.2 */
use information_schema;
select table_schema, table_name, table_type, table_rows, create_time from INFORMATION_SCHEMA.tables WHERE TABLE_SCHEMA='libreria';