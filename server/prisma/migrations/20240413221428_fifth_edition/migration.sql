/*
  Warnings:

  - You are about to drop the column `bannerImg` on the `Bank` table. All the data in the column will be lost.
  - You are about to drop the column `bannerImg` on the `EducationPlace` table. All the data in the column will be lost.
  - You are about to drop the column `bannerImg` on the `Hospital` table. All the data in the column will be lost.
  - You are about to drop the column `bannerImg` on the `Restaurant` table. All the data in the column will be lost.
  - You are about to drop the column `bannerImg` on the `TouristSpot` table. All the data in the column will be lost.
  - You are about to drop the column `bannerImg` on the `Union` table. All the data in the column will be lost.
  - You are about to drop the column `bannerImg` on the `Upazila` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Bank" DROP CONSTRAINT "Bank_postId_fkey";

-- DropForeignKey
ALTER TABLE "DistrictInfo" DROP CONSTRAINT "DistrictInfo_postId_fkey";

-- DropForeignKey
ALTER TABLE "EducationPlace" DROP CONSTRAINT "EducationPlace_postId_fkey";

-- DropForeignKey
ALTER TABLE "Hospital" DROP CONSTRAINT "Hospital_postId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- DropForeignKey
ALTER TABLE "Restaurant" DROP CONSTRAINT "Restaurant_postId_fkey";

-- DropForeignKey
ALTER TABLE "TouristSpot" DROP CONSTRAINT "TouristSpot_postId_fkey";

-- DropForeignKey
ALTER TABLE "Upazila" DROP CONSTRAINT "Upazila_postId_fkey";

-- AlterTable
ALTER TABLE "Bank" DROP COLUMN "bannerImg";

-- AlterTable
ALTER TABLE "EducationPlace" DROP COLUMN "bannerImg";

-- AlterTable
ALTER TABLE "Hospital" DROP COLUMN "bannerImg";

-- AlterTable
ALTER TABLE "Restaurant" DROP COLUMN "bannerImg";

-- AlterTable
ALTER TABLE "TouristSpot" DROP COLUMN "bannerImg";

-- AlterTable
ALTER TABLE "Union" DROP COLUMN "bannerImg";

-- AlterTable
ALTER TABLE "Upazila" DROP COLUMN "bannerImg";

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DistrictInfo" ADD CONSTRAINT "DistrictInfo_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Upazila" ADD CONSTRAINT "Upazila_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bank" ADD CONSTRAINT "Bank_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Restaurant" ADD CONSTRAINT "Restaurant_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EducationPlace" ADD CONSTRAINT "EducationPlace_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hospital" ADD CONSTRAINT "Hospital_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TouristSpot" ADD CONSTRAINT "TouristSpot_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
