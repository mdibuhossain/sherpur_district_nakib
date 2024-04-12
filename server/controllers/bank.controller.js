import prisma from "../db/db.config.js";
import { createPost, updatePost } from "../utils/utils.js";

export class bankController {
  static getBanks = async (req, res) => {
    try {
      const result = await prisma.bank.findMany();
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static getBankById = async (req, res) => {
    try {
      const { id } = req.params;
      const result = await prisma.bank.findUnique({
        where: {
          id: parseInt(id),
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static createBank = async (req, res) => {
    try {
      let { payload, post } = req.body;
      payload = JSON.parse(payload);
      if (post) {
        payload.postId = await createPost(
          JSON.parse(post),
          req.file.filename,
          req.user.id
        );
      }
      const result = await prisma.bank.create({
        data: payload,
        include: {
          description: true,
        },
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static updateBank = async (req, res) => {
    try {
      const { id } = req.params;
      let { payload, post } = req.body;
      payload = JSON.parse(payload);
      if (post) {
        payload.postId = await updatePost(
          JSON.parse(post),
          req?.file?.filename
        );
      }
      const result = await prisma.bank.update({
        where: {
          id: parseInt(id),
        },
        data: payload,
        include: {
          description: true,
        },
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static deleteBank = async (req, res) => {
    try {
      const { id } = req.params;
      await prisma.bank.delete({
        where: {
          id: parseInt(id),
        },
      });
      return res.status(204);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };
}
