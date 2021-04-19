/*
  Warnings:

  - Made the column `incredientes` on table `Bebidas` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `Bebidas` MODIFY `incredientes` LONGTEXT NOT NULL;
