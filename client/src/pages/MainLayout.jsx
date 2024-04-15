import { Avatar, Button, Dropdown, Navbar } from "flowbite-react";
import { useContext } from "react";
import { AuthContext } from "../contexts/auth.context";
import { Link, Outlet } from "react-router-dom";

const MainLayout = () => {
  const { user, logout } = useContext(AuthContext);
  return (
    <div className="max-w-screen-lg mx-auto">
      <div className="flex flex-col">
        <div>
          <Navbar fluid rounded>
            <Navbar.Brand href="https://flowbite-react.com">
              <a
                href="#"
                className="flex items-center space-x-3 rtl:space-x-reverse"
              >
                <img
                  src="https://flowbite.com/docs/images/logo.svg"
                  className="h-8"
                  alt="Flowbite Logo"
                />
                <span className="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">
                  Flowbite
                </span>
              </a>
            </Navbar.Brand>
            <div className="flex md:order-2">
              {user ? (
                <>
                  <Dropdown
                    arrowIcon={false}
                    inline
                    label={
                      <Avatar
                        alt="User settings"
                        img="https://flowbite.com/docs/images/people/profile-picture-5.jpg"
                        rounded
                      />
                    }
                  >
                    <Dropdown.Header>
                      <span className="block text-sm">{user?.name}</span>
                      <span className="block truncate text-sm font-medium">
                        {user?.username}
                      </span>
                    </Dropdown.Header>
                    <Dropdown.Item>
                      <Link to="dashboard" className="font-normal">
                        Dashboard
                      </Link>
                    </Dropdown.Item>
                    <Dropdown.Divider />
                    <Dropdown.Item onClick={logout}>Sign out</Dropdown.Item>
                  </Dropdown>
                  <Navbar.Toggle />
                </>
              ) : (
                <Link to="login">
                  <Button outline gradientDuoTone="tealToLime" size="xs">
                    Login
                  </Button>
                </Link>
              )}
            </div>
            <Navbar.Collapse>
              <Navbar.Link href="#" active>
                Home
              </Navbar.Link>
              <Navbar.Link href="#">About</Navbar.Link>
              <Navbar.Link href="#">Services</Navbar.Link>
              <Navbar.Link href="#">Pricing</Navbar.Link>
              <Navbar.Link href="#">Contact</Navbar.Link>
            </Navbar.Collapse>
          </Navbar>
        </div>
        <div className="px-[16px]">
          <Outlet />
        </div>
      </div>
    </div>
  );
};

export default MainLayout;
