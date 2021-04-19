/*
  Warnings:

  - You are about to drop the `Ingredientes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_BebidasToIngredientes` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_BebidasToIngredientes` DROP FOREIGN KEY `_BebidasToIngredientes_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_BebidasToIngredientes` DROP FOREIGN KEY `_BebidasToIngredientes_ibfk_2`;

-- AlterTable
ALTER TABLE `Bebidas` ADD COLUMN     `ingrediente` VARCHAR(191);

-- DropTable
DROP TABLE `Ingredientes`;

-- DropTable
DROP TABLE `_BebidasToIngredientes`;
