import express from "express";
import { hospitalController } from "../controllers/hospital.controller.js";
import upload from "../middlewares/multer.middleware.js";
import { authMiddleware } from "../middlewares/auth.middleware.js";

const hospitalRouter = express.Router();

hospitalRouter.get("/doctors", hospitalController.getDoctors);
hospitalRouter.get("/doctors/:id", hospitalController.getDoctorsById);
hospitalRouter.get("/:id/doctors", hospitalController.getDoctorsByHospitalId);
hospitalRouter.post("/doctors", authMiddleware, hospitalController.createDoctor);
hospitalRouter.put("/doctors/:id", authMiddleware, hospitalController.updateDoctorById);
hospitalRouter.delete("/doctors/:id", authMiddleware, hospitalController.deleteDoctorById);

hospitalRouter.get("/", hospitalController.getHospitals);
hospitalRouter.get("/:id", hospitalController.getHospitalById);
hospitalRouter.post("/", authMiddleware, upload.single("image"), hospitalController.createHospital);
hospitalRouter.put("/:id", authMiddleware, upload.single("image"), hospitalController.updateHospital);
hospitalRouter.delete("/:id", authMiddleware, hospitalController.deleteHospital);

export default hospitalRouter;
