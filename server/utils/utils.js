import bcrypt from "bcryptjs/dist/bcrypt.js";
import prisma from "../db/db.config.js";

export function encryptPass(password) {
  const salt = bcrypt.genSaltSync(3);
  return bcrypt.hashSync(password, salt);
}

export async function createPost(payload, filename, authorId) {
  try {
    console.log(payload);
    console.log(filename);
    if (filename) payload.bannerImg = filename;
    const result = await prisma.post.create({
      data: { ...payload, authorId },
    });
    return result.id;
  } catch (error) {
    throw new Error(error);
  }
}

export async function updatePost(payload, filename) {
  try {
    if (filename) payload.bannerImg = filename;
    const result = await prisma.post.update({
      where: { id: payload.id },
      data: payload,
    });
    return result.id;
  } catch (error) {
    throw new Error(error);
  }
}
