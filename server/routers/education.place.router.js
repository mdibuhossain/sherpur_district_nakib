import express from "express";
import { educationPlaceController } from "../controllers/education.place.controller.js";
import { authMiddleware } from "../middlewares/auth.middleware.js";
import upload from "../middlewares/multer.middleware.js";

const educationPlaceRouter = express.Router();

educationPlaceRouter.get("/", educationPlaceController.getEducationPlaces);
educationPlaceRouter.get("/:id", educationPlaceController.getEducationPlaceById);
educationPlaceRouter.post("/", authMiddleware, upload.single("image"), educationPlaceController.createEducationPlace);
educationPlaceRouter.put("/:id", authMiddleware, upload.single("image"), educationPlaceController.updateEducationPlace);
educationPlaceRouter.delete("/:id", authMiddleware, educationPlaceController.deleteEducationPlace);

export default educationPlaceRouter;