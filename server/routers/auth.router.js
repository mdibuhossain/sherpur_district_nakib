import express from "express";
import { authController } from "../controllers/auth.controller.js";

const authRouter = express.Router();

authRouter.get("/profile", authController.profile);
authRouter.get("/logout", authController.logout);
authRouter.post("/login", authController.login);
authRouter.post("/register", authController.register);

export default authRouter;
