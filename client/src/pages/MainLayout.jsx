import { Avatar, Button, Dropdown, Navbar } from "flowbite-react";
import { useContext, useEffect, useState } from "react";
import { AuthContext } from "../contexts/auth.context";
import { Link, NavLink, Outlet, useNavigate } from "react-router-dom";
import axios from "axios";

const MainLayout = () => {
  const { user, logout } = useContext(AuthContext);
  const navigate = useNavigate();
  const [allInfos, setAllInfos] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchAllInfos = async () => {
      setLoading(true);
      try {
        axios
          .get(
            `${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/district-info/all`
          )
          .then((res) => {
            setAllInfos(res.data);
          })
          .catch((error) => {
            console.error(error);
          })
          .finally(() => setLoading(false));
      } catch (error) {
        console.error(error);
        setLoading(false);
      }
    };
    fetchAllInfos();
  }, []);
  console.log(allInfos);
  return (
    <div className="mx-auto">
      <div className="flex flex-col h-screen">
        <div>
          <Navbar fluid rounded>
            <Navbar.Brand>
              <NavLink
                to="/"
                className="flex items-center space-x-3 rtl:space-x-reverse"
              >
                <img
                  src="https://flowbite.com/docs/images/logo.svg"
                  className="h-8"
                  alt="Flowbite Logo"
                />
                <span className="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">
                  শেরপুর
                </span>
              </NavLink>
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
                    <Dropdown.Item onClick={() => navigate("dashboard")}>
                      Dashboard
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
            <Navbar.Collapse className="relative z-50">
              <Dropdown
                inline
                label="শেরপুর জেলার পরিচিতি"
                className="shadow-xl bg-gray-200"
              >
                {allInfos?.districtIntro?.map((info) => (
                  <Dropdown.Item
                    key={info.id}
                    onClick={() =>
                      info?.postId && navigate(`/post/${info?.postId}`)
                    }
                  >
                    {info.title}
                  </Dropdown.Item>
                ))}
              </Dropdown>
              <Dropdown inline label="উপজেলা" className="shadow-xl bg-gray-200">
                {allInfos?.upazila?.map((info) => (
                  <Dropdown.Item
                    key={info.id}
                    onClick={() =>
                      info?.postId && navigate(`/post/${info?.postId}`)
                    }
                  >
                    {info.name}
                  </Dropdown.Item>
                ))}
              </Dropdown>
              <Dropdown
                label="দর্শনীয় স্থান"
                inline
                className="shadow-xl bg-gray-200"
                dismissOnClick={false}
              >
                {allInfos?.upazila?.map(
                  (info) =>
                    info.touristSpots.length > 0 && (
                      <Dropdown.Item key={info.id}>
                        <Dropdown
                          inline
                          label={info.name}
                          className="shadow-xl bg-gray-200"
                        >
                          {info.touristSpots.map((spot) => (
                            <Dropdown.Item
                              key={spot.id}
                              onClick={() =>
                                spot?.postId &&
                                navigate(`/post/${spot?.postId}`)
                              }
                            >
                              {spot.name}
                            </Dropdown.Item>
                          ))}
                        </Dropdown>
                      </Dropdown.Item>
                    )
                )}
              </Dropdown>
              {/* <Dropdown
                label="ব্যাংক"
                inline
                className="shadow-xl bg-gray-200"
                dismissOnClick={false}
              >
                {allInfos?.upazila?.map(
                  (info) =>
                    info.banks.length > 0 && (
                      <Dropdown.Item key={info.id}>
                        <Dropdown
                          inline
                          label={info.name}
                          className="shadow-xl bg-gray-200"
                        >
                          {info.banks.map((item) => (
                            <Dropdown.Item
                              key={item.id}
                              onClick={() =>
                                item?.postId &&
                                navigate(`/post/${item?.postId}`)
                              }
                            >
                              {item.name}
                            </Dropdown.Item>
                          ))}
                        </Dropdown>
                      </Dropdown.Item>
                    )
                )}
              </Dropdown> */}
              {/* <Dropdown
                label="রেস্তোরাঁ"
                inline
                className="shadow-xl bg-gray-200"
                dismissOnClick={false}
              >
                {allInfos?.upazila?.map(
                  (info) =>
                    info.restaurants.length > 0 && (
                      <Dropdown.Item key={info.id}>
                        <Dropdown
                          inline
                          label={info.name}
                          className="shadow-xl bg-gray-200"
                        >
                          {info.restaurants.map((item) => (
                            <Dropdown.Item
                              key={item.id}
                              onClick={() =>
                                item?.postId &&
                                navigate(`/post/${item?.postId}`)
                              }
                            >
                              {item.name}
                            </Dropdown.Item>
                          ))}
                        </Dropdown>
                      </Dropdown.Item>
                    )
                )}
              </Dropdown> */}
              <Dropdown
                label="হাসপাতাল"
                inline
                className="shadow-xl bg-gray-200"
                dismissOnClick={false}
              >
                {allInfos?.upazila?.map(
                  (info) =>
                    info.hospitals.length > 0 && (
                      <Dropdown.Item key={info.id}>
                        <Dropdown
                          inline
                          label={info.name}
                          className="shadow-xl bg-gray-200"
                        >
                          {info.hospitals.map((item) => (
                            <Dropdown.Item
                              key={item.id}
                              onClick={() =>
                                // item?.postId &&
                                navigate(`/hospital/${item?.id}`)
                              }
                            >
                              {item.name}
                            </Dropdown.Item>
                          ))}
                        </Dropdown>
                      </Dropdown.Item>
                    )
                )}
              </Dropdown>
              {/* <Dropdown
                label="শিক্ষা প্রতিষ্ঠান"
                inline
                className="shadow-xl bg-gray-200"
                dismissOnClick={false}
              >
                {allInfos?.upazila?.map(
                  (info) =>
                    info.educationPlaces.length > 0 && (
                      <Dropdown.Item key={info.id}>
                        <Dropdown
                          inline
                          label={info.name}
                          className="shadow-xl bg-gray-200"
                        >
                          {info.educationPlaces.map((item) => (
                            <Dropdown.Item
                              key={item.id}
                              onClick={() =>
                                item?.postId &&
                                navigate(`/post/${item?.postId}`)
                              }
                            >
                              {item.name}
                            </Dropdown.Item>
                          ))}
                        </Dropdown>
                      </Dropdown.Item>
                    )
                )}
              </Dropdown> */}
              <Navbar.Link as={NavLink} to="/contact">
                যোগাযোগ
              </Navbar.Link>
            </Navbar.Collapse>
          </Navbar>
        </div>
        <div className="px-[16px] h-screen overflow-y-auto">
          <Outlet />
        </div>
      </div>
    </div>
  );
};

export default MainLayout;
