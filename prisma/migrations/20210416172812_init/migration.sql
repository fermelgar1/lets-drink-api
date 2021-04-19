/*
  Warnings:

  - You are about to drop the column `ingredientes` on the `Bebidas` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Bebidas` DROP COLUMN `ingredientes`,
    ADD COLUMN     `incredientes` VARCHAR(191);
