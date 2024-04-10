import prisma from "../db/db.config";
import { createPost, updatePost } from "../utils/utils";

export class educationPlaceController {
  static getEducationPlaces = async (req, res) => {
    try {
      const result = await prisma.educationPlace.findMany();
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static getEducationPlaceById = async (req, res) => {
    try {
      const { id } = req.params;
      const result = await prisma.educationPlace.findUnique({
        where: {
          id: parseInt(id),
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static createEducationPlace = async (req, res) => {
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
      const result = await prisma.educationPlace.create({
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

  static updateEducationPlace = async (req, res) => {
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
      const result = await prisma.educationPlace.update({
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

  static deleteEducationPlace = async (req, res) => {
    try {
      const { id } = req.params;
      await prisma.educationPlace.delete({
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
