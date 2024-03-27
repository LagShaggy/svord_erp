SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-1.pgdg20.04+1)

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', '1736f7cf-fb63-4b77-8d25-95314592aa84', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"supabase_admin","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ares@lf-trading.com","user_id":"541af5d7-a18b-4b10-baeb-72a9a313b0af"}}', '2023-11-09 18:55:39.378146+00', ''),
	('00000000-0000-0000-0000-000000000000', '36cfcacd-95c0-430d-abe4-992aa7b1d6bc', '{"action":"user_signedup","actor_id":"541af5d7-a18b-4b10-baeb-72a9a313b0af","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"team"}', '2023-11-09 19:04:21.322383+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dc817d86-833c-4f31-86f6-490e7005a8ec', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ares@lf-trading.com","user_id":"541af5d7-a18b-4b10-baeb-72a9a313b0af","user_phone":""}}', '2023-11-09 19:05:59.699403+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c4e01923-f2b7-47f0-a7f0-727d470c43cc', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"supabase_admin","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ares@lf-trading.com","user_id":"c6b28784-bc14-427f-a222-7c5081ff082d"}}', '2023-11-09 19:18:45.167671+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e6d9c31-6865-4ff2-92d9-a68d051ff3f5', '{"action":"user_signedup","actor_id":"c6b28784-bc14-427f-a222-7c5081ff082d","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"team"}', '2023-11-09 19:19:04.677874+00', ''),
	('00000000-0000-0000-0000-000000000000', '12e1c863-d8c1-4276-ad5e-ec619588408d', '{"action":"logout","actor_id":"c6b28784-bc14-427f-a222-7c5081ff082d","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account"}', '2023-11-09 19:22:08.946238+00', ''),
	('00000000-0000-0000-0000-000000000000', '003f124a-ca0b-4249-8700-5e12ba8ac178', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ares@lf-trading.com","user_id":"c6b28784-bc14-427f-a222-7c5081ff082d","user_phone":""}}', '2023-11-09 21:43:57.175701+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ae596989-24b6-4b80-bef9-fa287cf211ed', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"supabase_admin","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ares@lf-trading.com","user_id":"807a3ac1-a3b8-4077-b019-f171c7112815"}}', '2023-11-09 21:44:10.710348+00', ''),
	('00000000-0000-0000-0000-000000000000', '20a85770-42f7-4827-8277-e577d0846d09', '{"action":"user_signedup","actor_id":"807a3ac1-a3b8-4077-b019-f171c7112815","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"team"}', '2023-11-09 21:44:24.534352+00', ''),
	('00000000-0000-0000-0000-000000000000', '0b998ce5-4274-442b-95f9-0ff5d9250a2c', '{"action":"user_recovery_requested","actor_id":"807a3ac1-a3b8-4077-b019-f171c7112815","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"user"}', '2023-11-09 22:08:02.225523+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd2748b07-e7a2-4701-abe6-65a5db0e7eaa', '{"action":"login","actor_id":"807a3ac1-a3b8-4077-b019-f171c7112815","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account"}', '2023-11-09 22:08:14.310576+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f5eec30-8b6b-4b13-91aa-c9f771c0bf86', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ares@lf-trading.com","user_id":"807a3ac1-a3b8-4077-b019-f171c7112815","user_phone":""}}', '2023-11-10 17:34:55.508934+00', ''),
	('00000000-0000-0000-0000-000000000000', '4f030ff1-4d9f-4c9b-a61c-02cc224cbf6e', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ares@lf-trading.com","user_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","user_phone":""}}', '2023-11-10 17:35:14.290585+00', ''),
	('00000000-0000-0000-0000-000000000000', '0cf655fd-ceba-46be-8510-7c8b00cb82d8', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-10 17:54:14.775401+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ae9443d-933f-4752-9df6-cf903dc04630', '{"action":"logout","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account"}', '2023-11-10 17:54:19.36287+00', ''),
	('00000000-0000-0000-0000-000000000000', '70e97914-01e5-4098-ad0c-cb0e371472a1', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-10 18:43:32.195169+00', ''),
	('00000000-0000-0000-0000-000000000000', '34a75797-edd9-4a4a-b603-56a7fb7e67bc', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-10 20:09:16.875759+00', ''),
	('00000000-0000-0000-0000-000000000000', '76e4306a-dc72-45a9-86df-049d6b64cc40', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-10 20:10:04.195828+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd8b5845-b219-4a4d-afa2-8945922825ff', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-10 20:10:40.400527+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b9d15f2b-f6dc-414f-b2bd-c58f866a46f4', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-10 20:35:16.832837+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b0def20e-b8c3-4499-9b68-3cfe96fb7fa5', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-10 21:38:29.011876+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e969ccba-7942-47c6-9210-a187cee01fee', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-10 21:38:29.012508+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e5c0baf-60ef-49f2-a4b4-3b6937c339ff', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 19:03:41.487953+00', ''),
	('00000000-0000-0000-0000-000000000000', '98afdf78-eac3-4500-8965-0f603c45876e', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 19:07:11.977045+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5ec727c-2e28-4836-9872-e475cff723ae', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 19:10:25.693749+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a71b9e74-b966-462c-97b2-2a322dac8d96', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 19:12:58.900822+00', ''),
	('00000000-0000-0000-0000-000000000000', '9625860c-eb77-4c7c-9121-791126dfc81b', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 19:14:07.264273+00', ''),
	('00000000-0000-0000-0000-000000000000', '5bce49a3-bdbb-40a7-a484-3e4332143d28', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 19:15:55.787482+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4c6eb53-8bf8-42a1-b377-a0d6beb9edfc', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 19:19:37.121917+00', ''),
	('00000000-0000-0000-0000-000000000000', '94b68237-152a-48d8-923b-34557553bdd9', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-11 22:39:18.830362+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df460df3-8395-4fe2-8a2f-ef2b413c7150', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-11 22:39:18.831032+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dfb0aa34-0b14-4887-8236-9013f0ddc7c6', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-11 22:39:20.150896+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e042db7a-b820-43c0-83e0-e93a9bb96f32', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-11 22:39:20.151672+00', ''),
	('00000000-0000-0000-0000-000000000000', '611d9573-0331-4394-a644-f39c3a73bbc2', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 22:39:30.579315+00', ''),
	('00000000-0000-0000-0000-000000000000', '363dc5f2-de83-4280-9d9f-1d613874c7db', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 22:41:21.321881+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c84b658-88ea-4c36-80e1-0176c61fbc68', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 22:55:58.206163+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c32ad162-4de6-4ae2-acbc-77de383733ed', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 22:57:14.831056+00', ''),
	('00000000-0000-0000-0000-000000000000', '221866f4-69d9-4ebf-9224-0d0856105617', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 22:59:18.486178+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c716c1e-3f26-4dd9-a8ab-6c5f24b3ef76', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 23:03:56.716258+00', ''),
	('00000000-0000-0000-0000-000000000000', '21a91a72-dade-4360-a89b-29cc61d2262d', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 23:09:16.294091+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ad54f50-d99a-44eb-a9fb-0697a3b207b7', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-11 23:48:15.613427+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fe0a7167-00e7-434a-892c-a9c121814fc6', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-12 00:17:06.826772+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd90a0898-43d8-43a5-aa69-4cf43725ebb0', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 08:59:34.362137+00', ''),
	('00000000-0000-0000-0000-000000000000', '05d0e123-544b-4e04-b840-09563264628d', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 08:59:34.36278+00', ''),
	('00000000-0000-0000-0000-000000000000', '8c5f920f-a91a-4ccb-9e00-e0b2e0a49cdc', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 09:59:38.27244+00', ''),
	('00000000-0000-0000-0000-000000000000', '595c7be5-541a-4749-bfd5-b2e8808e4b1b', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 09:59:38.273112+00', ''),
	('00000000-0000-0000-0000-000000000000', '532f839c-a19d-42d4-b688-405a612bb065', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 11:08:00.199487+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ce146fd-8ec9-4949-99a0-0cc3e560fadd', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 11:08:00.200199+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa27474c-7a87-4cd1-a124-65ed120c5176', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 11:08:00.251597+00', ''),
	('00000000-0000-0000-0000-000000000000', '3ce58db9-4dfc-4c36-9531-a339e7769836', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 11:08:00.252229+00', ''),
	('00000000-0000-0000-0000-000000000000', '5ad06881-9eb1-4c4f-b4c0-645f96e32267', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 11:08:00.283375+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c4f47fd3-21b3-4441-9d79-f861a9df8dd6', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 11:08:00.284218+00', ''),
	('00000000-0000-0000-0000-000000000000', '294abf50-1524-470e-a767-1dcde350c9b0', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 12:51:23.276612+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bdb59b89-6620-4b21-967c-4f843cf776b8', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 12:51:23.277249+00', ''),
	('00000000-0000-0000-0000-000000000000', '001cb189-f275-473e-a4a3-152b6063df2a', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 12:51:23.305669+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd0e77fdb-12ca-4c48-b70a-bf1a773ab9a6', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 12:51:23.306328+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ba144d8-13f1-45ea-bdf8-402a7fa508fb', '{"action":"logout","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account"}', '2023-11-12 13:10:15.167749+00', ''),
	('00000000-0000-0000-0000-000000000000', '23c5baa8-1b72-4bc0-8fed-96d13907c5e9', '{"action":"login","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2023-11-12 13:10:30.232356+00', ''),
	('00000000-0000-0000-0000-000000000000', '8e461a56-92ee-4a5b-8f11-8e37b85ca184', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 14:10:39.818791+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f20cc397-b957-4a4e-b3ba-67b3c9221851', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 14:10:39.819464+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5df5f3f-2ac7-4df7-858e-4eaaed13b039', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 15:17:37.612218+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bb097b67-9386-456c-b188-4be7e3e504e1', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 15:17:37.612827+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eeebf2bc-7907-4396-86f9-150abba8f303', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 16:25:09.602451+00', ''),
	('00000000-0000-0000-0000-000000000000', '2cfe14b2-c991-4399-a35f-c68f0db8dbb3', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 16:25:09.603094+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e527dd11-07d9-43f2-a4c7-3835e23a0254', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 16:25:10.038734+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d493b8c-9f60-4aa1-bcdb-fc0a878b7f07', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 16:25:10.03932+00', ''),
	('00000000-0000-0000-0000-000000000000', '730a31c6-4df3-4aa7-9f79-3666a23c6685', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 18:20:13.640268+00', ''),
	('00000000-0000-0000-0000-000000000000', '0109c17d-e70d-49ca-a27c-c7d21889ed6e', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-12 18:20:13.640963+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5b82468-51c2-4a83-bf05-65c7c50dc24d', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 15:39:20.434388+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fff72143-dcd8-4e1d-98cf-12fbc6b23ee4', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 15:39:20.434963+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df74be35-fb6f-4136-be8d-caf511744ad3', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 16:43:17.146658+00', ''),
	('00000000-0000-0000-0000-000000000000', '7adad34e-3cd0-41aa-855a-d5118e23c5bb', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 16:43:17.147253+00', ''),
	('00000000-0000-0000-0000-000000000000', '42f3c3b4-ae59-475a-ad2a-b5e596d4c9f7', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 17:46:36.896629+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fecd4234-6697-48a2-8d8a-3dba3964ebc0', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 17:46:36.897207+00', ''),
	('00000000-0000-0000-0000-000000000000', '89672ecf-9b8e-4c91-8e49-5d8f71c1f1cd', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 19:09:17.884312+00', ''),
	('00000000-0000-0000-0000-000000000000', '9503bd5a-433b-4c6a-9557-1bbefd2530a4', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 19:09:17.884958+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b9e58d28-769d-4842-bd0f-a3dfa5e25173', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 21:05:09.038737+00', ''),
	('00000000-0000-0000-0000-000000000000', '021ce009-1fa8-47ba-a759-8c3ec3304b5f', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-13 21:05:09.039768+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bb84b103-c08a-453a-bb04-73f03e6f4274', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 08:13:43.733729+00', ''),
	('00000000-0000-0000-0000-000000000000', '2754b51c-a172-4546-99d3-43cbda28d458', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 08:13:43.734407+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd0d3cabb-caeb-4c83-9534-ff36c5095a87', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 15:45:30.510558+00', ''),
	('00000000-0000-0000-0000-000000000000', '159d7a3c-0384-469b-9acf-0d0342c3f570', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 15:45:30.511191+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aab8dd4a-eb38-44df-b5bd-9e5d4d557532', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 19:02:01.19231+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a0a4ebc-1c12-427a-ae01-fdc7790a5da0', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 19:02:01.193041+00', ''),
	('00000000-0000-0000-0000-000000000000', '98e616ef-9146-435a-909b-b0fec1fec596', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 20:10:09.853717+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8e4795e-9b54-4d21-97a1-af87fcc3b4d9', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 20:10:09.854299+00', ''),
	('00000000-0000-0000-0000-000000000000', '5cd0d97b-ecc5-49e2-8f3d-976cdbfe18b4', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 20:10:09.882727+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c07c825-0cbe-4754-be33-897b1f3890bd', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-11-14 20:10:09.88336+00', ''),
	('00000000-0000-0000-0000-000000000000', '7960f8d3-15d7-4532-bc76-d37ccbc4ed60', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-12-07 20:57:12.416661+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c7485256-7450-4de1-9dc4-22db5bff8449', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-12-07 20:57:12.417649+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fca60eda-5477-429f-b948-f7f2ea64da9b', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-12-07 22:01:52.347292+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dcce8bc3-db12-4a88-806b-11c94a6c732e', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-12-07 22:01:52.347895+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c138503a-297b-4b6d-a212-1e77692108fe', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-12-07 23:06:59.841107+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cde5335f-d1c9-44d0-8c5e-34871a4e2c83', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-12-07 23:06:59.841693+00', ''),
	('00000000-0000-0000-0000-000000000000', '52ae218a-740a-428b-a43c-42d74f417365', '{"action":"token_refreshed","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-12-13 13:11:57.618433+00', ''),
	('00000000-0000-0000-0000-000000000000', '37ad33c2-89d0-4180-b475-1f985a65bb22', '{"action":"token_revoked","actor_id":"f9a9a122-3299-43c2-a4ff-1caf453929c7","actor_username":"ares@lf-trading.com","actor_via_sso":false,"log_type":"token"}', '2023-12-13 13:11:57.619407+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at") VALUES
	('00000000-0000-0000-0000-000000000000', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', 'authenticated', 'authenticated', 'ares@lf-trading.com', '$2a$10$Yqn7yjWj3aUKuLiZmZENWeXREv2ihJ0wjlRUZFoj7Z/namzaAGSom', '2023-11-10 17:35:14.291741+00', NULL, '', NULL, '', NULL, '', '', NULL, '2023-11-12 13:10:30.233031+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2023-11-10 17:35:14.287404+00', '2023-12-13 13:11:57.624857+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('f9a9a122-3299-43c2-a4ff-1caf453929c7', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', '{"sub": "f9a9a122-3299-43c2-a4ff-1caf453929c7", "email": "ares@lf-trading.com"}', 'email', '2023-11-10 17:35:14.289658+00', '2023-11-10 17:35:14.289706+00', '2023-11-10 17:35:14.289706+00', '52324727-2e88-4728-b74e-f4b1cc1daa85');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('fa311c2e-7684-46dd-aaa2-4636aa010e5b', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', '2023-11-12 13:10:30.233088+00', '2023-12-13 13:11:57.629552+00', NULL, 'aal1', NULL, '2023-12-13 13:11:57.629462', 'undici', '83.150.43.177', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('fa311c2e-7684-46dd-aaa2-4636aa010e5b', '2023-11-12 13:10:30.235448+00', '2023-11-12 13:10:30.235448+00', 'password', 'cff10bea-b679-44c7-817c-6073ff9243d9');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 47, 'GhAllIQtBYrfNK-NQSTQtw', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-13 21:05:09.040768+00', '2023-11-14 08:13:43.735035+00', 'BPu1qzrVpmWiahDZpfBdmA', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 48, 'bbp5NEEzubqa5P-3fPm5Pw', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-14 08:13:43.735477+00', '2023-11-14 15:45:30.512778+00', 'GhAllIQtBYrfNK-NQSTQtw', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 49, 'cnVX4uCVFfGLdx1IZu4zSA', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-14 15:45:30.513076+00', '2023-11-14 19:02:01.193839+00', 'bbp5NEEzubqa5P-3fPm5Pw', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 51, 'XBJ-CMsz6nWT-pBLPqjgtw', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', false, '2023-11-14 20:10:09.855155+00', '2023-11-14 20:10:09.855155+00', 'CtYq-v_fZLlgSO-y_-WZsg', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 50, 'CtYq-v_fZLlgSO-y_-WZsg', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-14 19:02:01.194169+00', '2023-11-14 20:10:09.883875+00', 'cnVX4uCVFfGLdx1IZu4zSA', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 37, 'k4mL3bMAzZyIl0iPxuZy-g', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-12 13:10:30.233978+00', '2023-11-12 14:10:39.819998+00', NULL, 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 38, 'Y-H1KpnG6Oqcf7CBViicOQ', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-12 14:10:39.820413+00', '2023-11-12 15:17:37.613321+00', 'k4mL3bMAzZyIl0iPxuZy-g', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 40, 'JXWGWjontSw8eMdS-4BTxw', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', false, '2023-11-12 16:25:09.604061+00', '2023-11-12 16:25:09.604061+00', 'Xu67-5OKyAhBNA_Z7tEDkg', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 39, 'Xu67-5OKyAhBNA_Z7tEDkg', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-12 15:17:37.613686+00', '2023-11-12 16:25:10.039808+00', 'Y-H1KpnG6Oqcf7CBViicOQ', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 41, 'l8pPKuEg5C7PtZwrF4ixgQ', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-12 16:25:10.040153+00', '2023-11-12 18:20:13.641631+00', 'Xu67-5OKyAhBNA_Z7tEDkg', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 42, 'SDFdsdCAc5m8VkfPrD9NzA', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-12 18:20:13.64201+00', '2023-11-13 15:39:20.435438+00', 'l8pPKuEg5C7PtZwrF4ixgQ', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 43, 'JNgZLAX0VPGLS5-cwF0p-Q', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-13 15:39:20.435745+00', '2023-11-13 16:43:17.147893+00', 'SDFdsdCAc5m8VkfPrD9NzA', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 44, 'HNGSqNDVizw2lz0jmO5PZw', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-13 16:43:17.148224+00', '2023-11-13 17:46:36.897829+00', 'JNgZLAX0VPGLS5-cwF0p-Q', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 45, 'VwDu2svmcZJCOjEjgKK1gQ', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-13 17:46:36.898181+00', '2023-11-13 19:09:17.885466+00', 'HNGSqNDVizw2lz0jmO5PZw', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 46, 'BPu1qzrVpmWiahDZpfBdmA', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-13 19:09:17.885774+00', '2023-11-13 21:05:09.040416+00', 'VwDu2svmcZJCOjEjgKK1gQ', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 52, '5JTsZ6HF3gbY1vcYe6idKA', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-11-14 20:10:09.884164+00', '2023-12-07 20:57:12.418216+00', 'CtYq-v_fZLlgSO-y_-WZsg', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 53, 'R-axn5UNo_2GqKXVnmWWqA', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-12-07 20:57:12.419076+00', '2023-12-07 22:01:52.348403+00', '5JTsZ6HF3gbY1vcYe6idKA', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 54, 'S5dLKxTAAAOEAQB1meIWyg', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-12-07 22:01:52.348742+00', '2023-12-07 23:06:59.842181+00', 'R-axn5UNo_2GqKXVnmWWqA', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 55, 'BmncbqfTG1OG9J7tSFGo0Q', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', true, '2023-12-07 23:06:59.842633+00', '2023-12-13 13:11:57.619928+00', 'S5dLKxTAAAOEAQB1meIWyg', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b'),
	('00000000-0000-0000-0000-000000000000', 56, 'avtceh3-ivL6cjgtVuPCug', 'f9a9a122-3299-43c2-a4ff-1caf453929c7', false, '2023-12-13 13:11:57.62177+00', '2023-12-13 13:11:57.62177+00', 'BmncbqfTG1OG9J7tSFGo0Q', 'fa311c2e-7684-46dd-aaa2-4636aa010e5b');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."Account" ("id", "name", "country", "email", "website", "description", "accepted_currencies") VALUES
	(1, 'GreenTech Innovations', 'USA', 'contact@greentechinnovations.com', 'www.greentechinnovations.com', 'Sustainable energy solutions for the modern world.', NULL),
	(2, 'Alpine Electronics', 'Switzerland', 'info@alpineelec.ch', 'www.alpineelec.ch', 'High-quality audio and navigation products.', NULL),
	(3, 'Bamboo Textiles', 'China', 'sales@bambootextiles.cn', 'www.bambootextiles.cn', 'Eco-friendly textiles made from bamboo fibers.', NULL),
	(4, 'River Coffee Roasters', 'UK', 'hello@rivercoffeeroasters.uk', 'www.rivercoffeeroasters.uk', 'Artisan coffee roasting company sourcing ethical beans globally.', NULL),
	(5, 'TechLogix', 'Germany', 'support@techlogix.de', 'www.techlogix.de', 'Innovative tech solutions for businesses and individuals.', NULL),
	(6, 'Cosmic Cosmetics', 'France', 'contact@cosmiccosmetics.fr', 'www.cosmiccosmetics.fr', 'Organic makeup and skincare products.', NULL),
	(7, 'Fresh Farm Produce', 'USA', 'info@freshfarmproduce.us', 'www.freshfarmproduce.us', 'Locally sourced organic fruits and vegetables delivered to your door.', NULL),
	(8, 'Artisan Bakers Ltd.', 'Italy', 'orders@artisanbakers.it', 'www.artisanbakers.it', 'Traditional Italian bakery offering a variety of breads and pastries.', NULL),
	(9, 'Highland Adventures', 'Scotland', 'bookings@highlandadventures.scot', 'www.highlandadventures.scot', 'Outdoor adventure and tour company in the Scottish Highlands.', NULL),
	(10, 'Digital Nomad Hub', 'Spain', 'membership@digitalnomadhub.es', 'www.digitalnomadhub.es', 'Co-working and co-living spaces for digital nomads.', NULL);


--
-- Data for Name: Contact; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Post; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."Product" ("id", "name", "description") VALUES
	(1, 'Organic Raw Honey', 'Pure, unfiltered organic honey from wildflower blossoms.'),
	(2, 'Artisanal Sourdough Bread', 'Handcrafted sourdough loaf made with organic flour.'),
	(3, 'Single Origin Coffee Beans', 'Premium arabica beans sourced from Ethiopia.'),
	(4, 'Cold Pressed Olive Oil', 'Extra virgin olive oil, cold-pressed from the finest olives.'),
	(5, 'Dark Chocolate Bar', '70% cacao dark chocolate bar, ethically sourced.'),
	(6, 'Almond Butter', 'Smooth, all-natural almond butter with no added sugar.'),
	(7, 'Quinoa Pasta', 'Gluten-free pasta made from organic quinoa flour.'),
	(8, 'Spicy Pickles', 'Crunchy dill pickles with a spicy kick.'),
	(9, 'Organic Brown Rice', 'Whole grain organic brown rice, perfect for a healthy side dish.'),
	(10, 'Maple Syrup', 'Pure maple syrup, great for pancakes and waffles.'),
	(11, 'Vegetable Spiralizer', 'Kitchen gadget for making vegetable noodles.'),
	(12, 'Chia Seeds', 'Organic chia seeds, a superfood great for smoothies.'),
	(13, 'Coconut Water', 'Refreshing coconut water, rich in electrolytes.'),
	(14, 'Green Tea Leaves', 'Organic green tea leaves, rich in antioxidants.'),
	(15, 'Kombucha Starter Kit', 'Everything you need to brew your own kombucha at home.'),
	(16, 'Almond Milk', 'Unsweetened almond milk, dairy-free and vegan.'),
	(17, 'Avocado Oil Mayo', 'Mayonnaise made with avocado oil, keto-friendly.'),
	(18, 'Grass-Fed Beef Jerky', 'High-protein beef jerky from grass-fed cattle.'),
	(19, 'Multivitamin Gummies', 'Chewable gummies with essential vitamins and minerals.'),
	(20, 'Reusable Water Bottle', 'Eco-friendly stainless steel water bottle.');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 56, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: Account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."Account_id_seq"', 10, true);


--
-- Name: Contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."Contact_id_seq"', 1, false);


--
-- Name: Post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."Post_id_seq"', 1, false);


--
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."Product_id_seq"', 20, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
