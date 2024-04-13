import express from "express";
import { districtOverviewController } from "../controllers/district.overview.controller.js";
import upload from "../middlewares/multer.middleware.js";
import { authMiddleware } from "../middlewares/auth.middleware.js";

const districtOverviewRouter = express.Router();

districtOverviewRouter.get("/", districtOverviewController.getDistricInfos);
districtOverviewRouter.get("/:id", districtOverviewController.getDistrictInfoById);
districtOverviewRouter.post("/", authMiddleware, upload.single("image"), districtOverviewController.createDistrictInfo);
districtOverviewRouter.put("/:id", authMiddleware, upload.single("image"), districtOverviewController.updateDistrictInfo);
districtOverviewRouter.delete("/:id", authMiddleware, districtOverviewController.deleteDistrictInfo);

export default districtOverviewRouter;
