import express from "express";
import { upazilaController } from "../controllers/upazila.controller.js";
import upload from "../middlewares/multer.middleware.js";
import { authMiddleware } from "../middlewares/auth.middleware.js";

const upazilaRouter = express.Router();

upazilaRouter.get("/", upazilaController.getUpazilas);
upazilaRouter.get("/:id", upazilaController.getUpazilaById);
upazilaRouter.post("/", authMiddleware, upload.single("image"), upazilaController.createUpazila);
upazilaRouter.put("/:id", authMiddleware, upload.single("image"), upazilaController.updateUpazila);
upazilaRouter.delete("/:id", authMiddleware, upazilaController.deleteUpazila);

export default upazilaRouter;
