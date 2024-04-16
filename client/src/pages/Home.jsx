import axios from "axios";
import { useEffect, useState } from "react";
import { NavLink, useNavigate } from "react-router-dom";
import { Carousel } from "flowbite-react";

const Home = () => {
  const navigate = useNavigate();
  const [blogs, setBlogs] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchPosts = async () => {
      setLoading(true);
      try {
        axios
          .get(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/blog`)
          .then((res) => {
            setBlogs(res.data);
          })
          .catch((error) => {
            console.log(error);
          })
          .finally(() => setLoading(false));
      } catch (error) {
        console.log(error);
        setLoading(false);
      }
    };
    fetchPosts();
  }, []);

  return (
    <div>
      {loading ? (
        <p>Loading...</p>
      ) : (
        <div className="grid grid-cols-2 gap-4">
          <div className="h-[400px]">
            <Carousel slideInterval={1000}>
              {blogs.map((blog) => (
                <div
                  key={blog.id}
                  onClick={() => navigate(`/post/${blog?.id}`)}
                >
                  <div className="w-full h-full overflow-hidden relative">
                    <NavLink
                      to={`/post/${blog.id}`}
                      className="absolute bottom-24 left-14 z-50 text-white font-bold hover:text-yellow-200"
                    >
                      <div className="">
                        <p className="text-3xl ">{blog.postTitle}</p>
                        <p className="font-normal">
                          {new Date(blog.createdAt).toDateString()}
                        </p>
                      </div>
                    </NavLink>
                    <div className="absolute top-0 left-0 bg-gray-900 opacity-60 w-full h-full z-20" />
                    <img
                      className="h-[400px] w-full hover:scale-110 hover:-rotate-1 transition-transform duration-500 ease-in-out -z-10"
                      src={`${import.meta.env.VITE_APP_PUBLIC_SERVER}/images/${blog.bannerImg}`}
                      crossOrigin="anonymous"
                      alt="banner"
                    />
                  </div>
                </div>
              ))}
            </Carousel>
          </div>
          <div className="grid grid-cols-2 grid-rows-2 gap-2 h-[400px] overflow-hidden">
            {blogs?.slice(0, 3)?.map((blog) => (
              <div
                key={blog.id}
                className="h-full rounded-md overflow-hidden cursor-pointer group relative"
                onClick={() => navigate(`/post/${blog?.id}`)}
              >
                <div className="overflow-hidden relative h-full ">
                  <div className="w-full h-full absolute top-0 left-0 bg-gradient-to-t from-gray-900   opacity-80 group-hover:z-10" />
                  <NavLink
                    to={`/post/${blog.id}`}
                    className="absolute bottom-8 left-8 text-white font-bold hover:text-yellow-200 group-hover:z-10"
                  >
                    <div className="">
                      <p className="">{blog.postTitle}</p>
                      <p className="text-xs font-normal">
                        {new Date(blog.createdAt).toDateString()}
                      </p>
                    </div>
                  </NavLink>
                  <img
                    className="object-scale-down group-hover:scale-110 group-hover:-rotate-1 transition-transform duration-500 ease-in-out -z-10"
                    src={`${import.meta.env.VITE_APP_PUBLIC_SERVER}/images/${blog.bannerImg}`}
                    crossOrigin="anonymous"
                    alt="banner"
                  />
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      <Title>শেরপুর জেলার পরিচিতি</Title>
      {loading ? (
        <p>Loading...</p>
      ) : (
        <div className="grid grid-cols-4 gap-3 mt-3">
          {blogs.map((blog) => (
            <div key={blog.id}>
              <div className="flex space-x-2">
                <div
                  className="w-28 h-20 overflow-hidden cursor-pointer rounded-md"
                  onClick={() => navigate(`/post/${blog?.id}`)}
                >
                  <img
                    className="w-full h-full hover:scale-110 hover:-rotate-1 transition-transform duration-500 ease-in-out"
                    src={`${import.meta.env.VITE_APP_PUBLIC_SERVER}/images/${blog.bannerImg}`}
                    crossOrigin="anonymous"
                    alt="banner"
                  />
                </div>
                <div className="">
                  <NavLink
                    to={`/post/${blog.id}`}
                    className="hover:text-indigo-500"
                  >
                    <p className="text-sm ">{blog.postTitle}</p>
                  </NavLink>
                  <p className="text-xs text-gray-400 font-medium">
                    {new Date(blog.createdAt).toDateString()}
                  </p>
                  <p className="text-xs text-gray-400 font-medium">
                    {blog.author.username}
                  </p>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

const Title = ({ children }) => {
  return (
    <div className="mt-6 mb-3">
      <hr />
      <p className="font-bold text-indigo-700">{children}</p>
      <hr />
    </div>
  );
};

export default Home;
