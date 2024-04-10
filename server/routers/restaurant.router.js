import express from "express";

import { restaurantController } from "../controllers/restaurant.controller.js";

const restaurantRouter = express.Router();

restaurantRouter.get("/", restaurantController.getRestaurants);
restaurantRouter.get("/:id", restaurantController.getRestaurantById);
restaurantRouter.post("/", restaurantController.createRestaurant);
restaurantRouter.put("/:id", restaurantController.updateRestaurant);
restaurantRouter.delete("/:id", restaurantController.deleteRestaurant);

export default restaurantRouter;
