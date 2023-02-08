
-- Change dataset name to required datasets

-- 1) DIM and FACT TABLES
-- CREATE OR REPLACE PROCEDURE genpact_v1_dataset.dim_tbl_2_views

BEGIN
  DECLARE stmt, name STRING;
  DECLARE table_name ARRAY<STRING>;
  DECLARE index DEFAULT 0;
  SET table_name = ARRAY(SELECT table_name FROM genpact_v1_dataset.INFORMATION_SCHEMA.TABLES where table_name like '%_dim_m' or table_name like '%_fact_m');

  select table_name;
  set stmt = """CREATE OR REPLACE VIEW genpact_v1_dataset.@name_v  as SELECT * FROM `genpact_v1_dataset.@name`""";
  WHILE index < ARRAY_LENGTH(table_name) DO
      BEGIN
        SET name = (select table_name[OFFSET(index)]);
        EXECUTE IMMEDIATE  REPLACE(stmt, '@name', name);
      SET index = index + 1;
      END;
  END WHILE;
END;
------------------

-- 2) reporting tables
CREATE OR REPLACE PROCEDURE genpact_v1_dataset.dim_tbl_2_views

BEGIN
  DECLARE stmt, name STRING;
  DECLARE table_name ARRAY<STRING>;
  DECLARE index DEFAULT 0;
  SET table_name = ARRAY(SELECT table_name FROM genpact_v1_dataset.INFORMATION_SCHEMA.TABLES where table_name like '%_i');

  select table_name;
  set stmt = """CREATE OR REPLACE VIEW genpact_v1_dataset.@name_v  as SELECT * FROM `genpact_v1_dataset.@name`""";
  WHILE index < ARRAY_LENGTH(table_name) DO
      BEGIN
        SET name = (select table_name[OFFSET(index)]);
        EXECUTE IMMEDIATE  REPLACE(stmt, '@name', name);
      SET index = index + 1;
      END;
  END WHILE;
END;
