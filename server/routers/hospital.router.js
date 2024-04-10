import express from "express";
import { hospitalController } from "../controllers/hospital.controller.js";

const hospitalRouter = express.Router();

hospitalRouter.get("/", hospitalController.getHospitals);
hospitalRouter.get("/:id", hospitalController.getHospitalById);
hospitalRouter.post("/", hospitalController.createHospital);
hospitalRouter.put("/:id", hospitalController.updateHospital);
hospitalRouter.delete("/:id", hospitalController.deleteHospital);

hospitalRouter.get("/:id/doctors", hospitalController.getDoctorsByHospitalId);
hospitalRouter.post("/:id/doctors", hospitalController.createDoctorByHospitalId);
hospitalRouter.put("/doctors/:id", hospitalController.updateDoctorById);
hospitalRouter.delete("/doctors/:id", hospitalController.deleteDoctorById);


export default hospitalRouter;
