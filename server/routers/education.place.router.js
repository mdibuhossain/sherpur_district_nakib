import express from "express";
import { educationPlaceController } from "../controllers/education.place.controller.js";

const educationPlaceRouter = express.Router();

educationPlaceRouter.get("/", educationPlaceController.getEducationPlaces);
educationPlaceRouter.get("/:id", educationPlaceController.getEducationPlaceById);
educationPlaceRouter.post("/", educationPlaceController.createEducationPlace);
educationPlaceRouter.put("/:id", educationPlaceController.updateEducationPlace);
educationPlaceRouter.delete("/:id", educationPlaceController.deleteEducationPlace);

export default educationPlaceRouter;