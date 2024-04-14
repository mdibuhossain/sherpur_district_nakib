import express from "express";
import { touristspotController } from "../controllers/touristspot.controller.js";
import upload from "../middlewares/multer.middleware.js";
import { authMiddleware } from "../middlewares/auth.middleware.js";

const touristSpotRouter = express.Router();

touristSpotRouter.get("/", touristspotController.getTouristspots);
touristSpotRouter.get("/:id", touristspotController.getTouristspotById);
touristSpotRouter.post("/", authMiddleware, upload.single("image"), touristspotController.createTouristspot);
touristSpotRouter.put("/:id", authMiddleware, upload.single("image"), touristspotController.updateTouristspot);
touristSpotRouter.delete("/:id", authMiddleware, touristspotController.deleteTouristspot);

export default touristSpotRouter;
