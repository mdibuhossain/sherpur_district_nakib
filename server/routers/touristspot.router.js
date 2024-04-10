import express from "express";
import { touristSpotController } from "../controllers/tourist.spot.controller.js";

const touristSpotRouter = express.Router();

touristSpotRouter.get("/", touristSpotController.getTouristSpots);
touristSpotRouter.get("/:id", touristSpotController.getTouristSpotById);
touristSpotRouter.post("/", touristSpotController.createTouristSpot);
touristSpotRouter.put("/:id", touristSpotController.updateTouristSpot);
touristSpotRouter.delete("/:id", touristSpotController.deleteTouristSpot);

export default touristSpotRouter;
