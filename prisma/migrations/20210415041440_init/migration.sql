-- CreateTable
CREATE TABLE `Bebidas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191),
    `description` VARCHAR(191),
    `preparacion` VARCHAR(191),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ingredientes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_BebidasToIngredientes` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,
UNIQUE INDEX `_BebidasToIngredientes_AB_unique`(`A`, `B`),
INDEX `_BebidasToIngredientes_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_BebidasToIngredientes` ADD FOREIGN KEY (`A`) REFERENCES `Bebidas`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_BebidasToIngredientes` ADD FOREIGN KEY (`B`) REFERENCES `Ingredientes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
