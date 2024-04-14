import express from "express";
import { bankController } from "../controllers/bank.controller.js";
import upload from "../middlewares/multer.middleware.js";
import { authMiddleware } from "../middlewares/auth.middleware.js";

const bankRouter = express.Router();

bankRouter.get("/", bankController.getBanks);
bankRouter.get("/:id", bankController.getBankById);
bankRouter.post("/", authMiddleware, upload.single("image"), bankController.createBank);
bankRouter.put("/:id", authMiddleware, upload.single("image"), bankController.updateBank);
bankRouter.delete("/:id", authMiddleware, bankController.deleteBank);

export default bankRouter;
