import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import helmet from "helmet";
import cookieParser from "cookie-parser";
import path from "path";
import { fileURLToPath } from "url";
import authRouter from "./routers/auth.router.js";
import districtOverviewRouter from "./routers/district.overview.router.js";
import multer from "multer";
import blogRouter from "./routers/blog.router.js";
import bankRouter from "./routers/bank.router.js";
import educationPlaceRouter from "./routers/education.place.router.js";
import hospitalRouter from "./routers/hospital.router.js";
import restaurantRouter from "./routers/restaurant.router.js";
import touristSpotRouter from "./routers/touristspot.router.js";
import upazilaRouter from "./routers/upazila.router.js";
import mailRouter from "./routers/mail.router.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const app = express();
dotenv.config();

app.use(
  cors({
    credentials: true,
    origin: true,
  })
);
app.use(helmet());
app.use(cookieParser());
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

app.use("/api/auth", authRouter);
app.use("/api/bank", bankRouter);
app.use("/api/blog", blogRouter);
app.use("/api/district-info", districtOverviewRouter);
app.use("/api/education-place", educationPlaceRouter);
app.use("/api/hospital", hospitalRouter);
app.use("/api/restaurant", restaurantRouter);
app.use("/api/touristspot", touristSpotRouter);
app.use("/api/upazila", upazilaRouter);
app.use("/api/mail", mailRouter);

app.get("/", (req, res) => {
  res.send("Server is ready");
});

app.use((err, req, res, next) => {
  if (err) {
    if (err instanceof multer.MulterError) {
      res.status(500).send(err.message);
    } else {
      res.status(500).send(err.message);
    }
  } else {
    res.send("success");
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

export default app;