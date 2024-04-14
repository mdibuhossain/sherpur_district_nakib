import express from "express";

import { restaurantController } from "../controllers/restaurant.controller.js";
import { authMiddleware } from "../middlewares/auth.middleware.js";
import upload from "../middlewares/multer.middleware.js";

const restaurantRouter = express.Router();

restaurantRouter.get("/", restaurantController.getRestaurants);
restaurantRouter.get("/:id", restaurantController.getRestaurantById);
restaurantRouter.post("/", authMiddleware, upload.single("image"), restaurantController.createRestaurant);
restaurantRouter.put("/:id", authMiddleware, upload.single("image"), restaurantController.updateRestaurant);
restaurantRouter.delete("/:id", authMiddleware, restaurantController.deleteRestaurant);

export default restaurantRouter;
