-- CreateEnum
CREATE TYPE "currency" AS ENUM ('USD', 'RMB', 'Euro', 'CHF', 'GBP');

-- CreateEnum
CREATE TYPE "country" AS ENUM ('CH', 'CN', 'DE', 'US', 'GB');

-- CreateTable
CREATE TABLE "account" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "country" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255),
    "website" VARCHAR(255),
    "description" VARCHAR,
    "accepted_currencies" "currency"[],

    CONSTRAINT "account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contact" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "accountId" INTEGER,
    "account_id" INTEGER NOT NULL,

    CONSTRAINT "contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "post" (
    "id" SERIAL NOT NULL,
    "message" TEXT NOT NULL,
    "accountId" INTEGER,

    CONSTRAINT "post_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "account_email_key" ON "account"("email");

-- CreateIndex
CREATE UNIQUE INDEX "contact_email_key" ON "contact"("email");

-- AddForeignKey
ALTER TABLE "contact" ADD CONSTRAINT "contact_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post" ADD CONSTRAINT "post_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "account"("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER SEQUENCE account_id_seq RESTART WITH 1000;
