import axios from "axios";
import { useEffect, useState } from "react";
import { NavLink } from "react-router-dom";
import { Carousel } from "flowbite-react";

const Home = () => {
  const [blogs, setBlogs] = useState([]);
  const [loading, setLoading] = useState(true);
  console.log(blogs);
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
        <div className="flex justify-between">
          <div className="w-1/2 h-[400px]">
            <Carousel slideInterval={10000}>
              {blogs.map((blog) => (
                <div key={blog.id}>
                  <div className="w-full h-full overflow-hidden relative">
                    <div className="absolute bottom-24 left-14 z-50 text-white font-bold">
                      <p className="text-3xl ">{blog.postTitle}</p>
                      <p className="font-normal">
                        {new Date(blog.createdAt).toDateString()}
                      </p>
                    </div>
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
          <div className="grid grid-cols-2">
            <div>cal</div>
            <div>cal</div>
            <div>cal</div>
            <div>cal</div>
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
                <div className="w-28 h-20 overflow-hidden">
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
    <>
      <hr />
      <p className="font-bold text-indigo-700">{children}</p>
      <hr />
    </>
  );
};

export default Home;
