-- Cria o usuario da aplicacao, caso ele ainda nao exista (idempotente).
DO
$$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'django') THEN
      CREATE ROLE django LOGIN PASSWORD 'django';
   END IF;
END
$$;
