import express from "express";
import { districtOverviewController } from "../controllers/district.overview.controller.js";
import upload from "../middlewares/multer.middleware.js";

const districtOverviewRouter = express.Router();

districtOverviewRouter.get("/", districtOverviewController.getDistricInfos);
districtOverviewRouter.get("/:id", districtOverviewController.getDistrictInfoById);
districtOverviewRouter.post("/", upload.single("image"), districtOverviewController.createDistrictInfo);
districtOverviewRouter.put("/:id", districtOverviewController.updateDistrictInfo);
districtOverviewRouter.delete("/:id", districtOverviewController.deleteDistrictInfo);

export default districtOverviewRouter;
