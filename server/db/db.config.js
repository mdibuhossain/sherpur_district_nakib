import { PrismaClient, RoleType } from "@prisma/client";
import { encryptPass } from "../utils/utils.js";

const prisma = new PrismaClient({
  log: ["query", "error"],
});

async function main() {
  try {
    const findAdminUser = await prisma.user.findUnique({
      where: {
        username: "admin",
      },
    });
    if (!findAdminUser) {
      const adminUser = await prisma.user.create({
        data: {
          name: "Super Admin Ahnaf Nakib",
          username: "admin",
          password: encryptPass("admin123"),
          role: RoleType.ADMIN,
        },
      });
    } else {
      console.log("Admin user already exists");
    }
  } catch (error) {
    console.error(error);
  }
}

main()
  .catch((e) => {
    console.error(e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

export default prisma;
