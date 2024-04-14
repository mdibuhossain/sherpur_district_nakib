import prisma from "../db/db.config.js";
import { createPost, updatePost } from "../utils/utils.js";

export class restaurantController {
  static getRestaurants = async (req, res) => {
    try {
      const result = await prisma.restaurant.findMany({
        include: {
          description: true,
          upazila: true,
        },
      });
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
        include: {
          description: true,
          upazila: true,
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
      console.log(payload, post);
      payload = JSON.parse(payload);
      if (post) {
        post = JSON.parse(post);
        delete post.id;
        payload.postId = await createPost(
          post,
          req?.file?.filename,
          req.user.id
        );
      }
      const result = await prisma.restaurant.create({
        data: payload,
        include: {
          description: true,
          upazila: true,
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
        post = JSON.parse(post);
        if (post?.id) {
          await updatePost(post, req?.file?.filename);
        } else {
          delete post.id;
          payload.postId = await createPost(
            post,
            req?.file?.filename,
            req.user.id
          );
        }
      }
      const result = await prisma.restaurant.update({
        where: {
          id: parseInt(id),
        },
        data: payload,
        include: {
          description: true,
          upazila: true,
        },
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static deleteRestaurant = async (req, res) => {
    const { id } = req.params;
    try {
      const findData = await prisma.restaurant.findUnique({
        where: {
          id: parseInt(id),
        },
      });
      await prisma.restaurant.delete({
        where: {
          id: parseInt(id),
        },
      });
      if (findData?.postId) {
        await prisma.post.delete({
          where: {
            id: findData.postId,
          },
        });
      }
      return res.status(204).json();
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };
}
