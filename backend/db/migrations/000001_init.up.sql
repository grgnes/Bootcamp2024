create type roles as enum ('ADMIN', 'USER');

create table users
(
    id         bigserial primary key,
    role       roles      not null default 'USER',
    name       varchar[255] not null,
    email      varchar[255] not null unique,
    password   varchar[255] not null,
    address    text,
    rating     real       not null default 0,
    created_at timestampz not null default now(),
    updated_at timestampz not null default now()
);

create table sessions
(
    id            bigserial primary key,
    user_id       bigint     not null references users (id),
    refresh_token text       not null,
    user_agent    varchar[255]       not null,
    client_ip     inet       not null,
    is_blocked    boolean    not null default false,
    created_at    timestampz not null default now(),
    updated_at    timestampz not null default now()
);