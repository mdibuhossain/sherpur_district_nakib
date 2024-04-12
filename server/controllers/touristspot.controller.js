import prisma from "../db/db.config.js";
import { createPost, updatePost } from "../utils/utils.js";

export class touristspotController {
  static getTouristspots = async (req, res) => {
    try {
      const result = await prisma.touristSpot.findMany();
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static getTouristspotById = async (req, res) => {
    try {
      const { id } = req.params;
      const result = await prisma.touristSpot.findUnique({
        where: {
          id: parseInt(id),
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static createTouristspot = async (req, res) => {
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
      const result = await prisma.touristSpot.create({
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

  static updateTouristspot = async (req, res) => {
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
      const result = await prisma.touristSpot.update({
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

  static deleteTouristspot = async (req, res) => {
    try {
      const { id } = req.params;
      await prisma.touristSpot.delete({
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
