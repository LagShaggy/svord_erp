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
	('00000000-0000-0000-0000-000000000000', 'c9472167-b7e0-432f-b780-6b7ce9ce0b04', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"local@dev.com","user_id":"51b3b09a-acb2-4471-82cc-a8fcc12e8cbd","user_phone":""}}', '2024-04-09 16:31:11.325878+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '51b3b09a-acb2-4471-82cc-a8fcc12e8cbd', 'authenticated', 'authenticated', 'local@dev.com', '$2a$10$dTD5Td6fxRPeJcfj5A45HuxUAoV31WfLHbDG/UGKItWwMjbvJ7z5S', '2024-04-09 16:31:11.327224+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-04-09 16:31:11.322945+00', '2024-04-09 16:31:11.327322+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('51b3b09a-acb2-4471-82cc-a8fcc12e8cbd', '51b3b09a-acb2-4471-82cc-a8fcc12e8cbd', '{"sub": "51b3b09a-acb2-4471-82cc-a8fcc12e8cbd", "email": "local@dev.com", "email_verified": false, "phone_verified": false}', 'email', '2024-04-09 16:31:11.325094+00', '2024-04-09 16:31:11.325126+00', '2024-04-09 16:31:11.325126+00', '15b5115b-dc64-4d43-a81f-fb83ec2e1cb1');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



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
-- Data for Name: Product_Category; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."product" ("id", "name", "description", "category") VALUES
	(1, 'Organic Raw Honey', 'Pure, unfiltered organic honey from wildflower blossoms.', NULL),
	(2, 'Artisanal Sourdough Bread', 'Handcrafted sourdough loaf made with organic flour.', NULL),
	(3, 'Single Origin Coffee Beans', 'Premium arabica beans sourced from Ethiopia.', NULL),
	(4, 'Cold Pressed Olive Oil', 'Extra virgin olive oil, cold-pressed from the finest olives.', NULL),
	(5, 'Dark Chocolate Bar', '70% cacao dark chocolate bar, ethically sourced.', NULL),
	(6, 'Almond Butter', 'Smooth, all-natural almond butter with no added sugar.', NULL),
	(7, 'Quinoa Pasta', 'Gluten-free pasta made from organic quinoa flour.', NULL),
	(8, 'Spicy Pickles', 'Crunchy dill pickles with a spicy kick.', NULL),
	(9, 'Organic Brown Rice', 'Whole grain organic brown rice, perfect for a healthy side dish.', NULL),
	(10, 'Maple Syrup', 'Pure maple syrup, great for pancakes and waffles.', NULL),
	(11, 'Vegetable Spiralizer', 'Kitchen gadget for making vegetable noodles.', NULL),
	(12, 'Chia Seeds', 'Organic chia seeds, a superfood great for smoothies.', NULL),
	(13, 'Coconut Water', 'Refreshing coconut water, rich in electrolytes.', NULL),
	(14, 'Green Tea Leaves', 'Organic green tea leaves, rich in antioxidants.', NULL),
	(15, 'Kombucha Starter Kit', 'Everything you need to brew your own kombucha at home.', NULL),
	(16, 'Almond Milk', 'Unsweetened almond milk, dairy-free and vegan.', NULL),
	(17, 'Avocado Oil Mayo', 'Mayonnaise made with avocado oil, keto-friendly.', NULL),
	(18, 'Grass-Fed Beef Jerky', 'High-protein beef jerky from grass-fed cattle.', NULL),
	(19, 'Multivitamin Gummies', 'Chewable gummies with essential vitamins and minerals.', NULL),
	(20, 'Reusable Water Bottle', 'Eco-friendly stainless steel water bottle.', NULL);


--
-- Data for Name: Profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."Profile" ("id", "firstname", "lastname", "avatar_url") VALUES
	('51b3b09a-acb2-4471-82cc-a8fcc12e8cbd', NULL, NULL, NULL);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") VALUES
	('images', 'images', NULL, '2024-04-09 08:12:33.824909+00', '2024-04-09 08:12:33.824909+00', false, false, NULL, NULL, NULL);


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 64, true);


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
-- Name: Product_Category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."Product_Category_id_seq"', 1, false);


--
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."product_id_seq"', 20, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
