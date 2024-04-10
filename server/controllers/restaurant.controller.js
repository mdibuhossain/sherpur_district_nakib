import prisma from "../db/db.config";
import { createPost, updatePost } from "../utils/utils";

export class restaurantController {
  static getRestaurants = async (req, res) => {
    try {
      const result = await prisma.restaurant.findMany();
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static getRestaurantById = async (req, res) => {
    try {
      const { id } = req.params;
      const result = await prisma.restaurant.findUnique({
        where: {
          id: parseInt(id),
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static createRestaurant = async (req, res) => {
    try {
      let { payload, post } = req.body;
      payload = JSON.parse(payload);
      if (post) {
        payload.postId = await createPost(
          JSON.parse(post),
          req.file.filename,
          res.user.id
        );
      }
      const result = await prisma.restaurant.create({
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

  static updateRestaurant = async (req, res) => {
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
      const result = await prisma.restaurant.update({
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

  static deleteRestaurant = async (req, res) => {
    try {
      const { id } = req.params;
      await prisma.restaurant.delete({
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
