import express from "express";
import { blogController } from "../controllers/blog.controller.js";

const blogRouter = express.Router();

blogRouter.get("/", blogController.getAllBlogs);
blogRouter.get("/:id", blogController.getBlog);
blogRouter.put("/:id", blogController.updateBlog);
blogRouter.delete("/:id", blogController.deleteBlog);

export default blogRouter;
