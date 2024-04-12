import jwt from "jsonwebtoken";
import prisma from "../db/db.config.js";
import bcrypt from "bcryptjs/dist/bcrypt.js";
import { encryptPass } from "../utils/utils.js";

export class authController {
  static async login(req, res) {
    try {
      const { username, password } = req.body;
      const findUser = await prisma.user.findUnique({
        where: { username },
      });
      if (!findUser) {
        return res.status(400).json({ errors: "Invalid credentials" });
      }
      if (!bcrypt.compareSync(password, findUser.password)) {
        return res.status(400).json({ errors: "Invalid credentials" });
      } else {
        const token = jwt.sign({ id: findUser.id }, process.env.JWT_SECRET, {
          expiresIn: "7d",
        });
        res.cookie("token", token, {
          httpOnly: true,
          maxAge: 1000 * 60 * 60 * 24 * 7,
        });
        // console.log(findUser);
        return res.status(200).json({ message: "Login successful" });
      }
    } catch (error) {
      res.status(500).json({ errors: error.message });
    }
  }
  static async register(req, res) {
    try {
      const payload = req.body;
      const findUser = await prisma.user.findUnique({
        where: { username: payload.username },
      });
      if (findUser) {
        return res.status(400).json({ errors: "User already exists" });
      }
      payload.password = encryptPass(payload.password);
      const newUser = await prisma.user.create({
        data: payload,
      });
      return res.status(201).json({ message: "success" });
    } catch (error) {
      res.status(500).json({ errors: error.message });
    }
  }
  static async logout(req, res) {
    try {
      res.cookie("token", "", {
        maxAge: 0,
      });
      return res.status(200).json({ message: "Logout successful" });
    } catch (error) {
      return res.status(500).json({ errors: error.messages });
    }
  }
  static async profile(req, res) {
    try {
      const findUser = await prisma.user.findUnique({
        where: { id: req.user.id },
      });
      const { password, ...result } = findUser;
      return res.status(200).json(result);
    } catch (error) {
      return res.status(500).json({ errors: error.messages });
    }
  }
}
