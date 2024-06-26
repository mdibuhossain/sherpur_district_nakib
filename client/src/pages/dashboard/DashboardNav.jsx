import { useContext } from "react";
import { Outlet, NavLink } from "react-router-dom";
import { AuthContext } from "../../contexts/auth.context";
import { ADMIN_NAVs, USER_NAVs, COMMON_NAVs } from "../../utils/links";
import DashboardLayout from "./layout";

const NavListView = (NavList) => {
  return NavList.map((nav) => (
    <NavLink
      key={nav.path}
      //   className="p-1 ps-2 hover:bg-gray-400 rounded-md overflow-hidden"
      className={({ isActive }) =>
        isActive
          ? "p-1 ps-2 hover:bg-gray-400 rounded-md overflow-hidden bg-gray-400"
          : "p-1 ps-2 hover:bg-gray-400 rounded-md overflow-hidden"
      }
      to={nav.path}
    >
      {nav.name}
    </NavLink>
  ));
};

const DashboardNav = () => {
  const { user, logout } = useContext(AuthContext);
  return (
    <div>
      <div className="flex flex-row w-full">
        {/* Slidebar */}
        <div className="flex w-[300px] h-screen">
          {/* slidebar innner floating bar */}
          <div className="p-3 m-3 w-full bg-[#1c2333] rounded-lg overflow-y-auto relative space-y-2">
            <div className="p-1 ps-2 text-white font-extrabold text-4xl mb-10">
              শেরপুর
            </div>
            <div className="flex flex-col gap-y-2 font-light text-white overflow-auto">
              {NavListView(COMMON_NAVs)}
              {user?.role === "ADMIN" ? NavListView(ADMIN_NAVs) : null}
              {user?.role === "USER" ? NavListView(USER_NAVs) : null}
            </div>
            <button
              onClick={logout}
              className="font-semibold p-1 px-3 hover:bg-gray-400 bg-gray-300 rounded-md overflow-hidden  bottom-3"
            >
              Logout
            </button>
          </div>
        </div>
        {/* Dynamic page */}
        <DashboardLayout>
          <Outlet />
        </DashboardLayout>
      </div>
    </div>
  );
};

export default DashboardNav;
