import { BrowserRouter, Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import AddDistrictInfo from "./pages/dashboard/AddDistrictInfo";
import { AuthProvider } from "./contexts/auth.context";
import Login from "./pages/Login";
import DashboardNav from "./pages/dashboard/DashboardNav";
import Profile from "./pages/dashboard/Profile";
import RequireAuth from "./routes/PrivateRoute";

function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <Routes>
          <Route index element={<Home />} />
          <Route path="login" element={<Login />} />
          <Route
            path="dashboard"
            element={
              <RequireAuth>
                <DashboardNav />
              </RequireAuth>
            }
          >
            <Route index element={<Profile />} />
            <Route path="profile" element={<Profile />} />
          </Route>
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  );
}

export default App;
