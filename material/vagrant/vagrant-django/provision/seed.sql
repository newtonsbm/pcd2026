-- Cria o usuario da aplicacao, caso ele ainda nao exista (idempotente).
-- :'db_user' e :'db_password' sao variaveis passadas via "psql -v" a
-- partir do .env (ver provision.sh), nao valores fixos neste arquivo.
DO
$$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = :'db_user') THEN
      CREATE ROLE :"db_user" LOGIN PASSWORD :'db_password';
   END IF;
END
$$;
