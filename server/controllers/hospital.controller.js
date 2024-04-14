import prisma from "../db/db.config.js";
import { createPost, updatePost } from "../utils/utils.js";

export class hospitalController {
  static getHospitals = async (req, res) => {
    try {
      const result = await prisma.hospital.findMany({
        include: {
          doctors: true,
          description: true,
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static getHospitalById = async (req, res) => {
    try {
      const { id } = req.params;
      const result = await prisma.hospital.findUnique({
        where: {
          id: parseInt(id),
        },
        include: {
          doctors: true,
          description: true,
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static createHospital = async (req, res) => {
    try {
      let { payload, post } = req.body;
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
      const result = await prisma.hospital.create({
        data: payload,
        include: {
          doctors: true,
          description: true,
        },
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static updateHospital = async (req, res) => {
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
      const result = await prisma.hospital.update({
        where: {
          id: parseInt(id),
        },
        data: payload,
        include: {
          doctors: true,
          description: true,
        },
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static deleteHospital = async (req, res) => {
    const { id } = req.params;
    try {
      const findData = await prisma.hospital.findUnique({
        where: {
          id: parseInt(id),
        },
      });
      await prisma.hospital.delete({
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

  static getDoctors = async (req, res) => {
    try {
      const result = await prisma.doctor.findMany({
        include: {
          hospital: true,
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static getDoctorsById = async (req, res) => {
    try {
      const { id } = req.params;
      const result = await prisma.doctor.findUnique({
        where: {
          id: parseInt(id),
        },
        include: {
          hospital: true,
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static getDoctorsByHospitalId = async (req, res) => {
    try {
      const { id } = req.params;
      const result = await prisma.hospital.findUnique({
        where: {
          id: parseInt(id),
        },
        select: {
          doctors: true,
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static createDoctor = async (req, res) => {
    try {
      let payload = req.body;
      console.log(payload);
      const result = await prisma.doctor.create({
        data: payload,
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static updateDoctorById = async (req, res) => {
    try {
      const { id } = req.params;
      let payload = req.body;
      const result = await prisma.doctor.update({
        where: {
          id: parseInt(id),
        },
        data: payload,
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static deleteDoctorById = async (req, res) => {
    try {
      const { id } = req.params;
      await prisma.doctor.delete({
        where: {
          id: parseInt(id),
        },
      });
      return res.status(204).json();
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };
}
