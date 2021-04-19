/*
  Warnings:

  - You are about to drop the column `ingrediente` on the `Bebidas` table. All the data in the column will be lost.
  - Made the column `description` on table `Bebidas` required. This step will fail if there are existing NULL values in that column.
  - Made the column `preparacion` on table `Bebidas` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `Bebidas` DROP COLUMN `ingrediente`,
    ADD COLUMN     `ingredientes` VARCHAR(191),
    ADD COLUMN     `dificultad` VARCHAR(191),
    MODIFY `description` LONGTEXT NOT NULL,
    MODIFY `preparacion` LONGTEXT NOT NULL;
