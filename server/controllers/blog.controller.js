import prisma from "../db/db.config.js";

export class blogController {
  static async getAllBlogs(req, res) {
    try {
      const blogs = await prisma.post.findMany();
      res.status(200).json(blogs);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }
  static async updateBlog(req, res) {
    try {
      const { id: _id } = req.params;
      const blog = req.body;
      if (!mongoose.Types.ObjectId.isValid(_id))
        return res.status(404).send("No blog with that id");
      const updatedBlog = await prisma.post.findByIdAndUpdate(
        _id,
        { ...blog, _id },
        { new: true }
      );
      res.json(updatedBlog);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }
  static async deleteBlog(req, res) {
    try {
      const { id } = req.params;
      await prisma.post.delete({
        where: {
          id: parseInt(id),
        },
      });
      res.status(204).json();
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }
}
