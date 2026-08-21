-- Cria o usuario da aplicacao, caso ele ainda nao exista (idempotente).
-- :'db_user' e :'db_password' sao variaveis passadas via "psql -v" a
-- partir do .env (ver provision.sh), nao valores fixos neste arquivo.
--
-- Um bloco DO $$ ... $$ nao funciona aqui: dentro de dollar-quoting o
-- psql nao substitui variaveis (:"var"/:'var'), entao a montagem do
-- CREATE ROLE e feita fora do bloco, via \gset, e so roda com \if
-- quando o role ainda nao existe.
SELECT NOT EXISTS (
  SELECT FROM pg_catalog.pg_roles WHERE rolname = :'db_user'
) AS role_missing
\gset

SELECT format('CREATE ROLE %I LOGIN PASSWORD %L', :'db_user', :'db_password') AS create_role_sql
\gset

\if :role_missing
  :create_role_sql;
\endif
