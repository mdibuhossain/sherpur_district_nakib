import express from "express";
import { upazilaController } from "../controllers/upazila.controller.js";
import upload from "../middlewares/multer.middleware.js";

const upazilaRouter = express.Router();

upazilaRouter.get("/", upazilaController.getUpazilas);
upazilaRouter.get("/:id", upazilaController.getUpazilaById);
upazilaRouter.post("/", upload.single("image"), upazilaController.createUpazila);
upazilaRouter.put("/:id", upazilaController.updateUpazila);
upazilaRouter.delete("/:id", upazilaController.deleteUpazila);

export default upazilaRouter;
