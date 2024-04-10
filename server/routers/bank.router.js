import express from "express";
import { bankController } from "../controllers/bank.controller.js";

const bankRouter = express.Router();

bankRouter.get("/", bankController.getBanks);
bankRouter.get("/:id", bankController.getBankById);
bankRouter.post("/", bankController.createBank);
bankRouter.put("/:id", bankController.updateBank);
bankRouter.delete("/:id", bankController.deleteBank);

export default bankRouter;
