/*
  Warnings:

  - You are about to drop the column `name` on the `Bebidas` table. All the data in the column will be lost.
  - Added the required column `nombre` to the `Bebidas` table without a default value. This is not possible if the table is not empty.
  - Made the column `dificultad` on table `Bebidas` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `Bebidas` DROP COLUMN `name`,
    ADD COLUMN     `nombre` VARCHAR(191) NOT NULL,
    MODIFY `dificultad` VARCHAR(191) NOT NULL;
