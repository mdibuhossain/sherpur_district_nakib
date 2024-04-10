/*
  Warnings:

  - You are about to drop the column `title` on the `Post` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "DistrictInfo" DROP CONSTRAINT "DistrictInfo_postId_fkey";

-- AlterTable
ALTER TABLE "DistrictInfo" ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "title",
ADD COLUMN     "postTitle" TEXT;

-- AddForeignKey
ALTER TABLE "DistrictInfo" ADD CONSTRAINT "DistrictInfo_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;
