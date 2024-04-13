-- DropForeignKey
ALTER TABLE "Bank" DROP CONSTRAINT "Bank_postId_fkey";

-- DropForeignKey
ALTER TABLE "EducationPlace" DROP CONSTRAINT "EducationPlace_postId_fkey";

-- DropForeignKey
ALTER TABLE "Hospital" DROP CONSTRAINT "Hospital_postId_fkey";

-- DropForeignKey
ALTER TABLE "Restaurant" DROP CONSTRAINT "Restaurant_postId_fkey";

-- DropForeignKey
ALTER TABLE "TouristSpot" DROP CONSTRAINT "TouristSpot_postId_fkey";

-- DropForeignKey
ALTER TABLE "Upazila" DROP CONSTRAINT "Upazila_postId_fkey";

-- AlterTable
ALTER TABLE "Bank" ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "EducationPlace" ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Hospital" ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Restaurant" ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "TouristSpot" ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Upazila" ALTER COLUMN "postId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Upazila" ADD CONSTRAINT "Upazila_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bank" ADD CONSTRAINT "Bank_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Restaurant" ADD CONSTRAINT "Restaurant_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EducationPlace" ADD CONSTRAINT "EducationPlace_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hospital" ADD CONSTRAINT "Hospital_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TouristSpot" ADD CONSTRAINT "TouristSpot_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;
