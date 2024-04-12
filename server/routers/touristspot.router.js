import express from "express";
import { touristspotController } from "../controllers/touristspot.controller.js";

const touristSpotRouter = express.Router();

touristSpotRouter.get("/", touristspotController.getTouristspots);
touristSpotRouter.get("/:id", touristspotController.getTouristspotById);
touristSpotRouter.post("/", touristspotController.createTouristspot);
touristSpotRouter.put("/:id", touristspotController.updateTouristspot);
touristSpotRouter.delete("/:id", touristspotController.deleteTouristspot);

export default touristSpotRouter;
