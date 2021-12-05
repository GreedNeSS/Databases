CREATE Table system_user (
  id serial,
  login VARCHAR(64),
  password VARCHAR(64),
  full_name VARCHAR(255)
);
ALTER Table
  system_user
ADD
  CONSTRAINT pk_system_user PRIMARY KEY (id);
CREATE UNIQUE INDEX ak_system_user ON system_user (login);
CREATE Table system_group (id serial, name VARCHAR(64) NOT NULL);
ALTER Table
  system_group
ADD
  CONSTRAINT pk_system_group PRIMARY KEY (id);
CREATE UNIQUE INDEX ak_system_group ON system_group (name);
CREATE Table group_user (
    group_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL
  );
ALTER Table
  group_user
ADD
  CONSTRAINT pk_group_user PRIMARY KEY (group_id, user_id);
ALTER Table
  "group_user"
ADD
  CONSTRAINT fk_group_user_group_id FOREIGN KEY (group_id) REFERENCES "system_group"(id) ON DELETE CASCADE;
ALTER Table
  "group_user"
ADD
  CONSTRAINT fk_group_user_user_id FOREIGN KEY (user_id) REFERENCES "system_user"(id) ON DELETE CASCADE;
CREATE Table session (
    id serial,
    user_id INTEGER NOT NULL,
    token VARCHAR(64) NOT NULL,
    ip VARCHAR(45) NOT NULL,
    Data TEXT
  );
ALTER Table
  "session"
ADD
  CONSTRAINT pk_session PRIMARY KEY (id);
CREATE UNIQUE INDEX ak_session ON session (token);
ALTER Table
  "session"
ADD
  CONSTRAINT fk_session_user_id FOREIGN KEY (user_id) REFERENCES "system_user"(id) ON DELETE CASCADE;