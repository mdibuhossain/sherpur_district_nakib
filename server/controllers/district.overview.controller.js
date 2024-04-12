import prisma from "../db/db.config.js";
import { createPost, updatePost } from "../utils/utils.js";

export class districtOverviewController {
  static async getDistricInfos(req, res) {
    try {
      const result = await prisma.districtInfo.findMany({
        include: {
          description: true,
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  }
  static async getDistrictInfoById(req, res) {
    const { id } = req.params;
    try {
      const result = await prisma.districtInfo.findUnique({
        where: {
          id: parseInt(id),
        },
        include: {
          description: true,
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  }
  static async createDistrictInfo(req, res) {
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
      const result = await prisma.districtInfo.create({
        data: payload,
        include: {
          description: true,
        },
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  }
  static async updateDistrictInfo(req, res) {
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
      const result = await prisma.districtInfo.update({
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
  }
  static async deleteDistrictInfo(req, res) {
    const { id } = req.params;
    try {
      await prisma.districtInfo.delete({
        where: {
          id: parseInt(id),
        },
      });
      return res.status(204).json();
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  }
}
