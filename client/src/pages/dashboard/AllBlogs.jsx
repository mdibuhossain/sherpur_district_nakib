import React from "react";
import axios from "axios";
import DashboardLayout from "./layout";

const AllBlogs = () => {
  const [blogs, setBlogs] = React.useState([]);
  const [loading, setLoading] = React.useState(false);
  
  React.useEffect(() => {
    setLoading(true);
    fetch(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/blog`)
      .then((res) => res.json())
      .then((data) => {
        setBlogs(data);
        setLoading(false);
      });
  }, []);

  const handleDelete = async (id) => {
    try {
      axios
        .delete(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/blog/${id}`, {
          withCredentials: true,
        })
        .then((res) => {
          console.log(res);
          if (res.status === 204) {
            const newDistrictInfoList = blogs.filter((info) => info.id !== id);
            setBlogs(newDistrictInfoList);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    } catch (error) {
      console.log(error.message);
    }
  };

  return (
    <>
      <h2 className="mb-6 text-center text-3xl font-bold text-gray-900">
        সকল ব্লগ
      </h2>
      {blogs.length > 0 ? (
        <table className="border-separate w-full border-spacing-y-2 text-sm">
          <thead className="text-left">
            <tr>
              <th className="ps-4">ID</th>
              <th className="ps-4">Post Title</th>
              <th className="ps-4">Visible</th>
              <th className="ps-4">Actions</th>
            </tr>
          </thead>
          <tbody>
            {blogs.map((blog) => (
              <tr key={blog.id}>
                <td className="td-class">{blog.id}</td>
                <td className="td-class">{blog.postTitle}</td>
                <td className="td-class">{blog.isVisible ? "Yes" : "No"}</td>
                <td className="td-class flex space-x-3">
                  <button onClick={() => handleDelete(blog.id)}>
                    <svg
                      clipRule="evenodd"
                      fillRule="evenodd"
                      strokeLinejoin="round"
                      strokeMiterlimit="2"
                      viewBox="0 0 24 24"
                      width="24"
                      height="24"
                      fill="currentColor"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="m11.25 6c.398 0 .75.352.75.75 0 .414-.336.75-.75.75-1.505 0-7.75 0-7.75 0v12h17v-8.75c0-.414.336-.75.75-.75s.75.336.75.75v9.25c0 .621-.522 1-1 1h-18c-.48 0-1-.379-1-1v-13c0-.481.38-1 1-1zm-2.011 6.526c-1.045 3.003-1.238 3.45-1.238 3.84 0 .441.385.626.627.626.272 0 1.108-.301 3.829-1.249zm.888-.889 3.22 3.22 8.408-8.4c.163-.163.245-.377.245-.592 0-.213-.082-.427-.245-.591-.58-.578-1.458-1.457-2.039-2.036-.163-.163-.377-.245-.591-.245-.213 0-.428.082-.592.245z"
                        fillRule="nonzero"
                      />
                    </svg>
                  </button>
                  <button onClick={() => handleDelete(blog.id)}>
                    <svg
                      clipRule="evenodd"
                      fillRule="evenodd"
                      strokeLinejoin="round"
                      strokeMiterlimit="2"
                      viewBox="0 0 24 24"
                      width="24"
                      height="24"
                      fill="currentColor"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="m4.015 5.494h-.253c-.413 0-.747-.335-.747-.747s.334-.747.747-.747h5.253v-1c0-.535.474-1 1-1h4c.526 0 1 .465 1 1v1h5.254c.412 0 .746.335.746.747s-.334.747-.746.747h-.254v15.435c0 .591-.448 1.071-1 1.071-2.873 0-11.127 0-14 0-.552 0-1-.48-1-1.071zm14.5 0h-13v15.006h13zm-4.25 2.506c-.414 0-.75.336-.75.75v8.5c0 .414.336.75.75.75s.75-.336.75-.75v-8.5c0-.414-.336-.75-.75-.75zm-4.5 0c-.414 0-.75.336-.75.75v8.5c0 .414.336.75.75.75s.75-.336.75-.75v-8.5c0-.414-.336-.75-.75-.75zm3.75-4v-.5h-3v.5z"
                        fillRule="nonzero"
                      />
                    </svg>
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : (
        <p className="bg-gray-100 ps-2 rounded-md">কোন তথ্য পাওয়া যায়নি</p>
      )}
    </>
  );
};

export default AllBlogs;
