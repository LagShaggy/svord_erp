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

insert into "country" (id, iso, name, nicename, iso3, numcode, phonecode) values
	(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
	(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
	(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
	(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
	(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
	(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
	(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
	(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
	(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
	(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
	(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
	(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
	(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
	(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
	(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
	(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
	(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
	(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
	(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
	(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
	(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
	(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
	(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
	(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
	(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
	(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
	(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
	(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
	(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
	(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
	(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
	(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
	(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
	(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
	(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
	(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
	(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
	(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
	(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
	(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
	(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
	(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
	(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
	(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
	(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
	(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
	(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
	(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
	(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
	(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
	(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
	(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
	(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
	(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
	(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
	(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
	(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
	(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
	(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
	(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
	(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
	(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
	(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
	(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
	(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
	(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
	(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
	(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
	(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
	(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
	(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
	(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
	(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
	(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
	(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
	(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
	(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
	(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
	(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
	(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
	(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
	(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
	(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
	(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
	(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
	(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
	(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
	(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
	(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
	(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
	(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
	(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
	(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
	(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
	(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
	(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
	(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
	(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
	(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
	(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
	(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
	(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
	(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
	(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
	(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
	(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
	(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
	(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
	(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
	(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
	(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
	(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
	(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
	(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
	(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
	(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
	(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
	(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
	(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
	(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
	(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
	(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
	(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
	(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
	(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
	(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
	(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
	(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
	(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
	(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
	(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
	(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
	(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
	(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
	(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
	(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
	(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
	(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
	(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
	(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
	(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
	(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
	(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
	(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
	(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
	(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
	(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
	(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
	(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
	(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
	(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
	(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
	(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
	(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
	(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
	(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
	(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
	(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
	(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
	(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
	(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
	(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
	(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
	(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
	(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
	(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
	(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
	(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
	(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
	(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
	(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
	(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
	(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
	(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
	(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
	(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
	(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
	(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
	(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
	(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
	(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
	(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
	(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
	(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
	(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
	(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
	(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
	(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
	(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
	(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
	(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
	(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
	(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
	(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
	(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
	(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
	(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
	(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
	(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
	(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
	(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
	(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
	(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
	(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
	(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
	(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
	(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
	(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
	(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
	(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
	(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
	(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
	(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
	(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
	(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
	(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
	(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
	(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
	(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
	(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
	(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
	(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
	(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
	(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
	(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
	(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
	(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
	(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
	(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
	(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
	(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
	(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
	(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
	(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
	(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
	(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
	(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
	(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
	(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

--
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: postgres
--



INSERT INTO "public"."Account" ("id", "name", "country", "email", "website", "description", "accepted_currencies") VALUES
	(1, 'GreenTech Innovations', '1', 'contact@greentechinnovations.com', 'www.greentechinnovations.com', 'Sustainable energy solutions for the modern world.', NULL),
	(2, 'Alpine Electronics', '1', 'info@alpineelec.ch', 'www.alpineelec.ch', 'High-quality audio and navigation products.', NULL),
	(3, 'Bamboo Textiles', '1', 'sales@bambootextiles.cn', 'www.bambootextiles.cn', 'Eco-friendly textiles made from bamboo fibers.', NULL),
	(4, 'River Coffee Roasters', '1', 'hello@rivercoffeeroasters.uk', 'www.rivercoffeeroasters.uk', 'Artisan coffee roasting company sourcing ethical beans globally.', NULL),
	(5, 'TechLogix', '1', 'support@techlogix.de', 'www.techlogix.de', 'Innovative tech solutions for businesses and individuals.', NULL),
	(6, 'Cosmic Cosmetics', '1', 'contact@cosmiccosmetics.fr', 'www.cosmiccosmetics.fr', 'Organic makeup and skincare products.', NULL),
	(7, 'Fresh Farm Produce', '1', 'info@freshfarmproduce.us', 'www.freshfarmproduce.us', 'Locally sourced organic fruits and vegetables delivered to your door.', NULL),
	(8, 'Artisan Bakers Ltd.', '1', 'orders@artisanbakers.it', 'www.artisanbakers.it', 'Traditional Italian bakery offering a variety of breads and pastries.', NULL),
	(9, 'Highland Adventures', '1', 'bookings@highlandadventures.scot', 'www.highlandadventures.scot', 'Outdoor adventure and tour company in the Scottish Highlands.', NULL),
	(10, 'Digital Nomad Hub', '1', 'membership@digitalnomadhub.es', 'www.digitalnomadhub.es', 'Co-working and co-living spaces for digital nomads.', NULL);


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