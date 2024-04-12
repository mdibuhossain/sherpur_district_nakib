import prisma from "../db/db.config.js";
import { createPost, updatePost } from "../utils/utils.js";

export class hospitalController {
  static getHospitals = async (req, res) => {
    try {
      const result = await prisma.hospital.findMany();
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
        payload.postId = await createPost(
          JSON.parse(post),
          req.file.filename,
          req.user.id
        );
      }
      const result = await prisma.hospital.create({
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

  static updateHospital = async (req, res) => {
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
      const result = await prisma.hospital.update({
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

  static deleteHospital = async (req, res) => {
    try {
      const { id } = req.params;
      prisma.hospital.delete({
        where: {
          id: parseInt(id),
        },
      });
      return res.status(204);
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
          id: true,
          name: true,
          doctors: true,
        },
      });
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static createDoctorByHospitalId = async (req, res) => {
    try {
      const { id } = req.params;
      let { payload } = req.body;
      payload = JSON.parse(payload);
      const result = await prisma.doctor.create({
        data: {
          ...payload,
          hospitalId: parseInt(id),
        },
      });
      return res.status(201).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.message });
    }
  };

  static updateDoctorById = async (req, res) => {
    try {
      const { id } = req.params;
      let { payload } = req.body;
      payload = JSON.parse(payload);
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
      prisma.doctor.delete({
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
