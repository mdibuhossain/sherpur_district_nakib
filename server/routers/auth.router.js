import express from "express";
import { authController } from "../controllers/auth.controller.js";
import { authMiddleware } from "../middlewares/auth.middleware.js";

const authRouter = express.Router();

authRouter.get("/profile", authMiddleware, authController.profile);
authRouter.get("/logout", authController.logout);
authRouter.post("/login", authController.login);
authRouter.post("/register", authController.register);

export default authRouter;
